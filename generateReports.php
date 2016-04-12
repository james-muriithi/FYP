<?php
$title="FYPMS";
$subtitle="Generate Reports";
require_once("includes/header.php");
require_once("includes/config.php");
require_once ("pdf_generation.php");
session_start();

//Check if COORDINATOR is logged in else log out
if(!isset($_SESSION["isCord"]))
{
    header('Location: '.'index.php');
}



//Check if form is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {


}

//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {


    if (isset($_POST['btnListOfStudents'])){
        $batch = filter_input(INPUT_POST,'batch',FILTER_SANITIZE_NUMBER_INT);

        $title= 'TITLE';
        $titleFontSize = '16';
        $sql = " SELECT studentCMS AS CMS,studentName AS Name,studentEmail AS Email,studentPhoneNo AS Contact FROM student WHERE batchId = 12 ";

        generate_pdf($title,$titleFontSize,$sql);



    }



}



?>
<!-- DataTables -->
<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">


</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <?php require_once("includes/main-header.php"); ?>
    <?php require_once("includes/main-sidebar.php"); ?>
    <div class="content-wrapper" >
        <?php require_once("includes/content-header.php"); ?>

        <section class="content" style="min-height: 700px">
            <div class="row">
                <div class="col-md-6">
                    <!-- general form elements -->
                    <div class="box no-border">
                        <div class="box-header with-border">
                            <h3 class="box-title">List of students</h3>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <form name="listOfStudents" id="listOfStudents" method="post" >
                            <div class="form-group">
                                <label>Select Batch</label>
                                <select class="form-control" name="batch" required>
                                    <?php
                                        $sql = "SELECT * FROM batch ORDER BY createdDtm DESC";
                                        $result = $conn->query($sql);

                                        if ($result->num_rows > 0) {
                                            // output data of each row
                                            while($row = $result->fetch_assoc()) { ?>
                                                <option value="<?php echo $row['batchId'];?>"><?php echo $row['batchName']; if($row['isActive'] == 1){echo " [ Active ] ";};?></option>
                                            <?php
                                            }
                                        } else {
                                            echo "0 results";
                                        }
                                    ?>
                                </select>
                            </div>
                            </form>
                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">
                            <button type="submit" name="btnListOfStudents" form="listOfStudents" class="btn btn-danger bg-red  pull-right"><i class="fa fa-file-pdf-o" aria-hidden="true"></i> Generate PDF</button>
                        </div>

                    </div>
                    <!-- /.box -->
                </div>

                <div class="col-md-6">
                    <!-- general form elements -->
                    <div class="box no-border">
                        <div class="box-header with-border">
                            <h3 class="box-title">List of groups</h3>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <div class="form-group">
                                <label>Select</label>
                                <select class="form-control">
                                    <option>option 1</option>
                                    <option>option 2</option>
                                    <option>option 3</option>
                                    <option>option 4</option>
                                    <option>option 5</option>
                                </select>
                            </div>

                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">

                        </div>

                    </div>
                    <!-- /.box -->
                </div>


            </div>
        </section>
    </div>
    <?php
    require_once("includes/main-footer.php");
    ?>
</div>

<?php
require_once("includes/required_js.php");
?>

</body>