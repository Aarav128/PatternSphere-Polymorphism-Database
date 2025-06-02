<?php
// ALTER TABLE pattern_head_with_author ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;
// ALTER TABLE pattern_head_with_author DROP COLUMN id;

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = '25_new_schema';

// Create MySQL connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check if connection works
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Delete duplicates: keep the lowest id for each nid
$sql = "
DELETE t1 FROM pattern_head_with_author t1
JOIN pattern_head_with_author t2 
ON t1.nid = t2.nid 
AND t1.id > t2.id;
";

if ($conn->query($sql) === TRUE) {
    echo "Duplicate rows (by nid) deleted successfully.";
} else {
    echo "Error deleting duplicates: " . $conn->error;
}

$conn->close();
?>