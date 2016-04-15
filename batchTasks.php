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



    if (isset($_POST['btnAddNewTask'])){

        //Getting values from POST
        $batchId = filter_input(INPUT_POST,'batchId',FILTER_SANITIZE_NUMBER_INT);
        $taskWeek = filter_input(INPUT_POST,'week',FILTER_SANITIZE_NUMBER_INT);
        $taskName = filter_input(INPUT_POST,'taskName',FILTER_SANITIZE_SPECIAL_CHARS);
        $templateId = filter_input(INPUT_POST,'templateId',FILTER_SANITIZE_NUMBER_INT);
        $hasDeliverable = filter_input(INPUT_POST,'hasDeliverable',FILTER_SANITIZE_NUMBER_INT);
        $sendToTimeline = filter_input(INPUT_POST,'sendToTimeline',FILTER_SANITIZE_NUMBER_INT);
        $taskDetail = $_POST['taskDetail'];


        $deadlineDate = $_POST['deadlineDate'];
        $deadlineTime = $_POST['deadlineTime'];

        //Converting deadline to MySql format
        $deadline = $deadlineDate ." ". $deadlineTime;
        $deadline = date('Y-m-d H:i:s', strtotime($deadline));

        //Adding record to database
        $sql = "INSERT INTO batch_tasks (batchId, taskName, taskDetail, taskWeek, taskDeadline, templateId, hasDeliverable) VALUES ('$batchId', '$taskName', '$taskDetail', '$taskWeek', '$deadline', '$templateId', '$hasDeliverable') ";

        if ($conn->query($sql) === TRUE) {
            if ($sendToTimeline == '1'){
                $sql = "INSERT INTO timeline_student (title, details, type, batchId) VALUES ('$taskName', '$taskDetail', 'task', '$batchId' )";
                if ($conn->query($sql) === TRUE) {
                    header('Location:' . $_SERVER['PHP_SELF'] . '?add='.$batchId.'&status=t');
                    die;
                }
            }
            header('Location:' . $_SERVER['PHP_SELF'] . '?add='.$batchId.'&status=t');
            die;
        } else {
            header('Location:' . $_SERVER['PHP_SELF'] . '?add='.$batchId.'&status=f');
            die;
        }






    }

    if (isset($_POST['btnEdit'])){

    }

    if (isset($_POST['btnDelete'])){

    }
}
?>

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

                        <!--Edit Task-->
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
                                    <h3 class="box-title">Title</h3>
                                </div>
                                <!-- /.box-header -->

                                <div class="box-body">

                                </div>
                                <!-- /.box-body -->

                                <div class="box-footer">

                                </div>

                            </div>
                            <!-- /.box -->


                        <?php
                        }

                        else if (isset($_GET['add']) && is_numeric($_GET['add']) && strlen($_GET['add'])>0){ ?>
                            <!--Add new task-->
                            <div class="box no-border">
                                <div class="box-header">
                                    <h3 class="box-title">
                                        Add new task --
                                        <?php
                                        $batchId = filter_input(INPUT_GET,'add',FILTER_SANITIZE_NUMBER_INT);
                                        if ($batchId){
                                            //Get batch Name
                                            $batchName = $conn->query("SELECT batchName FROM batch WHERE batchId = '$batchId' ")->fetch_object()->batchName;
                                            $batchStartDate = $conn->query("SELECT startingDate FROM batch WHERE batchId = '$batchId' ")->fetch_object()->startingDate;
                                            echo "Batch ".$batchName;

                                        }else{
                                            echo "--";
                                        }
                                        ?>
                                    </h3>
                                </div>
                                <!-- /.box-header -->
                                <form name="addNewTask" id="addNewTask" action="<?php echo $_SERVER['PHP_SELF']; ?>" class="form-horizontal" method="post">
                                    <input type="hidden" name="batchId" value="<?php echo $batchId;?>">
                                    <div class="box-body  no-padding">

                                        <div class="form-group">
                                            <label  class="col-sm-2 control-label">Select Week:</label>

                                            <div class="col-sm-10">
                                                <select style="width:200px;"  name="week" id="week" required>
                                                    <option value=""> -Select Week-</option>
                                                    <?php
                                                    for ($i=1 ;$i<=20; $i++){ ?>
                                                        <option value="<?php echo $i;?>">Week <?php echo $i;?></option>
                                                        <?php
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-2 control-label">Task Name:</label>

                                            <div class="col-sm-10">
                                                <input type="text" style="width:500px;" name="taskName" id="taskName" placeholder="Enter Task Name" required>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-2 control-label">Task Details:</label>

                                            <div class="col-sm-10">
                                                <textarea class="textarea" name="taskDetail" id="taskDetail" placeholder="Enter task details" style="width: 90%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-2 control-label">Set Deadline:</label>
                                            <div class="col-sm-10">
                                                <input name="deadlineDate" id="deadlineDate" type=date  >
                                                <input name="deadlineTime" id="deadlineTime" type=time min=9:00 max=17:00 step=900>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-2 control-label">Select Template:</label>

                                            <div class="col-sm-10">
                                                <select style="width:400px;"  name="templateId" id="templateId">
                                                    <option value=""> -Select Template-</option>
                                                    <?php
                                                    $sql = "SELECT * FROM batch_templates WHERE batchId='$batchId' ";
                                                    $result = $conn->query($sql);

                                                    if ($result->num_rows > 0) {
                                                        // output data of each row
                                                        while($row = $result->fetch_assoc()) { ?>
                                                            <option value="<?php echo $row['templateId']?>"><?php echo $row['templateName']?></option>
                                                            <?php
                                                        }
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="hasDeliverable" value="1"> This task has deliverable
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="sendToTimeline" id="sendToTimeline" value="1" checked> Send Notification to timeline
                                                    </label>
                                                </div>
                                            </div>
                                        </div>




                                    </div>
                                </form>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <button type="submit" name="btnAddNewTask" id="btnAddNewTask" form="addNewTask" class="btn btn-primary btn-sm pull-right">Submit</button>
                                    <a href="<?php echo $_SERVER['PHP_SELF'];?>" class="btn btn-default btn-sm"">Back</a>
                                </div>
                            </div>
                            <!-- /.box -->


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
                                <table id="batchTasks" class="table table-hover">
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
                                            <td><?php echo $row['taskDeadline'];?></td>
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
                                    <a href="<?php echo $_SERVER['PHP_SELF'] . '?add='.$batchId; ?>" class="btn  btn-primary  ">Add New Task</a>
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

<script type="text/javascript">

    // A $( document ).ready() block.
    $( document ).ready(function() {



    });

</script>
</body>
</html>