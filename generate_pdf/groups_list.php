<?php
require_once('../includes/config.php');
session_start();

$batchId = $_SESSION['batch_id'];

//require ('../includes/config.php');
define('FPDF_FONTPATH', '../libs/fpdf/font/');
require('../libs/fpdf/mysql_report.php');

// the PDF is defined as normal, in this case a Portrait, measurements in points, A4 page.
$pdf = new PDF('P', 'pt', 'A4');
$pdf->SetFont('Helvetica', '', 10);


// should not need changing, change above instead.
$pdf->connect(servername, username, password, dbname);

// attributes for the page titles
$attr = array('titleFontSize' => '16', 'titleText' => 'List of Groups');

$sql_statement = "SELECT groupId AS GroupID, ProjectName AS projectName  FROM student_group WHERE batch_id = ".$batchId;

// Generate report
$pdf->mysql_report($sql_statement, false, $attr);


//$sql_statement = "SELECT * FROM user JOIN tables_priv ON user.User=tables_priv.User ORDER BY user.User";

// Generate report
//$pdf->mysql_report($sql_statement, false, $attr);


$pdf->Output();

