<?php
// Memulai session atau melanjutkan session yang sudah ada
session_start();

// Menyertakan kode koneksi
include "koneksi.php";

// Jika sudah login, arahkan ke halaman admin
if (isset($_SESSION['username'])) {
    header("Location: admin.php");
    exit();
}

$error_message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $password = $_POST['password'];

    // Validasi input kosong
    if (empty($username) || empty($password)) {
        $error_message = "Username dan password tidak boleh kosong.";
    } else {
        // Prepared statement untuk mengambil user berdasarkan username
        $stmt = $conn->prepare("SELECT username, password FROM user WHERE username = ?");
        if ($stmt === false) {
            die("Prepare failed: " . htmlspecialchars($conn->error));
        }

        // Binding parameter
        $stmt->bind_param("s", $username);

        // Eksekusi statement
        $stmt->execute();

        // Mendapatkan hasil
        $hasil = $stmt->get_result();
        $row = $hasil->fetch_assoc();

        // Memeriksa apakah user ada dan password cocok
        if ($row && password_verify($password, $row['password'])) {
            // Jika password cocok, simpan username pada session
            $_SESSION['username'] = $row['username'];

            // Mengalihkan ke halaman admin
            header("Location: admin.php");
            exit();
        } else {
            $error_message = "Username atau password salah.";
        }

        // Menutup koneksi
        $stmt->close();
    }
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link rel="icon" href="img/logo.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <!-- nav -->
    <nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#">Jurnal Harianku</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="index.php#hero">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php#profil">Profil</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php#article">Article</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php#jadwal">Schedule</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php#gallery">Gallery</a></li>
                    <li class="nav-item"><a class="nav-link active" href="login.php">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- /nav -->

    <!-- form -->
    <section id="login" class="text-center p-5 bg-danger-subtle">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card text-bg-light" style="max-width: 20rem;">
                        <div class="card-body">
                            <h5 class="card-title">Login</h5>
                            <p class="card-text">Welcome to My Daily Journal</p>
                            <hr />

                            <?php if (!empty($error_message)): ?>
                                <div class="alert alert-danger"> <?php echo htmlspecialchars($error_message); ?> </div>
                            <?php endif; ?>

                            <form method="post">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Username:</label>
                                    <input type="text" name="username" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password:</label>
                                    <input type="password" name="password" class="form-control" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /form -->

    <!-- footer -->
    <footer class="text-center p-5">
        <div>Muhammad Mirza Fanani &copy; 2024</div>
    </footer>
    <!-- /footer -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-aOzH6dSdTcRwNdZk8xnxgJNJnGpWeN8QxrpTANfu5PhNkI8dMyJ4t+jMuww5z5ST" crossorigin="anonymous"></script>
</body>
</html>