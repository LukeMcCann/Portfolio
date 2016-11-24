<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="enter description" />
<meta name="keywords" content="enter keywords here" />
<meta name="author" content="team407" />
<meta name="HandheldFriendly" content="true" />

<title>Chat - Student Module</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!--Personal CSS stylesheet-->

<link rel="stylesheet" type="text/css" href="style/main.css">
<link rel="stylesheet" type="text/css" href="style/main.css">
</head>
<body>

<?php
if(!isset($_SESSION['name'])){
    loginForm();
}
else{
?>

 <div id="wrapper">
 	<div id="menu">
 		<p class="welcome">Hello, <b><?php echo $_SESSION['name']; ?></b></p>
 		<p class="logout"><a id="exit" href="#">Logoff Chat</a></p>
 		<div style="clear:both"></div>
 		</div>

 		<div id="chatbox"></div>

 		<form name="message" action="">
 			<input name="usermsg" type="text" id="usermsg" size=63 />
 			<input name="submitmsg" type="submit" id="submitmsg" value="Send" />
 		</form>
 	</div>
 	<script type="text/javascript src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
 	<script type="text/javascript">
 	$(document).ready(function()){
 		//End Session
 		$("#exit").click(function){
 			var exit = confirm ("Are you sure you want to leave?"); }
 			if(exit == true){
 				window.location = 'chat.php?logout=true';}
 			});
 		});
  </script>
  <?php
}
?>
</body>
</html>
