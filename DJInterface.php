<html>
<head>
    <title>DJ Interface</title>
    <style>
        .error { color: #FF0000; }
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>CSCI 466 Karaoke DJ Interface</h1>
<?php

try {
    $pdo = connectToDatabase();
    createHTML($pdo);
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}

/* Connects to database from credentials stored in credentials.php
 * @return pdo object
 */
function connectToDatabase() {
    include 'credentials.php';
    $pdo = new PDO($dsn, $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $pdo;
}

// Main function, will create the html text that this php block is meant to create.
function createHTML($pdo) {
    createTable($pdo, "SELECT * FROM Singer");
}

/* Creates a table in the html from MariaDB output
 * @param $pdo PDO object created by connectToDatabase()
 * @param $sql SQL statement to execute
 * @param $sqlParameters Array of strings that will replace the '?' parts of $sql
*/
function createTable($pdo, $sql, $sqlParameters=array()) {
    $pdoStatement = runSql($pdo, $sql, $sqlParameters);
    $rows = $pdoStatement->fetchAll(PDO::FETCH_NUM);

    echo '<table border="1">';
    echo '<tr>';
    $columnCount = $pdoStatement->columnCount();
    for ($i = 0; $i < $columnCount; $i++) {
        echo '<td>' . $pdoStatement->getColumnMeta($i)['name'] . '</td>';
    }
    echo '</tr>';

    foreach ($rows as $row) {
        echo "<tr>";
        for($i = 0; $i < $columnCount; $i++) {
            echo "<td>" . $row[$i] . "</td>";
        }
        echo "</tr>";
    }
    echo "</table>";
}

/* Executes an SQL statement
 * @param $pdo PDO object created by connectToDatabase()
 * @param $sql SQL statement to execute
 * @param $sqlParameters Array of strings that will replace the '?' parts of $sql
 * @return A PDOStatement object prepared from $sql and $sqlParameters. Can use fetch() or fetchAll() on it to retrieve data.
*/
function runSql($pdo, $sql, $sqlParameters=array()) {
    for ($i = 0; $i < count($sqlParameters); $i++) {
        $sqlParameters[$i] = $_POST[$sqlParameters[$i]];
    }
    if (!$sqlParameters) {
        $pdoStatement = $pdo->query($sql);
    } else {
        $pdoStatement = $pdo->prepare($sql);
        $pdoStatement->execute($sqlParameters);
    }
    return $pdoStatement;
}
?>


</body>
</html>
