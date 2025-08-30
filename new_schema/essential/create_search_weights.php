<?php
// --- DATABASE CONNECTION ---
$host = 'localhost';
$user = 'root';
$pass = 'root';
$oldDb = '25_new_schema';
$newDb = '25_word_prevalence';

// words to ignore
$wordsToIgnore = [
    'and','a','as','or','the','of','to','in','on','at','for','with',
    'is','was','are','be','by','an','from','it','that','this','its'
];

$conn = new mysqli($host, $user, $pass);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");

// create new database just for this data
$conn->query("DROP DATABASE IF EXISTS `$newDb`");
$conn->query("CREATE DATABASE `$newDb` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");

// create table
$conn->select_db($newDb);
$conn->query("
    CREATE TABLE word_prevalence (
        nid INT NOT NULL,
        word VARCHAR(255) NOT NULL,
        count INT NOT NULL,
        PRIMARY KEY (nid, word)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
");

// fetching data
$conn->select_db($oldDb);

// all other feilds
$tableNames = [
    "field_author_affiliation_value",
    "field_author_id_value",
    "field_card_verbiage_format",
    "field_card_verbiage_value",
    "field_coauthor_1_affiliation_value",
    "field_coauthor_2_affiliation_value",
    "field_coauthor_2_name_value",
    "field_coauthor_3_affiliation_value",
    "field_coauthor_3_name_value",
    "field_concluding_verbiage_format",
    "field_concluding_verbiage_value",
    "field_context_format",
    "field_context_value",
    "field_created_value",
    "field_group_name_value",
    "field_invariance_value",
    "field_main_verbiage_format",
    "field_main_verbiage_value",
    "field_modified_value",
    "field_next_id_value",
    "field_parent_id_value",
    "field_preface_value",
    "field_problem_verbiage_format",
    "field_problem_verbiage_value",
    "field_subtitle_value",
    "field_summary_graphic_data",
    "field_summary_graphic_info_format",
    "field_summary_graphic_info_value",
    "field_translator_name_value",
    "field_version_value"
];

// FETCH NIDs, TITLE, AUTHOR_NAME
$nidResult = $conn->query("SELECT nid, title, author_name FROM pattern_head_with_author ORDER BY nid ASC");

// SWITCH BACK TO NEW DATABASE FOR INSERTS
$conn->select_db($newDb);

while ($nidRow = $nidResult->fetch_assoc()) {
    $nid = (int)$nidRow['nid'];
    $wordCounts = [];

    // title and author name have 20x weightage
    foreach (['title','author_name'] as $field) {
        $text = strtolower(strip_tags($nidRow[$field] ?? ''));
        $words = preg_split('/\W+/u', $text, -1, PREG_SPLIT_NO_EMPTY);
        foreach ($words as $w) {
            if (!in_array($w, $wordsToIgnore)) {
                $wordCounts[$w] = ($wordCounts[$w] ?? 0) + 20;
            }
        }
    }

    // other fields give a +1 value
    foreach ($tableNames as $table) {
        $conn->select_db($oldDb);
        $result = $conn->query("SELECT `$table` FROM `$table` WHERE nid = $nid");
        if ($result) {
            while ($row = $result->fetch_assoc()) {
                $text = strtolower(strip_tags($row[$table] ?? ''));
                $words = preg_split('/\W+/u', $text, -1, PREG_SPLIT_NO_EMPTY);
                foreach ($words as $w) {
                    if (!in_array($w, $wordsToIgnore)) {
                        $wordCounts[$w] = ($wordCounts[$w] ?? 0) + 1;
                    }
                }
            }
        }
    }

    // add to database
    $conn->select_db($newDb);
    foreach ($wordCounts as $word => $count) {
        $wordEsc = $conn->real_escape_string($word);
        $conn->query("
            INSERT INTO word_prevalence (nid, word, count)
            VALUES ($nid, '$wordEsc', $count)
            ON DUPLICATE KEY UPDATE count = count + $count
        ");
    }
}

echo "Word prevalence database built successfully!";
$conn->close();
?>
