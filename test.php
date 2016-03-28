<?php

require_once("includes/config.php");
//Get group id
$groupId = $conn->query("SELECT groupId FROM group_requests WHERE requestId =34  ")->fetch_object()->groupId;
//Get student id
$studentId = $conn->query("SELECT studentId FROM group_requests WHERE requestId =34 ")->fetch_object()->studentId;
echo $groupId .'<br/>';
echo $studentId .'<br/>';

$sql = "UPDATE student SET groupId='$groupId' WHERE studentId='$studentId' ";

if ($conn->query($sql) != TRUE) {

}
else{
    header('HTTP/1.1 500 Error occurred, Could not accept request!');
    exit();
}



