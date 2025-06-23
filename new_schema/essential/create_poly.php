<?php
// Database credentials
$host = 'localhost';
$dbname = '25_new_schema';
$user = 'root';
$pass = 'root';

// Connect to database using MySQLi
$conn = new mysqli($host, $user, $pass, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get columns from content_type_pattern
$result = $conn->query("DESCRIBE content_type_pattern");
if (!$result) {
    die("Query failed: " . $conn->error);
}

$columns = [];
while ($row = $result->fetch_assoc()) {
    $columns[] = $row['Field'];
}

// Remove 'nid' column
$columns = array_filter($columns, fn($col) => $col !== 'nid');

foreach ($columns as $col) {
    $tableName = $conn->real_escape_string($col);

    // Drop if exists, then create new table
    $dropQuery = "DROP TABLE IF EXISTS `$tableName`";
    $createQuery = "
        CREATE TABLE `$tableName` (
            nid INT,
            `$col` TEXT
        )
    ";
    $insertQuery = "
        INSERT INTO `$tableName` (nid, `$col`)
        SELECT nid, `$col` FROM content_type_pattern
    ";

    if (!$conn->query($dropQuery)) {
        echo "Error dropping table `$tableName`: " . $conn->error . "<br>";
        continue;
    }

    if (!$conn->query($createQuery)) {
        echo "Error creating table `$tableName`: " . $conn->error . "<br>";
        continue;
    }

    if (!$conn->query($insertQuery)) {
        echo "Error inserting into table `$tableName`: " . $conn->error . "<br>";
        continue;
    }

    echo "Created table `$tableName` and inserted data.<br>";
}

$conn->close();
?>
