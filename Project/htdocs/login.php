<?php
session_start();
//include('header.php');
$database = new SQLite3('GoodMail.db'); // connects to database

if(!$database) {
	die("Not connected to database"); // give out error that database is not connected.
}

// $query = "SELECT * FROM emails";
// $statement = $database->prepare($query);
// $result = $statement->execute();

// var_dump($result->fetchArray(SQLITE3_NUM));
$_SESSION['user_name'] = $_POST['firstname'];

//echo $_POST['firstname'];
// echo $_POST['password'];
//$name = $_POST['firstname'];
$query= "SELECT u_uid, u_type, u_name, u_email FROM users WHERE u_name = '{$_SESSION['user_name']}'";
$statement = $database->prepare($query);
$result = $statement->execute();
while($row = $result->fetchArray(SQLITE3_ASSOC)) {
	$_SESSION['s'] = $row['u_type'];
	$_SESSION['user_id'] = $row['u_uid'];
	$_SESSION['user_email'] = $row['u_email'];
	$_SESSION['user_name'] = $row['u_name'];
}

if($_SESSION['s'] == 'ADMIN') {
	header("Location: admin.php");
}
else if($_SESSION['s'] == 'USER'){
	header("Location: interface.php");	
}
else if($_SESSION['s'] != 'USER' && $_SESSION['s'] != 'ADMIN') {
	header("Location: blank.php");
}
?>