<?php
session_start();
//include('header.php');
$database = new SQLite3('GoodMail.db'); // connects to database

if(!$database) {
	die("Not connected to database"); // give out error that database is not connected.
}


$subject = $_POST['email_subject'];
$message = $_POST['email_message'];
$recipient = $_POST['email_recipient'];
$category = $_POST['category_name'];
$folder = $_POST['folder_name'];
$note = $_POST['note'];

$query = "SELECT u_email FROM users WHERE u_name = '{$recipient}'";
$statement = $database->prepare($query);
$result = $statement->execute();
while($row = $result->fetchArray(SQLITE3_ASSOC)) {
	$remail = $row['u_email'];
}

$query = "INSERT INTO emails(e_uid, e_subject, e_message, e_senderName)
VALUES('{$_SESSION['user_id']}', '{$subject}', '{$message}', '{$_SESSION['user_name']}')";
$statement = $database->prepare($query);
$result = $statement->execute();

$query = "INSERT INTO category(c_uid, c_name)
VALUES('{$_SESSION['user_id']}', '{$category}')";
$statement = $database->prepare($query);
$result = $statement->execute();

$query = "INSERT INTO folder(f_uid, f_name)
VALUES('{$_SESSION['user_id']}', '{$folder}')";
$statement = $database->prepare($query);
$result = $statement->execute();

$query = "INSERT INTO note(n_uid, n_message)
VALUES('{$_SESSION['user_id']}', '{$note}')";
$statement = $database->prepare($query);
$result = $statement->execute();

$query = "INSERT INTO recipient(r_uid, r_name, r_address)
VALUES('{$_SESSION['user_id']}', '{$recipient}', '{$remail}')";
$statement = $database->prepare($query);
$result = $statement->execute();

$query = "INSERT INTO sender(s_uid, s_name, s_address)
VALUES('{$_SESSION['user_id']}', '{$_SESSION['user_name']}', '{$_SESSION['user_email']}')";
$statement = $database->prepare($query);
$result = $statement->execute();

header("Location: interface.php");
?>