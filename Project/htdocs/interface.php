<?php

include('header.php');

$database = new SQLite3('GoodMail.db'); // connects to database

if(!$database) {
	die("Not connected to database"); // give out error that database is not connected.
}

//$name = $_POST['firstname'];
// echo htmlspecialchars($_POST['firstname']);

//sets $name to be the user name input
$name = $_SESSION['user_name'];

//print_r($_SESSION['user_name']);


//This queries your input user's emails
$query = "SELECT e_subject, e_message, e_senderName, e_date FROM emails, users, recipient WHERE u_uid = e_uid AND r_uid = u_uid AND r_name = '{$_SESSION['user_name']}'";
$statement = $database->prepare($query);
$result = $statement->execute();
//echo $string;
echo '<h5>' . 'Welcome back, ' . $name . '. Below are all existing emails that you have received: ' . '</h5>' . '<br>';
echo '<table class="table table-dark" id="table">';
echo
	'<tr id="Column Names">' .
		'<th>' . 'Email subject' . '</th>' . 
		'<th>' . 'Email message' . '</th>' . 
		'<th>' . 'Email sender' . '</th>' .
		'<th>' . 'Email sent date' . '</th>' .  
	'</tr>';

while($row = $result->fetchArray(SQLITE3_ASSOC)) {
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

?>


<?php echo "<h5>" . "Compose your email below:" . "</h5>"; ?>
<!-- compose an -->
<form action="insert.php" method="POST">
  <label for="userinput">Email Subject:</label>
  <input type="text" class="form-control" id="userinput" name="email_subject"/>

  <label for="userinput">Email Message:</label>
  <input type="text" class="form-control" id="userinput" name="email_message"/>

  <label for="userinput">Email Recipient:</label>
  <input type="text" class="form-control" id="userinput" name="email_recipient"/>

  <label for="userinput">Category Name:</label>
  <input type="text" class="form-control" id="userinput" name="category_name"/>

  <label for="userinput">Folder name:</label>
  <input type="text" class="form-control" id="userinput" name="folder_name"/>

  <label for="userinput">Note:</label>
  <input type="text" class="form-control" id="userinput" name="note"/>

  <button type="submit" class="btn btn-primary" name="submit" value="troll">Submit</button>
</form> 


<?php include('disconnect.php'); ?>