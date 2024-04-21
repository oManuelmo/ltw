<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/registerPageStyle.css">
    <title>RegisterPage</title>
</head>
<body>
    <div class="container">
        <img src="../docs/logo-removebg-preview.png" alt="Maets" class="logo">
        <h1>Register</h1>
        <p>If you already have an account login <a href="loginPage.php">here</a></p>
        <form action="register_process.php" method="post"> 
            <input type="text" id="firstName" name="firstName" required placeholder="First Name">
            <input type="text" id="lastName" name="lastName" required placeholder="Last Name">
            <input type="email" id="email" name="email" required placeholder="E-mail address">
            <input type="text" id="address" name="address" required placeholder="Address">
            <input type="text" id="country" name="country" required placeholder="Country">
            <input type="text" id="city" name="city" required placeholder="City">
            <input type="text" id="postalcode" name="postalcode" required placeholder="Postal Code">
            <input type="text" id="phone" name="phone" required placeholder="Phone Number">
            <input type="password" id="password" name="password" required placeholder="Password">
            <input type="password" id="confirmpassword" name="confirmpassword" required placeholder="Confirm password">
            <button type="submit">CONTINUE</button>
        </form>
        <p>When you login, you will agree with our <a href="https://youtube.com/watch?v=dQw4w9WgXcQ">Politics of privacy</a>.</p>
    </div>
</body>
</html>