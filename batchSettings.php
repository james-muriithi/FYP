<?php
$title="FYPMS";
$subtitle="Batch Settings";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();
if(!isset($_SESSION["isCord"]))
{
    header('Location: '.'index.php');
}



//Check if form is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {


}

//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if (isset($_POST['btnGradePt1'])){
        //echo "ALLOW GRADE PART 1";
    }

    if (isset($_POST['btnUpgradeSdp'])){

        $batchId = filter_input(INPUT_POST,'batchId',FILTER_SANITIZE_NUMBER_INT);

        // Set autocommit to off
//        mysqli_autocommit($conn, FALSE);

        $sql = "UPDATE batch SET sdpPart = 2 WHERE batchId='$batchId' LIMIT 1";

        if ($conn->query($sql) === TRUE) {
            $sql = "UPDATE student_group SET sdpPart=2 WHERE batchId='$batchId'";

            $batchName = $conn->query("SELECT batchName FROM batch WHERE batchId = '$batchId' LIMIT 1")->fetch_object()->batchName;

            $title = "Batch Upgraded";
            $details = $batchName ." has been upgraded to Senior Design Project Part 2";
            $type = "info";
            $sdpPart = 2;

            //Add this info to timeline
            $sql = "INSERT INTO timeline_student (title, details, type, batchId, sdpPart)VALUES ('$title', '$details', '$type', '$batchId', '$sdpPart');";
            $sql .= "INSERT INTO timeline_faculty (title, details, type, batchId, sdpPart)VALUES ('$title', '$details', '$type', '$batchId', '$sdpPart');";
            if ($conn->multi_query($sql) === TRUE) {
                // Commit transaction
                //mysqli_commit($conn);
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=t&settings='.$batchId);die;
            }

        }

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
                <div class="col-md-1"></div>
                <div class="col-md-10">

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
                        else if ($_GET['status'] == 'n'){ ?>
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


                    <?php if (isset($_GET['settings']) && is_numeric($_GET['settings']) && strlen($_GET['settings']) > 0 ) {
                        $batchId = filter_input(INPUT_GET, 'settings', FILTER_SANITIZE_NUMBER_INT);

                        $sql = "SELECT * FROM batch WHERE batchId ='$batchId ' LIMIT 1";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            // output data of each row
                            while ($row = $result->fetch_assoc()) {
                                $batchName = $row['batchName'];
                                $startDate = $row['startingDate'];
                                $isActive = $row['isActive'];
                                $sdpPart = $row['sdpPart'];
                            }
                        }
                        ?>
                        <!-- general form elements -->
                        <div class="box no-border">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-cog" aria-hidden="true"></i> Setting : <?php echo $batchName; ?></h3>
                            </div>
                            <!-- general form elements -->
                            <div class="box no-border">
                                <div class="box-body">

                                    <?php if ($sdpPart ==1){ ?>
                                        <form action="" method="post" onsubmit="return confirm('Are you sure you ?');">
                                            <input type="hidden" name="batchId" value="<?php echo $batchId;?>">

                                            <ul class="todo-list ui-sortable">
                                                <li class="">
                                                    <!-- drag handle -->
                                                  <span class="handle ui-sortable-handle">
                                                    <i class="fa fa-cog" aria-hidden="true"></i>
                                                  </span>
                                                    <span class="text">Allow supervisors to grade SDP Part 1</span>
                                                    <small class="label label-primary"><?php echo $batchName;?></small>
                                                    <button type="submit" name="btnGradePt1" class="btn btn-defualt  btn-xs pull-right">Submit</button>
                                                </li>
                                            </ul>
                                        </form>

                                        <form action="" method="post" onsubmit="return confirm('Are you sure you ?');">

                                            <input type="hidden" name="batchId" value="<?php echo $batchId;?>">

                                            <ul class="todo-list ui-sortable">
                                                <li class="">
                                                    <!-- drag handle -->
                                                  <span class="handle ui-sortable-handle">
                                                    <i class="fa fa-cog" aria-hidden="true"></i>
                                                  </span>
                                                    <span class="text">Upgrade Batch to SDP-2</span>
                                                    <small class="label label-primary"><?php echo $batchName;?></small>
                                                    <button type="submit" name="btnUpgradeSdp" class="btn btn-defualt  btn-xs pull-right">Submit</button>
                                                </li>
                                            </ul>
                                        </form>

                                    <?php
                                    }else{
                                        echo "No settings available";
                                    }?>





                                </div>
                                <!-- /.box-body -->

                                <div class="box-footer">

                                    <a href="<?php echo $_SERVER['PHP_SELF'] ;?>" class="btn btn-default">Back</a>
                                </div>

                            </div>
                            <!-- /.box -->

                        </div>
                        <!-- /.box -->
                        <?php
                    }
                    ?>


                    <!-- general form elements -->
                    <div class="box no-border">
                        <div class="box-header with-border">
                            <h3 class="box-title">List of Batch</h3>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <table class="table" >
                                <tr>
                                    <th>Batch Name</th>
                                    <th>SDP Part</th>
                                    <th>Start Date</th>
                                    <th>Status</th>
                                    <th >Actions</th>
                                </tr>
                                <?php
                                $sql = "SELECT * FROM batch";
                                $result = $conn->query($sql);

                                if ($result->num_rows > 0) {
                                    // output data of each row
                                    while($row = $result->fetch_assoc()) { ?>
                                        <tr>
                                            <td><?php echo $row['batchName']; ?></td>
                                            <td><?php echo $row['sdpPart']; ?></td>
                                            <td><?php echo $row['startingDate']; ?></td>
                                            <td><?php if ($row['isActive']){
                                                    echo "<span class=\"label label-success\">Active</span>";
                                                }else if ($row['isActive']){
                                                    echo "<span class=\"label label-danger\">Inactive</span>";
                                                }  ?>
                                            </td>
                                            <td>
                                                <a href="<?php echo $_SERVER['PHP_SELF'].'?settings='.$row['batchId']?>" class="btn btn-default btn-sm" ><i class="fa fa-cog" aria-hidden="true"></i> Settings</a>
                                            </td>
                                        </tr>

                                    <?php
                                    }
                                } ?>
                            </table>

                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">

                        </div>

                    </div>
                    <!-- /.box -->





                </div>
                <div class="col-md-1"></div>

            </div>
        </section>
    </div><!-- ./content-wrapper -->
    <!--</div>-->
    <?php
    require_once("includes/main-footer.php");
    ?>
</div>
<!-- ./wrapper -->
<?php
require_once("includes/required_js.php");
?>

</body>