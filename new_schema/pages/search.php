<?php
// --- DB CONNECTIONS ---
$host = 'localhost';
$user = 'root';
$pass = 'root';
$wordDb = '25_word_prevalence';
$patternDb = '25_new_schema';

$conn = new mysqli($host, $user, $pass, $wordDb);
$conn->set_charset("utf8mb4");
$connPattern = new mysqli($host, $user, $pass, $patternDb);
$connPattern->set_charset("utf8mb4");
?>

<!DOCTYPE html>
<html>
<head>
    <title>Pattern Search</title>
    <style>
        table { border-collapse: collapse; width: 100%; font-size: 14px; }
        th, td { border: 1px solid #ccc; padding: 6px; text-align: left; vertical-align: top; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        input[type=text] { width: 300px; padding: 5px; }
        input[type=submit] { padding: 5px 10px; }
        .highlight { background-color: yellow; font-weight: bold; }
        td.verbiage { max-width: 500px; word-wrap: break-word; }
    </style>
</head>
<body>
    <h2>Search Patterns by Keywords</h2>
    <form method="get" autocomplete="off"       >
        <input type="text" name="keywords" placeholder="Search for pattern here">
        <input type="submit" value="Search">
    </form>

<?php
if (isset($_GET['keywords']) && !empty(trim($_GET['keywords']))) {

    $keywordsRaw = $_GET['keywords'];
    $keywords = preg_split('/[\s,]+/', strtolower(trim($keywordsRaw)), -1, PREG_SPLIT_NO_EMPTY);
    $escapedKeywords = array_map([$conn, 'real_escape_string'], $keywords);

    $nidCounts = [];
    $inList = "'" . implode("','", $escapedKeywords) . "'";
    $sql = "SELECT nid, count FROM word_prevalence WHERE word IN ($inList)";
    $result = $conn->query($sql);

    while ($row = $result->fetch_assoc()) {
        $nid = (int)$row['nid'];
        $count = (int)$row['count'];
        $nidCounts[$nid] = ($nidCounts[$nid] ?? 0) + $count;
    }

    // Sort by combined prevalence
    arsort($nidCounts);

    if (!empty($nidCounts)) {
        echo "<h3>Top Patterns for keywords: " . htmlspecialchars($keywordsRaw) . "</h3>";
        echo "<table>
                <tr>
                    <th>NID</th>
                    <th>Title</th>
                    <th>Author Name</th>
                    <th>Keyword Weight</th>
                    <th>Main Verbiage</th>
                </tr>";

        foreach ($nidCounts as $nid => $totalCount) {
            $stmt = $connPattern->prepare("
                SELECT title, author_name, field_main_verbiage_value 
                FROM pattern_head_with_author
                LEFT JOIN field_main_verbiage_value 
                  ON pattern_head_with_author.nid = field_main_verbiage_value.nid
                WHERE pattern_head_with_author.nid = ?
                LIMIT 1
            ");
            $stmt->bind_param("i", $nid);
            $stmt->execute();
            $res = $stmt->get_result();
            $patternRow = $res->fetch_assoc();
            $stmt->close();

            // Prepare fields and highlight keywords
            $title = htmlspecialchars($patternRow['title'] ?? '');
            $author = htmlspecialchars($patternRow['author_name'] ?? '');
            $verbiage = htmlspecialchars($patternRow['field_main_verbiage_value'] ?? '');

            foreach ($keywords as $kw) {
                if (!empty($kw)) {
                    $title = preg_replace("/\b(" . preg_quote($kw, '/') . ")\b/i", '<span class="highlight">$1</span>', $title);
                    $author = preg_replace("/\b(" . preg_quote($kw, '/') . ")\b/i", '<span class="highlight">$1</span>', $author);
                    $verbiage = preg_replace("/\b(" . preg_quote($kw, '/') . ")\b/i", '<span class="highlight">$1</span>', $verbiage);
                }
            }

            echo "<tr>
                    <td>$nid</td>
                    <td>$title</td>
                    <td>$author</td>
                    <td>$totalCount</td>
                    <td class='verbiage'>$verbiage</td>
                  </tr>";
        }

        echo "</table>";
    } else {
        echo "<p>No results found for the given keywords.</p>";
    }
}

$conn->close();
$connPattern->close();
?>
</body>
</html>
