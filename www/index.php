<?php
$serveraddress = '10.10.20.11';
$username = 'web';
$password = 'Password&1';
$dbname = 'testdb';

$conn = new mysqli($serveraddress, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = 'SELECT id, name, email FROM users';
$result = $conn->query($sql);
echo '<h1>Welcome</h1>';
if ($result->num_rows > 0) {
    echo '<h3>Data retrieved from database '.$dbname.' at '.$serveraddress.' </h3>';
    echo '<table border=\"1\"><tr><th>ID</th><th>Name</th><th>Email</th></tr>';
    while($row = $result->fetch_assoc()) {
        echo '<tr><td>' . $row['id'] . '</td><td>' . $row['name'] . '</td><td>' . $row['email'] . '</td></tr>';
    }
    echo '</table>';
} else {
    echo '<h3>No data found</h3>';
}
$conn->close();
?>
