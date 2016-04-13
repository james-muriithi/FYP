<?php
require_once ('includes/config.php');
session_start();

//

generate_pdf($_SESSION['batch_id']);

function generate_pdf($batchId){

    define('FPDF_FONTPATH','libs/fpdf/font/');
    require('libs/fpdf/mysql_report.php');

    // the PDF is defined as normal, in this case a Portrait, measurements in points, A4 page.
    $pdf = new PDF('P','pt','A4');
    $pdf->SetFont('Helvetica','',10);


    // should not need changing, change above instead.
    $pdf->connect(servername, username, password, dbname);

    // attributes for the page titles
    $attr = array('titleFontSize'=>'16', 'titleText'=>'List of Groups');
    $sql_statement = 'SELECT groupId AS GroupID, projectName AS projectName  FROM student_group WHERE batch_id = '.$batchId;
    $pdf->mysql_report($sql_statement, false, $attr );


    $attr = array('titleFontSize'=>'16', 'titleText'=>'Detailed List of Groups');
    $sql_statement = 'SELECT student.groupId AS GroupID ,student_group.projectName AS ProjectName, student.studentCMS as CMS, student.studentName as Member FROM student_group JOIN student ON student.groupId = student_group.groupId WHERE student.batchId ='.$batchId;
    $pdf->mysql_report($sql_statement, false, $attr );


    unset($_SESSION['batch_id']);

    $pdf->Output();
}
