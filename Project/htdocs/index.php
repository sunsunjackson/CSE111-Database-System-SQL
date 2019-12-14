<?php
include('header.php');
?>


<h1></h1>
<p></p> 

<center> <img src="logo.png" alt="This is the logo" style="margin:100px 0px" width="502" height="30%"></center>


<center>
<form action="login.php" method="POST">
  <label for="userinput">User name:</label>
  <input type="text" id="userinput" name="firstname" placeholder="Enter Username"/>
  <!-- <label for="pass"> Last name: </label>
  <input type="text" id="pass" name="password" placeholder="Enter Password"/> <br> -->
  <button type="submit" class="btn btn-primary" name="submit" value="troll">Submit</button>
</form> 
</center> <br>

<!-- <form class="form-inline">
  <div class="form-group mb-2">
    <label for="staticEmail2" class="sr-only">Email</label>
    <input type="text" readonly class="form-control-plaintext" id="staticEmail2" value="email@example.com">
  </div>
  <div class="form-group mx-sm-3 mb-2">
    <label for="inputPassword2" class="sr-only">Password</label>
    <input type="password" class="form-control" id="inputPassword2" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary mb-2">Confirm identity</button>
</form> -->

<?php include('disconnect.php'); ?>