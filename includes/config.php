<?php

//Set default timezone
date_default_timezone_set('Asia/Karachi');

//Siteroot
define ('siteroot','http://localhost/fyp/');

//API key for send grid
define('sendgridapi', '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');



//Database
define('servername', 'localhost');
define('username', 'root');
define('password', '');
define('dbname', 'fyp_management_system');

// Create connection
global $conn;
$conn = new mysqli(servername, username, password, dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection to Database failed");
}
else{
    //connection successful
}
?> 
