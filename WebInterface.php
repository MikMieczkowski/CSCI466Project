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
    print_r($_POST);
    if (elementSubmitted("next")) {
        createForm2HTML($pdo);
        //create hidden tags to store form data after hitting next
        echo '<input type="hidden" name="hiddenName" value = "' . $_POST["firstName"] . ' ' . $_POST["lastName"] .  '" \>';
        echo '<input type="hidden" name="hiddenSongSelect" value = "' . $_POST["songSelect"] . '" \>';
        echo '<input type="hidden" name="hiddenMoney" value = "' . $_POST["money"] . '" \>';
    } else {
        createForm1HTML($pdo);
    }
    //handle submission of data to database
    print_r($_POST);
    if (elementSubmitted("sub")) {
        runSQL($pdo, "INSERT INTO Singer(name) VALUES (?)", array("hiddenName"));
        $singerId = $pdo->lastInsertId();
        $moneyValue = $_POST["hiddenMoney"];
        if ($moneyValue === "None") {
            $moneyValue = "NULL";
        }
        runSQL($pdo, "INSERT INTO Queue VALUES (
            $singerId,
            (SELECT songId FROM Song WHERE Title = ? AND Version = ?),
            $moneyValue)", array("hiddenSongSelect", "versionSelect"));
    }
}

function createForm1HTML($pdo) {
    echo '
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
    <p> <input type="text" name="songSearch" placeholder="Search for song by Artist, Title, or Contributor" size="40"\></p>
    ';
    createSongSelect($pdo);
    echo '<p><input type="submit" name="next" value="Next" \></p><p/>';
}

function createForm2HTML($pdo) {

    //create element that shows contributors
    $sql = "SELECT DISTINCT Name FROM Song JOIN Feature ON Song.songId = Feature.songId JOIN Contributors ON Contributors.Contributor_id = Feature.Contributor_id WHERE Title = ?";
    $stmt = runSQL($pdo, $sql, array("songSelect"));
    $rows = $stmt->fetchAll(PDO::FETCH_NUM);
    echo '<p><b>' . $_POST["songSelect"] . ' contributors: </b></p><p>' . $rows[0][0] . '</p>';

    echo '<p><b>Version</b></p>';
    createSelectFromSQL($pdo, "versionSelect", 3, 1, " ", "SELECT Title, Version FROM Song WHERE Title = ?", array("songSelect"));  

    if (elementSubmitted("money", "None")) {
        echo '<p>Payment Information: </p>';
        echo '<p>Card Number: <input type="text" readonly name="creditCardInfo" value="Not a real form" size=\></p>'; 
        echo '<p>Security Code: <input type="text" readonly name="creditCardInfo" value="Not a real form" \></p>'; 
        echo '<p>Cardholder Name: <input type="text" readonly name="creditCardInfo" value="Not a real form" \></p>'; 

    }

    echo '<p><input type="submit" name="sub" value="Sign up" \><p/>';
} 


//Creates the songSelect html element, implementing the search functionality from the songSearch element.
function createSongSelect($pdo) {
    echo '<p>';
    if (elementSubmitted("songSearch")) {
        $sql = "SELECT title, artist FROM Song JOIN Feature ON Song.songId = Feature.songId JOIN Contributors ON Contributors.Contributor_id = Feature.Contributor_id WHERE title LIKE CONCAT('%',?,'%') OR artist LIKE CONCAT('%', ?, '%') OR Name LIKE CONCAT('%', ?, '%')";
        $params = array("songSearch", "songSearch", "songSearch");
    } else {
        $sql = "SELECT title, artist FROM Song";
        $params = array();
    }
    createSelectFromSQL($pdo, "songSelect", 10, 0, " by ", $sql, $params);
    echo '</p>';
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

/* Creates an HTML select element with name $name, with the value of each option being row data separated by $separator.
 * @param $size The value for the size attribute of the select element
 * @param $optionValue An integer that describes which column of the sql output should be the value attribute of the option elements
 */
function createSelectFromSQL($pdo, $name, $size, $optionValue, $separator, $sql, $sqlParameters=array()) {
    $pdoStatement = runSQL($pdo, $sql, $sqlParameters);
    $rows = $pdoStatement->fetchAll(PDO::FETCH_NUM);

    echo "<select name=$name size= \"$size\">";

    $columnCount = $pdoStatement->columnCount();
    foreach ($rows as $row) {
        echo "<option value = \"" . $row[$optionValue] . "\">";
        for($i = 0; $i < $columnCount; $i++) {
            echo $row[$i];
            if ($i != $columnCount - 1) {
                echo $separator;
            }
        }
        echo "</option>";
    }
    echo "</select>";
}

//returns true if a html element with name $name is not empty or is not $default
function elementSubmitted($name, $default="") {
    return isset($_POST[$name]) && $_POST[$name] !== $default;
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
echo "end php";
?>
</form> 
</body>
</html>
