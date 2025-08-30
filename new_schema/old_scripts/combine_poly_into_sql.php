<?php
$host = 'localhost';
$dbname = '25_new_schema';
$user = 'root';
$pass = 'root';

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
    "field_summary_graphic_fid",
    "field_summary_graphic_info_format",
    "field_summary_graphic_info_value",
    "field_summary_graphic_list",
    "field_translator_name_value",
    "field_version_value"
];

// Add additional fields from pattern_head_with_author
$extraFields = ["title", "author_name"];

$conn = new mysqli($host, $user, $pass, $dbname);
$conn->set_charset("utf8mb4");

// Create combined_data table if not exists
$createQuery = "CREATE TABLE IF NOT EXISTS combined_data (
    nid INT PRIMARY KEY,
    " . implode(", ", array_map(fn($t) => "`$t` TEXT", array_merge($tableNames, $extraFields))) . "
)";
$conn->query($createQuery);

// Fetch distinct nids from pattern_head_with_author
$nidResult = $conn->query("SELECT DISTINCT nid, title, author_name FROM pattern_head_with_author");

while ($nidRow = $nidResult->fetch_assoc()) {
    $nid = (int)$nidRow['nid'];
    $data = ["nid" => $nid];
    $hasAll = true;

    // Include title and author_name
    foreach ($extraFields as $field) {
        $data[$field] = $nidRow[$field] ?? null;
    }

    // Get data from each of the content tables
    foreach ($tableNames as $table) {
        $colName = $table;
        $result = $conn->query("SELECT `$colName` FROM `$table` WHERE nid = $nid LIMIT 1");

        if ($result && $row = $result->fetch_assoc()) {
            $data[$table] = $row[$colName];
        } else {
            $hasAll = false;
            break;
        }
    }

    if ($hasAll) {
        // Avoid duplicate insert
        $exists = $conn->query("SELECT 1 FROM combined_data WHERE nid = $nid LIMIT 1");
        if ($exists->num_rows == 0) {
            $columns = implode(", ", array_keys($data));
            $values = implode(", ", array_map(fn($v) => "'" . $conn->real_escape_string($v) . "'", $data));
            $conn->query("INSERT INTO combined_data ($columns) VALUES ($values)");
        }
    }
}

echo "Combined data from pattern_head_with_author including title and author_name.";
$conn->close();
?>
