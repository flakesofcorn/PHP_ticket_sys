<?php
// Replace these values with your actual MySQL database credentials
$servername = "localhost";
$username = "admin";
$password = "admin";
$database = "ticket_system";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the user is logged in
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

// Logout functionality
if(isset($_GET['logout'])) {
    session_destroy();
    header("Location: login.php");
    exit();
}

// Handle ticket search
if(isset($_POST['search'])) {
    $ticketNumber = $_POST['ticket_number'];

    $sql = "SELECT * FROM ticket WHERE ID = '$ticketNumber'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Output data of each row
        while($row = $result->fetch_assoc()) {
            echo "Ticket Number: " . $row["id"]. "<br>";
            echo "Ticket Name: " . $row["ticketname"]. "<br>";
            echo "Ticket Status: " . $row["status"]. "<br>";
            // Add more fields as needed
        }
    } else {
        echo "No tickets found with the provided ticket number.";
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Ticket System</title>
</head>
<body>
    <h2>Welcome <?php echo $_SESSION['username']; ?></h2>
    <a href="?logout=true">Logout</a>

    <h3>Search for a Ticket</h3>
    <form method="post" action="">
        <label for="ticket_number">Ticket Number:</label><br>
        <input type="text" id="ticket_number" name="ticket_number" required><br><br>
        <input type="submit" name="search" value="Search">
    </form>
</body>
</html>
