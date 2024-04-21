<?php
// Path to your SQLite database file
$dbPath = '../database/database.db';

try {
    // Connect to the SQLite database
    $pdo = new PDO("sqlite:$dbPath");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Check if the form is submitted
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Retrieve the email and password from the form
        $email = $_POST['email'];
        $password = $_POST['password'];
        // Prepare SQL statement to retrieve user information
        $stmt = $pdo->prepare("SELECT * FROM Users WHERE Email = :email");
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Check if user exists
        if ($user) {
            // Verify password
            if (password_verify($password, $user['Password'])) { //antes era o password_verify($password, $user['Password'])
                // Authentication successful
                // Redirect the user to a dashboard page or perform any other action
                header("Location: index.php"); // Redirect to dashboard.php
                exit; // Terminate the script
            } else {
                // Authentication failed (invalid password)
                // Redirect the user back to the login page with an error message
                header("Location: loginPage.php?error=password"); // Redirect to login.php with an error parameter
                exit; // Terminate the script
            }
        } else {
            // Authentication failed (user not found)
            // Redirect the user back to the login page with an error message
            header("Location: loginPage.php?error=email"); // Redirect to login.php with an error parameter
            exit; // Terminate the script
        }
    } else {
        // If the form is not submitted via POST method, redirect the user back to the login page
        header("Location: loginPage.php");
        exit; // Terminate the script
    }
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}
?>
