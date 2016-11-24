<?php
//get userName
$user = $_GET('u');

?>
<Doctype! html>
<html lang=en>
<head>
    <title>University Network</title>
    <link rel='stylesheet' type='text/css' href='css/style.css'>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel='stylesheet' type='text/css'>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<div class="chatContainer">
    <div class="chatHeader">
    <h3>Welcome <?php echo ucwords($user); ?></h3>
</div>
<div class="chatMessages">
<div class="chatBottom"> 
    <form action='#' onSubmit=' return false;'>
        <input type="hidden" id="name" value="<?php echo $user; ?>"/>
        <input type="text" name="text" id="text" value="" placeholder="Enter Your Message." />
        <input type="submit" name="submit" value="Post" />
    </form>
</div>
</div>
</div>
</body>
