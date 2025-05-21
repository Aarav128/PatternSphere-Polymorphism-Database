<?php
$host = 'localhost';
$user = 'root';
$password = 'root';
$database = '25_new_schema';  // change to your actual database name

// Path to the SQL file relative to this script
$sqlFile = __DIR__ . '/../content_type_pattern.sql';

// Connect to MySQL
$conn = new mysqli($host, $user, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Read the SQL file
$sql = file_get_contents($sqlFile);
if (!$sql) {
    die("Failed to read SQL file.");
}

// Execute the SQL
if ($conn->multi_query($sql)) {
    do {
        // Flush multi_query results
        if ($result = $conn->store_result()) {
            $result->free();
        }
    } while ($conn->next_result());
    echo "SQL import successful.";
} else {
    echo "Error importing SQL: " . $conn->error;
}

$conn->close();
?>
