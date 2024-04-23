<!DOCTYPE html>
<html>
<head>
    <title>CSCI 466 Karaoke</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Karaoke Sign-up</h1>
    <p>CSCI 466 Project by Jarius Ransom, Kai Danan, and Mik Mieczkowski</p>
    <p>&nbsp;</p>
    <form method="POST">
        <p>First Name &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;    Last Name </p>
        <p>
            <input type="text" name="firstName" \>
            <input type="text" name="lastName" \> 
        </p>
        <p>To have your request be played sooner, choose a donation amount! Singer with the highest donation will get their song played sooner, but the DJ will make sure to get singers without donations their spotlight too.</p> 
        <p>
            <select name="money" id="money">
                <option value="None">None</option>
                <option value="5">$5</option>
                <option value="10">$10</option>
                <option value="25">$25</option>
                <option value="50">$50</option>
            </select>
        </p>
        <input type="submit" name="sub" value="Sign up" \><p/>
        <p>Search for a song:</p><p> <input type="text" name="songSearch" \></p>

    </form> 
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
    if (elementSubmitted("songSearch")) {
        $sql = "SELECT title, artist FROM Song WHERE title LIKE CONCAT('%',?,'%') OR artist LIKE CONCAT('%', ?, '%')";
        createSelectFromSQL($pdo, "songSelect", " by ", $sql, array(songSearch, songSearch));
    } else {
        $sql = "SELECT title, artist FROM Song";
        createSelectFromSQL($pdo, "songSelect", " by ", $sql);
    }
}

/* Creates a table in the html from MariaDB output
 * @param $pdo PDO object created by connectToDatabase()
 * @param $sql SQL statement to execute
 * @param $sqlParameters Array of strings that will replace the '?' parts of $sql
*/
function createTableFromSQL($pdo, $sql, $sqlParameters=array()) {
    $pdoStatement = runSQL($pdo, $sql, $sqlParameters);
    $rows = $pdoStatement->fetchAll(PDO::FETCH_NUM);

    echo '<table border="1">';
    echo '<tr>';
    $columnCount = $pdoStatement->columnCount();
    for ($i = 0; $i < $columnCount; $i++) {
        echo '<th>' . $pdoStatement->getColumnMeta($i)['name'] . '</th>';
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

function createSelectFromSQL($pdo, $name, $separator, $sql, $sqlParameters=array()) {
    echo "hi";
    $pdoStatement = runSQL($pdo, $sql, $sqlParameters);
    $rows = $pdoStatement->fetchAll(PDO::FETCH_NUM);
    print_r($rows);

    echo '<select name=$name size= "10">';

    foreach ($rows as $row) {
        echo "<option value = \"" . $row[0] . "\">";
        echo $row[0] . $separator . $row[1];
        echo "</option>";
    }
    echo "</select>";
}

function elementSubmitted($name) {
    return isset($_POST[$name]);
}

/* Executes an SQL statement
 * @param $pdo PDO object created by connectToDatabase()
 * @param $sql SQL statement to execute
 * @param $sqlParameters Array of strings that will replace the '?' parts of $sql
 * @return A PDOStatement object prepared from $sql and $sqlParameters. Can use fetch() or fetchAll() on it to retrieve data.
*/
function runSQL($pdo, $sql, $sqlParameters=array()) {
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
