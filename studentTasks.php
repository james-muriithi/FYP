<?php
$title="FYPMS";
$subtitle="Tasks";
require_once("includes/header.php");
require_once("includes/config.php");
require_once("includes/functions.php");
session_start();

//Check if student is logged in
if(!isset($_SESSION["usrCMS"]))
{
    header('Location: '.'index.php');
}
$check = true; //
$groupId = $_SESSION['GroupID'];
$batchId = $_SESSION['BatchID'];

//Check if form is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {




}

//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {





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
                <div class="col-md-12">


                    <?php
                    if (isset($_GET['status'])){
                        if ($_GET['status'] == 't'){ ?>
                            <div style="text-align:center;" class="alert alert-success" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Deliverable Uploaded Successfully!
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
                                Error! Filesize exceeded ; Max Filesize 50Mib
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                            <?php
                        }
                        else if ($_GET['status'] == 'e'){ ?>
                            <div style="text-align:center;" class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Error! File type not supported ; Allowed file types (PDF,DOCX,RAR,ZIP,JPG)
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                            <?php
                        }
                    }

                    ?>

                    <?php if (isset($_GET['details']) && is_numeric($_GET['details']) && strlen($_GET['details'])>0){
                        $detailsId = filter_input(INPUT_GET,'details',FILTER_SANITIZE_NUMBER_INT);
                        $sql = "SELECT * FROM batch_tasks WHERE taskId='$detailsId' LIMIT 1 ";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            // output data of each row
                            while($row = $result->fetch_assoc()) {
                                $taskName = $row['taskName'];
                                $taskDetail = $row['taskDetail'];
                                $taskDeadline = $row['taskDeadline'];


                            }
                        } else {
                            $taskName = '--';
                            $taskDetail = 'Nothing to show';
                            $taskName = '--';

                        }

                        ?>

                        <!-- Modal -->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel"><?php echo $taskName;?></h4>
                                    </div>
                                    <div class="modal-body">
                                        <?php echo $taskDetail;?>
                                        <br/>

                                        <p class="text-danger text-center">Deadline : <?php echo $taskDeadline; ?></p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php
                    } ?>

                    <!-- general form elements -->
                    <div class="box no-border ">
                        <div class="box-header with-border">
                            <h3 class="box-title">SDP Part 1</h3>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <table class="table table-striped">
                                <tr>
                                    <th style="width: 10px">Week</th>
                                    <th>Task</th>
                                    <th>Details</th>
                                    <th>Template</th>
                                    <th>Deadline</th>
                                    <th>Action</th>
                                </tr>
                                <?php
                                $sql = "SELECT * FROM batch_tasks WHERE batchId ='$batchId' AND sdpPart = '1' ORDER BY taskWeek ASC ";
                                $result = $conn->query($sql);

                                if ($result->num_rows > 0) {
                                    // output data of each row
                                    while($row = $result->fetch_assoc()) { ?>

                                        <tr>
                                            <td><?php echo $row['taskWeek']; ?></td>
                                            <td><?php echo $row['taskName']; ?></td>
                                            <td>
                                                <?php
                                                    if (strlen($row['taskDetail']) >= 100){
                                                        echo getExcerpt($row['taskDetail'],0,100);?>
                                                        <a href="<?php echo $_SERVER['PHP_SELF'].'?details='.$row['taskId']?>">Show Details</a>

                                                    <?php
                                                    }
                                                    else{
                                                        echo $row['taskDetail'];
                                                    }

                                                ?>
                                            </td>
                                            <td><?php echo $row['templateId']; ?></td>
                                            <td><?php echo $row['taskDeadline']; ?></td>

                                            <td>
                                                <?php  if ($row['hasDeliverable'] == '1'){ ?>
                                                    <a href="<?php echo $_SERVER['PHP_SELF'].'?upload='.$row['taskId']?>" class="btn btn-default btn-sm"><i class="fa fa-upload"></i> Upload</a>
                                                <?php
                                                }else{
                                                    echo '-- --';
                                                } ?>
                                            </td>

                                        </tr>
                                    <?php
                                    }
                                }
                                ?>

                            </table>

                        </div>
                        <!-- /.box-body -->

                        <div class="box-header with-border">
                            <h3 class="box-title">SDP Part 2</h3>
                        </div>
                        <!-- /.box-header -->


                        <div class="box-body">
                            <table class="table table-striped">
                                <tr>
                                    <th style="width: 10px">Week</th>
                                    <th>Task</th>
                                    <th>Details</th>
                                    <th>Template</th>
                                    <th>Deadline</th>
                                    <th>Action</th>
                                </tr>
                                <?php
                                $sql = "SELECT * FROM batch_tasks WHERE batchId ='$batchId' AND sdpPart = '2' ORDER BY taskWeek ASC ";
                                $result = $conn->query($sql);

                                if ($result->num_rows > 0) {
                                    // output data of each row
                                    while($row = $result->fetch_assoc()) { ?>

                                        <tr>
                                            <td><?php echo $row['taskWeek']; ?></td>
                                            <td><?php echo $row['taskName']; ?></td>
                                            <td>
                                                <?php
                                                if (strlen($row['taskDetail']) >= 100){
                                                    echo getExcerpt($row['taskDetail'],0,100);?>


                                                    <a href="<?php echo $_SERVER['PHP_SELF'].'?details='.$row['taskId']?>">Show Details</a>


                                                    <?php
                                                }
                                                else{
                                                    echo $row['taskDetail'];
                                                }

                                                ?>
                                            </td>
                                            <td><?php echo $row['templateId']; ?></td>
                                            <td><?php echo $row['taskDeadline']; ?></td>

                                            <td>
                                                <?php  if ($row['hasDeliverable'] == '1'){ ?>
                                                    <a href="<?php echo $_SERVER['PHP_SELF'].'?upload='.$row['taskId']?>" class="btn btn-default btn-sm"><i class="fa fa-upload"></i> Upload</a>
                                                    <?php
                                                }else{
                                                    echo '-- --';
                                                } ?>
                                            </td>

                                        </tr>
                                        <?php
                                    }
                                }
                                ?>

                            </table>

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

<script src="plugins/bootstrap-filestyle-1.2.1/bootstrap-filestyle.min.js"></script>

<script type="text/javascript">
    $('#myModal').modal('show');



</script>



<script>
    $(":file").filestyle({

        size:   sm
    });
</script>
</body>