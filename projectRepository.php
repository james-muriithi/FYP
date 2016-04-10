<?php
$title="FYPMS";
$subtitle="Project Repository";
require_once("includes/header.php");
require_once("includes/config.php");
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
                    <div class="box no-border">
                        <div class="box-header">
                            <h3 class="box-title">List of Projects</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="projectRepository" class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Batch</th>
                                    <th>Project Name</th>
                                    <th>Project Group</th>
                                    <th>Engine version</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                $sql = "SELECT * FROM project_repository JOIN student_group JOIN batch JOIN student ON project_repository.batch_id = student_group.batch_id AND project_repository.batch_id = batch.batchId AND student.studentId = student_group.leaderId";
                                $result = $conn->query($sql);

                                if ($result->num_rows > 0) {
                                    // output data of each row
                                    while($row = $result->fetch_assoc()) { ?>
                                        <tr>
                                            <td><?php echo $row['batchName'];?></td>
                                            <td><?php echo $row['projectName'];?></td>
                                            <td><?php echo $row['groupId'];?></td>
                                            <td> 4</td>
                                            <td>
                                                <a href="<?php echo $_SERVER['PHP_SELF'] . "?details=".$row['groupId']?>" class="btn btn-default btn-sm">Details</a>
                                            </td>
                                        </tr>
                                        <?php
                                    }
                                }

                                ?>

                                </tbody>

                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->


                <!--DETAILS-->
                    <div class="box no-border">
                        <div class="box-header">
                            <h3 class="box-title">Details</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="projectDetials" class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Group ID</th>
                                    <th>Deliverable</th>
                                    <th>Uploaded <i class="fa fa-clock-o"></i></th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php

                                $groupId = filter_input(INPUT_GET,'details',FILTER_SANITIZE_NUMBER_INT);

                                $sql = "SELECT * FROM group_deliverables WHERE group_id = $groupId";
                                $result = $conn->query($sql);

                                if ($result->num_rows > 0) {
                                    // output data of each row
                                    while($row = $result->fetch_assoc()) { ?>
                                        <tr>
                                            <td><?php echo $row['group_id'];?></td>
                                            <td><?php $configId = $row['config_id'];
                                                echo $conn->query("SELECT taskName FROM configurations WHERE configurationId = '$configId' ")->fetch_object()->taskName;?>
                                            </td>
                                            <td><?php echo $row['upload_dtm'];?></td>
                                            <td>
                                                <a href="<?php echo $_SERVER['PHP_SELF'] . "?details=".$row['id']?>" class="btn btn-default btn-sm">Details</a>
                                                <a href="<?php echo $_SERVER['PHP_SELF'] . "?download=".$row['id']?>" class="btn btn-default btn-sm"><i class="fa fa-download"></i> Download</a>
                                            </td>
                                        </tr>
                                        <?php
                                    }
                                }

                                ?>

                                </tbody>

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

<!-- page script -->
<script>
    $(function () {
        $("#example1").DataTable();
        $('#projectRepository').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });
    });
</script>

</body>