<?php
// Database configuration
$host = 'localhost';
$dbname = '25_new_schema';
$user = 'root';
$pass = 'root';

// Path to the SQL file
$sqlFilePath = __DIR__ . '/../loaded_tables/author_name.sql';

// Connect to MySQL
$conn = new mysqli($host, $user, $pass, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Load SQL file content
$sql = file_get_contents($sqlFilePath);

if ($sql === false) {
    die("Failed to read SQL file at $sqlFilePath");
}

// Execute multi-query (in case of multiple SQL statements)
if ($conn->multi_query($sql)) {
    do {
        // Store results if there are any
        if ($result = $conn->store_result()) {
            $result->free();
        }
    } while ($conn->more_results() && $conn->next_result());

    echo "SQL file executed successfully.";
} else {
    echo "Error executing SQL: " . $conn->error;
}

// Close connection
$conn->close();
?>
