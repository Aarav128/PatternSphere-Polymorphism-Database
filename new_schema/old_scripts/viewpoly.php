<?php
// DB connection parameters
$host = 'localhost';
$user = 'root';
$password = 'root';
$database = '25_new_schema';  

// Connect to database
$conn = new mysqli($host, $user, $password, $database);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL JOIN query
$sql = "
    SELECT 
        ph.nid,
        ph.title,
        ph.author_name,
        other.field_context_value
    FROM 
        pattern_head_with_author ph
    JOIN 
        field_context_value other ON ph.nid = other.nid
";

$result = $conn->query($sql);

// Display results in HTML table
echo "<h2>Combined Table Data</h2>";

if ($result->num_rows > 0) {
    echo "<table border='1' cellpadding='8'>";
    echo "<tr><th>nid</th><th>Title</th><th>Context</th><th>Author</th></tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($row['nid']) . "</td>";
        echo "<td>" . htmlspecialchars($row['title']) . "</td>";
        echo "<td>" . htmlspecialchars($row['field_context_value']) . "</td>";
        echo "<td>" . htmlspecialchars($row['title']) . "</td>";
        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "No records found.";
}

// Close connection
$conn->close();
?>
