<?php include('header.php');

// $database = new SQLite3('../GoodMail.db'); // connects to database

// if(!$database) {
// 	die("Not connected to database"); // give out error that database is not connected.
// }
// else{
// 	echo "connected";
// }

// echo "$nnn";
// SQLITE3_NUM = $row[0]
// SQLITE3_ASSOC = $row['eid']
//unique users
$query = "SELECT * FROM users";
$statement = $database->prepare($query);
$result = $statement->execute();
//echo $string;
echo '<h4>' . 'Below are all existing users in the database:' . '</h4>';
echo '<table class="table table-dark" id="table">';
echo
	'<tr id="Column Names">' .
		'<th>' . 'user name' . '</th>' . 
		'<th>' . 'user type' . '</th>' . 
	'</tr>';

while($row = $result->fetchArray(SQLITE3_ASSOC)) {
	echo
	'<tr>' .
		'<td>' . $row['u_name'] . '</td>' . 
		'<td>' . $row['u_type'] . '</td>' . 

	'</tr>';
}
echo '</table>';
echo '<br></br>';


//emails table
$query = "SELECT * FROM emails";
$statement = $database->prepare($query);
$result = $statement->execute();

echo '<h4>' . 'Listed are all tables and respective datas in the database:' . '</h4>';
echo '<br>';
echo '<h5>' . 'Table "emails":' . '</h5>';
echo '<table class="table table-dark" id="table">';
echo
	'<tr id="Column Names">' .
		'<th>' . 'e_subject' . '</th>' .
		'<th>' . 'e_message' . '</th>' .
		'<th>' . 'e_senderName' . '</th>' .
		'<th>' . 'e_date' . '</th>' .
	'</tr>';

while($row = $result->fetchArray(SQLITE3_ASSOC)) {
// echo $row[0] . " | ";
// echo $row[1] . " | ";
// echo $row[2] . " | ";
// echo $row[3] . " | ";
// echo $row[4] . " | ";
// echo $row[5] . " | ";
// echo $row[6] . " | ";
// echo "<br>";
	echo
	'<tr>' .
		'<td>' . $row['e_subject'] . '</td>' .
		'<td>' . $row['e_message'] . '</td>' .
		'<td>' . $row['e_senderName'] . '</td>' .
		'<td>' . $row['e_date'] . '</td>' .
	'</tr>';
}
echo '</table>';
echo '<br></br>';


//category table
$query = "SELECT * FROM category";
$statement = $database->prepare($query);
$result = $statement->execute();

echo '<h5>' . 'Table "category":' . '</h5>';
echo '<table class="table table-dark" id="table">';
echo
	'<tr id="Column Names">' .
		'<th>' . 'c_name' . '</th>' .
	'</tr>';

while($row = $result->fetchArray(SQLITE3_ASSOC)) {
	echo
	'<tr>' .
		'<td>' . $row['c_name'] . '</td>' .
	'</tr>';
}
echo '</table>';
echo '<br></br>';

//folder table
$query = "SELECT * FROM folder";
$statement = $database->prepare($query);
$result = $statement->execute();

echo '<h5>' . 'Table "folder":' . '</h5>';
echo '<table class="table table-dark" id="table">';
echo
	'<tr id="Column Names">' .
		'<th>' . 'f_name' . '</th>' .
	'</tr>';

while($row = $result->fetchArray(SQLITE3_ASSOC)) {
	echo
	'<tr>' .
		'<td>' . $row['f_name'] . '</td>' .
	'</tr>';
}
echo '</table>';
echo '<br></br>';

//note table
$query = "SELECT * FROM note";
$statement = $database->prepare($query);
$result = $statement->execute();

echo '<h5>' . 'Table "note":' . '</h5>';
echo '<table class="table table-dark" id="table">';
echo
	'<tr id="Column Names">' .
		'<th>' . 'n_message' . '</th>' .
	'</tr>';

while($row = $result->fetchArray(SQLITE3_ASSOC)) {
	echo
	'<tr>' .
		'<td>' . $row['n_message'] . '</td>' .
	'</tr>';
}
echo '</table>';
echo '<br></br>';


//recipient table
$query = "SELECT * FROM recipient";
$statement = $database->prepare($query);
$result = $statement->execute();

echo '<h5>' . 'Table "recipient":' . '</h5>';
echo '<table class="table table-dark" id="table">';
echo
	'<tr id="Column Names">' .
		'<th>' . 'r_name' . '</th>' . 
		'<th>' . 'r_address' . '</th>' .
	'</tr>';

while($row = $result->fetchArray(SQLITE3_ASSOC)) {
	echo
	'<tr>' .
		'<td>' . $row['r_name'] . '</td>' . 
		'<td>' . $row['r_address'] . '</td>' .
	'</tr>';
}
echo '</table>';
echo '<br></br>';

//sender table
$query = "SELECT * FROM sender";
$statement = $database->prepare($query);
$result = $statement->execute();

echo '<h5>' . 'Table "sender":' . '</h5>';
echo '<table class="table table-dark" id="table">';
echo
	'<tr id="Column Names">' .
		'<th>' . 's_name' . '</th>' . 
		'<th>' . 's_address' . '</th>' .
	'</tr>';

while($row = $result->fetchArray(SQLITE3_ASSOC)) {
	echo
	'<tr>' .
		'<td>' . $row['s_name'] . '</td>' . 
		'<td>' . $row['s_address'] . '</td>' .
	'</tr>';
}
echo '</table>';
echo '<br></br>';


?>

<?php include('disconnect.php'); ?>