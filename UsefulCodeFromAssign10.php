<!DOCTYPE html>
<html>
<head>
    <title>Kai Jorell Danan z2003741</title>
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
    <h1>CSCI 466 Assignment 10</h1>

    <?php
    try {
        handleDatabaseCommunication();
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
    }

    function handleDatabaseCommunication() {
        connectToDatabase();
        if (userSubmittedForm("show_suppliers")) {
            createTable($pdo, "SELECT * FROM S");
        }
        if (userSubmittedForm("show_parts")) {
            createTable($pdo, "SELECT * FROM P");
        }
        if (userSubmittedForm("select_part")) {
            createTable($pdo, "SELECT S.S, S.SNAME, SP.QTY FROM S JOIN SP ON S.S = SP.S WHERE SP.P = ?", array("part_select"))
        }
        if (userSubmittedForm("select_supplier")) {
            $sql = "SELECT P.P, P.PNAME, SP.QTY
                                   FROM P
                                   JOIN SP ON P.P = SP.P
                                   WHERE SP.S = :selected_supplier""SELECT P.P, P.PNAME, SP.QTY
                                   FROM P
                                   JOIN SP ON P.P = SP.P
                                   WHERE SP.S = :selected_supplier";
            createTable($pdo, $sql, array("supplier_select"));
        }
        if (userSubmittedForm("buy_parts")) {
            runSql($pdo, "UPDATE SP SET QTY = QTY - ? WHERE S = ? AND P = ?", array("supplier_select", "part_select", "quantity"));
            echo "Parts successfully bought!";
        }
        if (userSubmittedForm("add_part")) {
            runSql($pdo, "INSERT INTO P (P, PNAME, COLOR, WEIGHT) VALUES (?, ?, ?, ?)", array("partnum", "pname", "color", "weight"));
            echo "Part added successfully!";
        }
        // Handle insertion of data into SP table
        if (userSubmittedForm("submit")) {
            //If query returned by runSQL is empty, $rowExists will be false, otherwise it will be true.
            $rowExists = runSql($pdo, "SELECT * FROM SP WHERE S = ? AND P = ?", array("supplier", "part"));
            if ($rowExists) {
                runSql($pdo, "UPDATE SP SET QTY = :quantity WHERE S = ? AND P = ?", array("supplier", "part"));
                echo "Quantity updated successfully!";
            } else {
                runSql($pdo, "INSERT INTO SP (S, P, QTY) VALUES (?, ?, ?)", array("supplier", "part", "quantity"));
                echo "New supplier-part relationship added successfully!";
            }
        }
    }

    function connectToDatabase() {
        $username = "z2003741";
        $password = "2003Jan28";
        $dsn = "mysql:host=courses;dbname=z2003741";
        $pdo = new PDO($dsn, $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

    function userSubmittedForm($formName) {
        return isset($_POST[$formName]);
    }

    function createTable($pdo, $sql, $sqlParameters=array()) {
        foreach ($sqlParameters as $param) {
            $param = $_POST[$param];
        }
        $query = runSql($pdo, $sql, $sqlParameters);

        $results = $query->fetchAll(PDO::FETCH_NUM);
        echo '<table border="1">';
        echo '<tr>';
        $columnCount = $query->columnCount();
        for ($i = 0; $i < $columnCount; $i++) {
            echo '<td>' . $query->getColumnMeta($i)['name'] . '</td>';
        }
        echo '</tr>';
        foreach ($results as $result) {
            echo "<tr>";
            for($i = 0; $i < $columnCount; $i++) {
                echo "<td>" . $result[$i] . "</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    }

    function runSql($pdo, $sql, $sqlParameters=array()) {
        if (!$sqlParameters) {
            $query = $pdo->query($sql);
        } else {
            $query = $pdo->prepare($sql);
            $query->execute($sqlParameters);
        }
        return $query;
    }

    ?>

   <!-- Sets up a form that will submit data to the PHP script that is generated using the HTTP POST method -->
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <input type="submit" name="show_suppliers" value="Show All Suppliers">
        <input type="submit" name="show_parts" value="Show All Parts">
            <h2>View Suppliers for a Part</h2>
            <label for="part_select">Select a Part:</label>
            <select name="part_select" id="part_select">
                <?php
                $parts = getAllParts($pdo);
                foreach ($parts as $part) {
                    echo "<option value='".$part['P']."'>".$part['PNAME']."</option>";
                }
                ?>
            </select>
            <input type="submit" name="select_part" value="View Suppliers">
        <h2>View Parts for a Supplier</h2>
        <label for="supplier_select">Select a Supplier:</label>
        <select name="supplier_select" id="supplier_select">
            <?php
            $suppliers = getAllSuppliers($pdo);
            foreach ($suppliers as $supplier) {
                echo "<option value='".$supplier['S']."'>".$supplier['SNAME']."</option>";
            }
            ?>
        </select>
        <input type="submit" name="select_supplier" value="View Parts">

        <h2>Buy Parts from a Supplier</h2>
        <label for="supplier_select">Select a Supplier:</label>
        <select name="supplier_select" id="supplier_select">
            <?php
            $stmt = $pdo->query("SELECT * FROM S");
            $suppliers = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($suppliers as $supplier) {
                echo "<option value='".$supplier['S']."'>".$supplier['SNAME']."</option>";
            }
            ?>
        </select>
        <br>
        <label for="part_select">Select a Part:</label>
        <select name="part_select" id="part_select">
            <?php
            $stmt = $pdo->query("SELECT * FROM P");
            $parts = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($parts as $part) {
                echo "<option value='".$part['P']."'>".$part['PNAME']."</option>";
            }
            ?>
        </select>
        <br>
        <label for="quantity">Quantity:</label>
        <!--the min and required attributes to denote the minimum value that can be in a input field
            the required attribute will not allow the data to submit if there is nothing to submit. h
            hence to indicate the user to give data-->
        <input type="number" name="quantity" id="quantity" min="1" required>
        <input type="submit" name="buy_parts" value="Buy Parts">

        <h2>Add a New Part</h2>
        <label for="partnum">Part Number:</label>
        <input type="text" name="partnum" id="partnum" required>
        <br>
        <label for="pname">Part Name:</label>
        <input type="text" name="pname" id="pname" required>
        <br>
        <label for="color">Color:</label>
        <input type="text" name="color" id="color" required>
        <br>
        <label for="weight">Weight:</label>
        <input type="text" name="weight" id="weight" required>
        <br>
        <input type="submit" name="add_part" value="Add Part">
    <h2>Supplier and Part Information</h2>
    <label for="supplier">Select a Supplier:</label>
    <select name="supplier" id="supplier">
        <!-- Options for suppliers fetched from the database -->
        <?php
        for ($i = 1; $i <= 5; $i++) {
            echo "<option value='S$i'>S $i</option>";
        }
        ?>
    </select><br><br>
    <label for="part">Select a Part:</label>
    <select name="part" id="part">
        <!-- Options for parts fetched from the database -->
        <?php
        for ($i = 1; $i <= 6; $i++) {
            echo "<option value='P$i'>P $i</option>";
        }
        ?>
    </select><br><br>
    <label for="quantity">Quantity:</label>
    <input type="number" name="quantity" id="quantity" min="1" required><br><br>
    <input type="submit" name="submit" value="Submit">
</form>
</body>
</html>
