<?php
$host = 'localhost';
$user = 'root';
$password = 'root';
$database = '25_new_schema';

$nodeSqlPath = __DIR__ . '/../node.sql';

// Database connection
$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Optional: recreate the table
$conn->query("DROP TABLE IF EXISTS pattern_head");

$create = "
CREATE TABLE IF NOT EXISTS pattern_head (
    nid INT PRIMARY KEY,
    type VARCHAR(50),
    language VARCHAR(10),
    title TEXT
)";
if (!$conn->query($create)) {
    die("Failed to create table: " . $conn->error);
}

// Read node.sql content
$nodeContent = file_get_contents($nodeSqlPath);

// Match all INSERT INTO statements
$pattern = "/INSERT INTO `node`.*?VALUES\s*(.*?);/si";
preg_match_all($pattern, $nodeContent, $matches);

// Prepare insert statement
$insert = $conn->prepare("
    INSERT IGNORE INTO pattern_head (nid, type, language, title)
    VALUES (?, ?, ?, ?)
");

$allRows = [];
$insertedCount = 0;

foreach ($matches[1] as $valuesBlock) {
    // Break on top-level comma between grouped values
    $rows = preg_split('/\),\s*\(/', trim($valuesBlock, "();\n"));

    foreach ($rows as $row) {
        // Fix edge rows missing parentheses
        $row = trim($row);
        if ($row[0] !== '(') $row = "($row";
        if (substr($row, -1) !== ')') $row .= ")";

        // Convert SQL-style tuple to CSV-friendly string
        $row = trim($row, '()');

        // Use str_getcsv to correctly parse quoted strings and commas
        $fields = str_getcsv($row, ',', "'");

        $nid      = intval($fields[0] ?? 0);
        if ($nid > 500) {
        continue;
    }
        $type     = $fields[2] ?? '';
        $language = $fields[3] ?? '';
        $title    = $fields[4] ?? '';

        $allRows[] = [
            'nid' => $nid,
            'type' => $type,
            'language' => $language,
            'title' => $title
        ];

        // Filtered insert
        if ($type === 'pattern' && $language === 'en') {
            $insert->bind_param("isss", $nid, $type, $language, $title);
            $insert->execute();
            $insertedCount++;
        }
    }
}

$insert->close();
$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>All Parsed Nodes</title>
    <style>
        table { border-collapse: collapse; width: 90%; margin: 2rem auto; }
        th, td { border: 1px solid #ccc; padding: 8px 12px; text-align: left; }
        th { background-color: #f4f4f4; }
        h2, p { text-align: center; }
    </style>
</head>
<body>
    <h2>All Parsed Node Entries from node.sql</h2>
    <p>Showing all rows. Inserted <?= $insertedCount ?> rows into <code>pattern_head</code>.</p>
    <table>
        <thead>
            <tr>
                <th>nid</th>
                <th>type</th>
                <th>language</th>
                <th>title</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($allRows as $row): ?>
                <tr>
                    <td><?= htmlspecialchars($row['nid']) ?></td>
                    <td><?= htmlspecialchars($row['type']) ?></td>
                    <td><?= htmlspecialchars($row['language']) ?></td>
                    <td><?= htmlspecialchars($row['title']) ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>
