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
    //  PDO connection
    $username = "z2003741";
    try {
        $dsn = "mysql:host=courses;dbname=z2003741";
        $pdo = new PDO($dsn, $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $e) {
        echo "Connection to database failed: " . $e->getMessage();
    }
/*                                  FUNCTION notes
-DBQ Functions
    The get functions retrieve data from the DB as the execute SQL queries via FETCH ALL

-Buy Function
    Handles process to remove data from the DP as it updates the quantity of the parts
    as it takes supp ID and prt ID as paraneters
-Add Function
    Adding new parts into the DP with insert statement
-Error Handle
    if and exception occors during the exe of the SQL it will provide an error message to the user
-PDO Usage
    PDO in these fucntions provides CONSISTENT accessing of DP to allow secure exe of SQL
-General Function Workflow
    Prepare statement of SQL
    EXE of Prepare Statement
    Query and or Execute
    FetchALL(only for ALL function)
    User Feedback VIA echo
*/  
    // fetch all suppliers function
    function getAllSuppliers($pdo) {
        $stmt = $pdo->query("SELECT * FROM S");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // fetch all parts function
    function getAllParts($pdo) {
        $stmt = $pdo->query("SELECT * FROM P");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // handle buying parts
    function buyParts($pdo, $supplier, $part, $quantity) {
        try {
            $stmt = $pdo->prepare("UPDATE SP SET QTY = QTY - :quantity WHERE S = :supplier AND P = :part");
            $stmt->execute(['quantity' => $quantity, 'supplier' => $supplier, 'part' => $part]);
            echo "Parts successfully bought!";
        } catch(PDOException $e) {
         echo "Error: " . $e->getMessage();
        }
    
    }

    // add new parts
    function addPart($pdo, $partnum, $pname, $color, $weight) {
        try {
            $stmt = $pdo->prepare("INSERT INTO P (P, PNAME, COLOR, WEIGHT) VALUES (:partnum, :pname, :color, :weight)");
            $stmt->execute(['partnum' => $partnum, 'pname' => $pname, 'color' => $color, 'weight' => $weight]);
            echo "Part added successfully!";
        } catch(PDOException $e) {
            echo "Error: " . $e->getMessage();
    }
    }

            /*              DISPLAY and Handle Data general Workflow

                Displaing:

                    Checking the Button is Pressed
                    Fetch all Data using PDO functions
                    Display Table
                    Iterate via FOREACH

                Handling:

                    If Button has updated
                    Make new vairables to pass the user-selected valyes to the PDO function
                    Call Functions that update or insert data

            */

    // show all suppliers
    if(isset($_POST["show_suppliers"])) {
        $suppliers = getAllSuppliers($pdo);
        echo "<h2>All Suppliers</h2>";
        echo "<table>";
        echo "<tr><th>Supplier Number</th><th>Supplier Name</th><th>Status</th><th>City</th></tr>";
        foreach($suppliers as $supplier) {
            echo "<tr><td>".$supplier['S']."</td><td>".$supplier['SNAME']."</td><td>".$supplier['STATUS']."</td><td>".$supplier['CITY']."</td></tr>";
        }
        echo "</table>";
    }

    // show all parts
    if(isset($_POST["show_parts"])) {
        $parts = getAllParts($pdo);
        echo "<h2>All Parts</h2>";
        echo "<table>";
        echo "<tr><th>Part Number</th><th>Part Name</th><th>Color</th><th>Weight</th></tr>";
        foreach($parts as $part) {
            echo "<tr><td>".$part['P']."</td><td>".$part['PNAME']."</td><td>".$part['COLOR']."</td><td>".$part['WEIGHT']."</td></tr>";
        }
        echo "</table>";
    }
    
    // show suppliers for selected part
    if(isset($_POST["select_part"])) {
        $selected_part = $_POST["part_select"];
        $stmt = $pdo->prepare("SELECT S.S, S.SNAME, SP.QTY
                               FROM S
                               JOIN SP ON S.S = SP.S
                               WHERE SP.P = :selected_part");
        $stmt->execute(['selected_part' => $selected_part]);
        $suppliers = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Display part information
        $stmt = $pdo->prepare("SELECT * FROM P WHERE P = :selected_part");
        $stmt->execute(['selected_part' => $selected_part]);
        $part_info = $stmt->fetch(PDO::FETCH_ASSOC);

        echo "<h2>Suppliers for ".$part_info['PNAME']."</h2>";
        echo "<table>";
        echo "<tr><th>Supplier Number</th><th>Supplier Name</th><th>Quantity Available</th></tr>";
        foreach($suppliers as $supplier) {
            echo "<tr><td>".$supplier['S']."</td><td>".$supplier['SNAME']."</td><td>".$supplier['QTY']."</td></tr>";
        }
        echo "</table>";
    }

    // show parts supplied by selected supplier
    if(isset($_POST["select_supplier"])) {
        $selected_supplier = $_POST["supplier_select"];
        $stmt = $pdo->prepare("SELECT P.P, P.PNAME, SP.QTY
                               FROM P
                               JOIN SP ON P.P = SP.P
                               WHERE SP.S = :selected_supplier");
        $stmt->execute(['selected_supplier' => $selected_supplier]);
        $parts = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Display supplier information
        $stmt = $pdo->prepare("SELECT * FROM S WHERE S = :selected_supplier");
        $stmt->execute(['selected_supplier' => $selected_supplier]);
        $supplier_info = $stmt->fetch(PDO::FETCH_ASSOC);

        echo "<h2>Parts Supplied by ".$supplier_info['SNAME']."</h2>";
        echo "<table>";
        echo "<tr><th>Part Number</th><th>Part Name</th><th>Quantity Available</th></tr>";
        foreach($parts as $part) {
            echo "<tr><td>".$part['P']."</td><td>".$part['PNAME']."</td><td>".$part['QTY']."</td></tr>";
        }
        echo "</table>";
    }

    // handle bought parts
    if(isset($_POST["buy_parts"])) {
    $selected_supplier = $_POST["supplier_select"];
    $selected_part = $_POST["part_select"];
    $quantity = $_POST["quantity"];

    buyParts($pdo, $selected_supplier, $selected_part, $quantity);
    }

    // handle added new part
    if(isset($_POST["add_part"])) {
    $partnum = $_POST["partnum"];
    $pname = $_POST["pname"];
    $color = $_POST["color"];
    $weight = $_POST["weight"];

    addPart($pdo, $partnum, $pname, $color, $weight);
    }

    // Handle DB of SP Submission
if (isset($_POST["submit"])) {
    $supplier = $_POST["supplier"];
    $part = $_POST["part"];
    $quantity = $_POST["quantity"];

    try {
        //   supplier-part relationship existence
        $stmt = $pdo->prepare("SELECT * FROM SP WHERE S = :supplier AND P = :part");
        $stmt->execute(['supplier' => $supplier, 'part' => $part]);
        $existing_row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($existing_row) {
            // update quantity
            $stmt = $pdo->prepare("UPDATE SP SET QTY = :quantity WHERE S = :supplier AND P = :part");
            $stmt->execute(['quantity' => $quantity, 'supplier' => $supplier, 'part' => $part]);
            echo "Quantity updated successfully!";
        } else {
            // insert new row in SP
            $stmt = $pdo->prepare("INSERT INTO SP (S, P, QTY) VALUES (:supplier, :part, :quantity)");
            $stmt->execute(['supplier' => $supplier, 'part' => $part, 'quantity' => $quantity]);
            echo "New supplier-part relationship added successfully!";
        }
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
   
?>

     <!-- IMPORTANT NOTES FOR HTML

         "<form method="post" action="<php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">"
            sets up a form that will sumbit data to the PHP scrip that is genereated using the HTPP POST method
        the min and required attributes to denote teh munym valye that can be in a input field
            the required attribute will not allow the data to subit if there is nothing to submit. h
            hence to indicate the user to give data
        Basic loops
            Loops are seen to populate dropdown menus with respect to the data avaliable in the DP
        General Workflow
            Create form with the method of"Post"
            Make Lable
            Make Dropdown table via SELECT tag
            Basic Loop(if needed execute SQL statements using PDO to populate options)
            Make Submit button with respectable name and values
            If quantity make input field for user as well
            
    -->

   <!-- FORM  show all Suppliers -->
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <input type="submit" name="show_suppliers" value="Show All Suppliers">
    </form>
    <!--  FORM to show all Parts -->
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <input type="submit" name="show_parts" value="Show All Parts">
    </form>
    <!-- Form to select a part -->
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
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
    </form>
    <!-- Form to select a supplier -->
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
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
    </form>
    <!-- Form to buy parts from a supplier -->
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
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
        <input type="number" name="quantity" id="quantity" min="1" required>
        <input type="submit" name="buy_parts" value="Buy Parts">
    </form>
    <!-- Form to add a new part -->
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
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
    </form>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
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
