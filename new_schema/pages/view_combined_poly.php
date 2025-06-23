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

$conn = new mysqli($host, $user, $pass, $dbname);
$conn->set_charset("utf8mb4");

// Fetch nids, titles, author_names, and pattern_set
$nidResult = $conn->query("SELECT DISTINCT nid, title, author_name, pattern_set FROM pattern_head_with_author ORDER BY nid ASC");

// Start HTML
echo "<!DOCTYPE html><html><head><title>Combined Pattern Data</title>
<style>
    table { border-collapse: collapse; width: 100%; font-size: 12px; }
    th, td { border: 1px solid #ccc; padding: 6px; text-align: left; }
    th { background-color: #f2f2f2; position: sticky; top: 0; }
    tr:nth-child(even) { background-color: #f9f9f9; }
</style>
</head><body>";

echo "<h2>Combined Pattern Data</h2>";
echo "<table><tr><th>pattern_set</th><th>nid</th><th>title</th><th>author_name</th>";

foreach ($tableNames as $col) {
    echo "<th>$col</th>";
}
echo "</tr>";

// Loop through nids
while ($nidRow = $nidResult->fetch_assoc()) {
    $nid = (int)$nidRow['nid'];
    $rowData = [
        "pattern_set" => $nidRow["pattern_set"],
        "nid" => $nid,
        "title" => $nidRow["title"],
        "author_name" => $nidRow["author_name"],
    ];
    $hasAll = true;

    foreach ($tableNames as $table) {
        $col = $table;
        $result = $conn->query("SELECT `$col` FROM `$table` WHERE nid = $nid LIMIT 1");

        if ($result && $dataRow = $result->fetch_assoc()) {
            $rowData[$col] = $dataRow[$col];
        } else {
            $rowData[$col] = "";  // Leave blank if missing
            $hasAll = false;
        }
    }

    echo "<tr>";
    foreach (["pattern_set", "nid", "title", "author_name"] as $key) {
        echo "<td>" . htmlspecialchars($rowData[$key]) . "</td>";
    }
    foreach ($tableNames as $col) {
        echo "<td>" . htmlspecialchars($rowData[$col] ?? '') . "</td>";
    }
    echo "</tr>";
}

echo "</table></body></html>";

$conn->close();
?>
