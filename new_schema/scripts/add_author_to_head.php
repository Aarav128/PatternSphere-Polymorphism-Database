<?php
// Database configuration
$host = 'localhost';
$dbname = '25_new_schema';
$user = 'root';
$pass = 'root';

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT); // Enable exceptions

try {
    // Connect
    $conn = new mysqli($host, $user, $pass, $dbname);
    $conn->set_charset("utf8mb4");

    // Drop old tables
    $conn->query("DROP TABLE IF EXISTS pattern_head_with_author");
    $conn->query("DROP TABLE IF EXISTS content_field_author_name");
    $conn->query("DROP TABLE IF EXISTS pattern_head");
    echo "Dropped existing tables (if any).<br>";

    // Load SQL files
    $patternHeadSQL = file_get_contents(__DIR__ . '/../created_tables/pattern_head.sql');
    $authorNameSQL = file_get_contents(__DIR__ . '/../loaded_tables/author_name.sql');

    if (!$patternHeadSQL || !$authorNameSQL) {
        throw new Exception("Failed to read one of the SQL files.");
    }

    // Recreate pattern_head
    $conn->multi_query($patternHeadSQL);
    while ($conn->more_results() && $conn->next_result()) {}
    echo "Created table: pattern_head<br>";

    // Recreate content_field_author_name
    $conn->multi_query($authorNameSQL);
    while ($conn->more_results() && $conn->next_result()) {}
    echo "Created table: content_field_author_name<br>";

    // Create joined table
    $createJoinTableSQL = "
        CREATE TABLE pattern_head_with_author AS
        SELECT
            ph.*,
            cfan.field_author_name_value AS author_name
        FROM pattern_head ph
        LEFT JOIN content_field_author_name cfan ON ph.nid = cfan.nid;
    ";

    $conn->query($createJoinTableSQL);
    echo "Created table: pattern_head_with_author<br>";

    $conn->close();
} catch (mysqli_sql_exception $e) {
    echo "MySQL error: " . $e->getMessage();
} catch (Exception $e) {
    echo "General error: " . $e->getMessage();
}
?>
