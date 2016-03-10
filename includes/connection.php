<?php 
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "fyp_management_system";

//Set default timezone

date_default_timezone_set('Asia/Karachi');


// Create connection
global $conn;
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection to Database failed");
}
else{
    //connection successful
}
?> 
