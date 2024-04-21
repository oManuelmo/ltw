<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/loginPageStyle.css">
    <title>LoginPage</title>
</head>
<body>
    <div class="container">
        <img src="../docs/logo-removebg-preview.png" alt="Maets" class="logo">
        <h1>Login</h1>
        <p>If you don't have an account register <a href="registerPage.php">here</a></p>
        <form action="login_process.php" method="post"> 
            <input type="email" id="email" name="email" required placeholder="E-mail adress">
            <input type="password" id="password" name="password" required placeholder="Password">
            <button type="submit">CONTINUE</button>
        </form>
        <p>When you login, you will agree with our <a href="https://youtube.com/watch?v=dQw4w9WgXcQ">Politics of privacy</a>.</p>
    </div>
</body>
</html>