<?php 

$mailto = 'dreamscapedesign2015@outlook.com' ; 
$subject = "Quote" ; 
$formurl = "contact.html" ; 
$errorurl = "error.html" ; 
$thankyouurl = "thank.html" ; 
$uself = 0; 
$use_sendmailfrom = 0; 
$use_webmaster_email_for_from = 0; 
$use_utf8 = 1; 
$headersep = (!isset( $uself ) || ($uself == 0)) ? "\r\n" : "\n" ; 
$content_type = (!isset( $use_utf8 ) || ($use_utf8 == 0)) ? 'Content-Type: text/plain; charset="iso-8859-1"' : 'Content-Type: text/plain; charset="utf-8"' ; 
if (isset( $use_sendmailfrom ) && $use_sendmailfrom) { 

ini_set( 'sendmail_from', $mailto ); 
} 
$firstname = addslashes($_POST['firstname']) ; 
$lastname = addslashes($_POST['lastname']) ; 
$city = addslashes($_POST['city']) ; 
$phone = addslashes($_POST['phone']) ; 
$email = addslashes($_POST['email']) ; 
$website = addslashes($_POST['website']) ; 
$subject = addslashes($_POST['subject']) ; 
$message = addslashes($_POST['message']) ; 
$http_referrer = getenv( "HTTP_REFERER" ); 

if (!isset($_POST['email'])) { 

header( "Location: $formurl" ); 

exit ; 
} 

$valid_email = (preg_match('/^[A-Z0-9._%-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$/im', $email)) ? true : false; 
$valid_firstname = (!empty($firstname)) ? true : false; 
$valid_lastname = (!empty($lastname)) ? true : false; 
$valid_city = (!empty($city)) ? true : false; 
$valid_state = (!empty($state)) ? true : true; 
$valid_message = (!empty($subject) && !empty($message)) ? true : false; 

$fromemail = (!isset( $use_webmaster_email_for_from ) || ($use_webmaster_email_for_from == 0)) ? $email : $mailto ; 

if (get_magic_quotes_gpc()) { 
    $process = array(&$_GET, &$_POST, &$_COOKIE, &$_REQUEST); 
    while (list($key, $val) = each($process)) { 
        foreach ($val as $k => $v) { 
            unset($process[$key][$k]); 
            if (is_array($v)) { 
                $process[$key][stripslashes($k)] = $v; 
                $process[] = &$process[$key][stripslashes($k)]; 
            } else { 
                $process[$key][stripslashes($k)] = stripslashes($v); 
            } 
        } 
    } 
    unset($process); 
} 

$messageproper = 

"This message was sent from:\n" . 

"$http_referrer\n" . 

"------------------------------------------------------------\n" . 

"First Name: $firstname\n" . 
"Last Name: $lastname\n" . 
"City: $city\n" . 

"Phone: $phone\n" . 
"Email: $email\n" . 
"Website: $website\n" . 
"Subject: $subject\n" . 

"------------------------- MESSAGE -------------------------\n\n" . 

$message . 

"\n\n------------------------------------------------------------\n" ; 

$headers = "From: \"$firstname\" <$fromemail>" . $headersep . "Reply-To: \"$firstname\" <$email>" . $headersep . "X-Mailer: chfeedback.php 2.15.0" . $headersep . 'MIME-Version: 1.0' . $headersep . $content_type ; 

if ($valid_email && $valid_firstname && $valid_lastname && $valid_city && $valid_state && $valid_message) { 
mail( $mailto, $subject, $messageproper, $headers ); 
} 

else { 
header( "Location: $errorurl" ); 
exit ; 
} 

header( "Location: $thankyouurl" ); 
exit ; 

?>