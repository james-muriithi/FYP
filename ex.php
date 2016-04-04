<?php
require('mysql_table.php');

class PDF extends PDF_MySQL_Table
{
    function Header()
    {

        //Title
        $this->SetFont('Arial','',18);
        $this->Cell(0,6,'Student',0,1,'C');
        $this->Ln(10);
        //Ensure table header is output
        parent::Header();
    }
}
/*
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='rsats'
AND TABLE_NAME='employee'*/
//Connect to database
mysql_connect('localhost','root','');
mysql_select_db('fyp_management_system');

$pdf=new PDF();
$pdf->AddPage();
//First table: put all columns automatically
//$pdf->Table('select * from stock order by name');
//$pdf->AddPage();
//Second table: specify 3 columns

$prop=array('HeaderColor'=>array(49, 79, 79),
 
    'padding'=>2);
$pdf->Table('SELECT studentName AS Name,studentCMS AS CMS,studentPhoneNo AS Number FROM student ',$prop);
$pdf->Output();
?>

