<?php
$title="FYPMS";
$subtitle="Batch Tasks";
require_once("includes/header.php");
require_once("includes/config.php");
require_once ("includes/functions.php");
session_start();

//Check if coordinator is logged in
if(!isset($_SESSION["isCord"]))
{
    header('Location: '.'index.php');
}

//Check if form is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {


}

//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if (isset($_POST['btnEdit'])){

    }

    if (isset($_POST['btnDelete'])){

    }
}
?>

<!--Date Picker-->
<link rel="stylesheet" href="plugins/datepicker/datepicker3.css"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <?php require_once("includes/main-header.php"); ?>
    <?php require_once("includes/main-sidebar.php"); ?>
    <div class="content-wrapper" >
        <?php require_once("includes/content-header.php"); ?>

        <section class="content" style="min-height: 700px">
            <div class="row">
                <div class="col-lg-12">

                    <?php
                    if (isset($_GET['status'])){
                        if ($_GET['status'] == 't'){ ?>
                            <div style="text-align:center;" class="alert alert-success" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Changes saved successfully!
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                            <?php
                        }
                        else  if ($_GET['status'] == 'f'){ ?>
                            <div style="text-align:center;" class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Error! Something Went Wrong
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                            <?php
                        }
                        else if ($_GET['status'] == 's'){ ?>
                            <div style="text-align:center;" class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Error!
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                            <?php
                        }
                        else if ($_GET['status'] == 'e'){ ?>
                            <div style="text-align:center;" class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Error!
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                            <?php
                        }
                    }

                    ?>




                        <?php
                        if (isset($_GET['edit'])){
                            $taskId = filter_input(INPUT_GET,'edit',FILTER_SANITIZE_NUMBER_INT);

                            $sql = "SELECT * FROM batch_tasks WHERE taskId='$taskId' LIMIT 1";
                            $result = $conn->query($sql);

                            if ($result->num_rows > 0) {
                                // output data of each row
                                while($row = $result->fetch_assoc()) {
                                    $taskWeek = $row['taskWeek'];
                                    $taskName = $row['taskName'];
                                    $taskDetail = $row['taskDetail'];
                                    $taskDeadline = $row['$taskDeadline'];
                                    $template = $row['templateId'];
                                    $hasDeliverable= $row['hasDeliverable'];
                                }
                            } else {
                                echo "0 results";
                            }
                            ?>

                            <!-- general form elements -->
                            <div class="box no-border">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Edit: <?php echo $taskName;?></h3>
                                </div>
                                <!-- /.box-header -->

                                <div class="box-body">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputFile">File input</label>
                                            <input type="file" id="exampleInputFile">

                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> Check me out
                                            </label>
                                        </div>

                                </div>
                                <!-- /.box-body -->

                                <div class="box-footer">

                                </div>

                            </div>
                            <!-- /.box -->


                        <?php
                        }

                        else{ ?>


                        <?php
                        }
                        ?>
                        <div class="box no-border">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <?php
                                    $batchId = filter_input(INPUT_GET,'batchId',FILTER_SANITIZE_NUMBER_INT);
                                    if ($batchId){
                                        //Get batch Name
                                        $batchName = $conn->query("SELECT batchName FROM batch WHERE batchId = '$batchId' ")->fetch_object()->batchName;
                                        echo "Batch ".$batchName;

                                    }else{
                                        echo "<p class=\"text-muted\">Select batch from the list</p>";
                                    }
                                    ?>

                                </h3>

                                <div class="box-tools">
                                    <form id="selectBatch"  id="selectBatch" method="get" name="selectGroup">
                                        <div class="input-group input-group-sm" style="width: 250px;">

                                            <select name="batchId"  id="batchId" class="form-control" required>
                                                <?php
                                                $sql = "SELECT * FROM batch WHERE  batch.isActive = 1";
                                                $result = $conn->query($sql);
                                                if ($result->num_rows > 0) {
                                                    while($row = $result->fetch_assoc()) { ?>
                                                        <option value="<?php echo $row['batchId']; ?>" >
                                                            <?php echo $row['batchName'];?>
                                                        </option>
                                                        <?php
                                                    }
                                                }
                                                ?>
                                            </select>

                                            <div class="input-group-btn">
                                                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body  no-padding">
                                <table id="meetingLogs" class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th style="width:10px;">Week</th>
                                        <th style="width:100px;">Task Name</th>
                                        <th >Task Details</th>
                                        <th style="width:100px;">Deadline</th>
                                        <th>Template</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>

                                    <?php

                                    $batchId = filter_input(INPUT_GET,'batchId',FILTER_SANITIZE_NUMBER_INT);

                                    $sql = "SELECT * from batch_tasks WHERE batchId = '$batchId' ORDER BY taskWeek ASC";
                                    $result = $conn->query($sql);
                                    while($row = $result->fetch_assoc()) { ?>
                                        <tr>
                                            <td><?php echo $row['taskWeek'];?></td>
                                            <td><?php echo $row['taskName'];?></td>
                                            <td>
                                                <?php
                                                if (strlen($row['taskDetail']) > 50){
                                                    echo getExcerpt($row['taskDetail'],"0","100");
                                                }else{
                                                    echo $row['taskDetail'];
                                                }
                                                ?>
                                            </td>
                                            <td><?php echo time2str($row['taskDeadline']);?></td>
                                            <td><?php echo $row['templateId'];?></td>
                                            <td>
                                                <a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $row['taskId']; ?>"  class="btn  btn-primary btn-xs">Edit</a>
                                                <a href="<?php echo $_SERVER['PHP_SELF'] . '?delete=' . $row['taskId']; ?>" onclick="return confirm('Are you sure?')" class="btn  btn-danger btn-xs">Delete</a>

                                            </td>
                                        </tr>
                                    <?php }

                                    ?>
                                </table>
                                <div class="box-footer  pull-right">
                                    <a href="<?php echo $_SERVER['PHP_SELF'] . '?add'; ?>" class="btn  btn-primary  ">Add New Log</a>
                                </div>
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
<!-- ./wrapper -->
<?php
require_once("includes/required_js.php");
?>

<!--Datepicker-->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<script>




    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
    });


</script>
</body>
</html>