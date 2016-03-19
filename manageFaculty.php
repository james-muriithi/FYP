<?php
$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Manage Faculty";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();
if(!isset($_SESSION["isCord"]))
{
    header('Location: '.'index.php');
}



//Check if form is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    //Function for delete Faculty
    if (isset($_GET["delete"]) and is_numeric($_GET["delete"]) ){

    $id = $_GET["delete"];

    //Check if there is a Faculty
    $sql = "SELECT facultyId FROM faculty WHERE facultyId = '$id' ";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        // output data of each row
        $sql = "DELETE FROM faculty WHERE facultyId='$id' ";

        if ($conn->query($sql) === TRUE) {
            header('Location:' . 'manageFaculty.php?status=t');
        } else {
            header('Location:' . 'manageFaculty.php?status=f');
        }
    }else{
        header('Location:' . 'manageFaculty.php?status=f');
    }
}

}

//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

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
                            <h3 class="box-title">Faculty List</h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body  no-padding">
                            <table id="manageFaculty" class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Designation</th>
                                    <th>Email</th>
                                    <th>Roles</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <?php
                                $sql = "SELECT * from faculty ";
                                $result = $conn->query($sql);
                                while($row = $result->fetch_assoc()) { ?>
                                    <tr>
                                        <td><?php echo $row['facultyName'] ;?></td>
                                        <td><?php echo $row['designation'];?></td>
                                        <td><?php echo $row['facultyEmail'] ;?></td>
                                        <td>
                                            <?php
                                                if ($row["isAdmin"] == 1){echo '<p class="text-green">Administrator</p>';}
                                                if ($row["isCoordinator"] == 1){echo '<p class="text-green">Coordinator</p>';}
                                            ?></td>
                                        <td>
                                            <a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $row['facultyId']; ?>"  class="btn  btn-primary btn-xs">Edit</a>
                                            <a href="<?php echo $_SERVER['PHP_SELF'] . '?delete=' . $row['facultyId']; ?>" onclick="return confirm('Are you sure?')" class="btn  btn-danger btn-xs">Delete</a>


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
</div>
<?php
require_once("includes/main-footer.php");
?>
<?php
require_once("includes/required_js.php");
?>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        $('#manageFaculty').DataTable({
            "paging": false,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": false,
            "autoWidth": false
        });
    } );
</script>
</body>