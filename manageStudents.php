<?php
$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Manage Students";
require_once("includes/header.php");
require_once("includes/config.php");
require('mysql_table.php');
session_start();
if(!isset($_SESSION["isCord"]))
{
    header('Location: '.'index.php');
}



//Check if form is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    //Function for delete Student
    if (isset($_GET["delete"]) and is_numeric($_GET["delete"]) ){

        $id = $_GET["delete"];

        //Check if there is a student
        $sql = "SELECT studentId FROM student WHERE studentId = $id";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            // output data of each row
            $sql = "DELETE FROM student WHERE studentId='$id' ";

            if ($conn->query($sql) === TRUE) {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=t');
            } else {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
            }
        }else{
            header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
        }
    }

}

//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {


    
}



?>
<!-- DataTables -->
<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
<script src="http://malsup.github.com/jquery.form.js"></script>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <?php require_once("includes/main-header.php"); ?>
    <?php require_once("includes/main-sidebar.php"); ?>
    <div class="content-wrapper" >
        <?php require_once("includes/content-header.php"); ?>

        <section class="content" style="min-height: 700px">
            <div class="row">
                <div class="col-md-12">

                    <?php if (isset ($_GET['status'])){
                        if ($_GET['status'] == 't'){ ?>
                            <div style="text-align:center;" class="alert alert-success" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Changes saved successfully!
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                        <?php   }
                        else if ($_GET['status'] = 'f'){ ?>
                            <div style="text-align:center;" class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Error! Something Went Wrong
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                        <?php }

                        else{ ?>
                            <div style="text-align:center;" class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Error! Something Went Wrong
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                        <?php    }
                    }?>


                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">List of students</h3>
                            <div class="box-tools ">
                                <form id="generate_pdf" name="generate_pdf" method="post">
                                <div class="input-group input-group-sm " style="width: 150px;">
                                    <button type="submit" class="btn btn-default  btn-flat btn-sm pull-right"> <i class="fa fa-file-pdf-o"></i> Generate PDF</button>
                                </div>
                                </form>
                            </div>

                        </div>

                        <!-- /.box-header -->
                        <div class="box-body  no-padding">
                            <table id="manageStudents" class="table table-hover">
                                <thead>
                                <tr>
                                    <th>CMS</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Batch</th>
                                    <th>Group Status</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <?php
                                $sql = "SELECT * from student JOIN batch where batch.batchId = student.batchId";
                                $result = $conn->query($sql);
                                while($row = $result->fetch_assoc()) { ?>
                                    <tr>
                                        <td><?php echo $row['studentCMS'] ;?></td>
                                        <td><?php echo $row['studentName'];?></td>
                                        <td><?php echo $row['studentEmail'] ;?></td>
                                        <td><?php echo $row['batchName'];?></td>
                                        <td>
                                            <?php if ($row['isLeader'] == 1 ){ ?>
                                            <span class="label label-primary">Group Leader</span>
                                           <?php } else { ?>
                                                <span class="label label-warning">Pending</span>
                                            <?php } ?>
                                        </td>
                                        <td>
                                            <a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $row['studentId']; ?>"  class="btn  btn-primary btn-xs">Edit</a>
                                            <a href="<?php echo $_SERVER['PHP_SELF'] . '?delete=' . $row['studentId']; ?>" onclick="return confirm('Are you sure?')" class="btn  btn-danger btn-xs">Delete</a>


                                        </td>
                                    </tr>
                                <?php }
                                ?>
                            </table>
                        </div>
                        <!-- /.box-body -->
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
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        $('#manageStudents').DataTable({
            "paging": false,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": false,
            "autoWidth": false
        });
    } );
</script>

<script>
    // prepare the form when the DOM is ready
    $(document).ready(function() {
        // bind form using ajaxForm
        $('#generate_pdf').ajaxForm({
            // target identifies the element(s) to update with the server response


            // success identifies the function to invoke when the server response
            // has been received; here we apply a fade-in effect to the new content
            success: function() {
                alert("SUCCESS");
            }
        });
    });
</script>
</body>