<?php
// Database credentials
$host = 'localhost';
$dbname = '25_new_schema';
$user = 'root';
$pass = 'root';

// Connect to database
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get columns from content_type_pattern
    $stmt = $pdo->query("DESCRIBE content_type_pattern");
    $columns = $stmt->fetchAll(PDO::FETCH_COLUMN);

    // Remove 'nid' column
    $columns = array_filter($columns, fn($col) => $col !== 'nid');

    foreach ($columns as $col) {
        $tableName = $col;

        // Drop if exists, then create new table
        $pdo->exec("DROP TABLE IF EXISTS `$tableName`");
        $pdo->exec("
            CREATE TABLE `$tableName` (
                nid INT,
                `$col` TEXT
            )
        ");

        // Insert data
        $pdo->exec("
            INSERT INTO `$tableName` (nid, `$col`)
            SELECT nid, `$col` FROM content_type_pattern
        ");

        echo "Created table `$tableName` and inserted data.<br>";
    }

} catch (PDOException $e) {
    echo "Database error: " . $e->getMessage();
}
?>
