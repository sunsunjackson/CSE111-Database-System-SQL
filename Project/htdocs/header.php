<?php
session_start();
$database = new SQLite3('GoodMail.db'); // connects to database

if(!$database) {
	echo "Not connected to DB"; // give out error that database is not connected.
}

// $nnn = $_POST['firstname'];

?>

<!DOCTYPE html>
<html>
<head>
<title>DNOYC
    </title>    

    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <style type="text/css">
    	.bottomFix{
    		position: fixed;
    		bottom:0px;
    		left: 0%;
    	}
    	.logoFix{
    		position: fixed;
    		left: 0%
    		top: 50px;
    	}ss
    </style>



    </head>
<img src="bluetop.png" alt="This is top blue stripe" width="100%" height="30">


<!-- <body style = "background-image: url('../aprfools.png')"> -->
    


<!-- <div class="container">
<form action="src/login.php" method="POST">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="firstname" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div> -->