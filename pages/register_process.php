<?php
// Path to your SQLite database file
$dbPath = '../database/database.db';

try {
    // Connect to the SQLite database
    $pdo = new PDO("sqlite:$dbPath");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Check if the form is submitted
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Retrieve form data
        $firstName = $_POST['firstName'];
        $lastName = $_POST['lastName'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $confirmpassword = $_POST['confirmpassword'];
        $address = $_POST['address'];
        $city = $_POST['city'];
        $country = $_POST['country'];
        $postalCode = $_POST['postalCode'];
        $phone = $_POST['phone'];

        // Check if the email already exists
        $stmt = $pdo->prepare("SELECT COUNT(*) FROM Users WHERE Email = :email");
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $emailExists = $stmt->fetchColumn();

        if ($emailExists > 0) {
            // Email already exists, redirect with an error message
            header("Location: registerPage.php?error=emailexists");
            exit;
        }

        if ($password != $confirmpassword) {
            header("Location: registerPage.php?error=differentpasswords");
            exit;
        }

        // Hash the password securely
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Prepare SQL statement to insert new user
        $stmt = $pdo->prepare("INSERT INTO Users (FirstName, LastName, Address, City, Country, PostalCode, Phone, Email, Password) VALUES (:firstName, :lastName, :address, :city, :country, :postalCode, :phone, :email, :password)");
        $stmt->bindParam(':firstName', $firstName);
        $stmt->bindParam(':lastName', $lastName);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':password', $hashedPassword);
        $stmt->bindParam(':address', $address);
        $stmt->bindParam(':city', $city);
        $stmt->bindParam(':country', $country);
        $stmt->bindParam(':postalCode', $postalCode);
        $stmt->bindParam(':phone', $phone);
        $stmt->execute();

        // Registration successful, redirect to login page
        header("Location: loginPage.php?success=registered");
        exit;
    }
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}
?>
