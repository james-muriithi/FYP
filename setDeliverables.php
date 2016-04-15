<?php
$title = "FYPMS";
$subtitle = "Set Deliverables";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();

//Check if Coordinator is loggedin
if (isset($_SESSION["isCord"])) {
    if ($_SESSION["isCord"] === "0") {
        header('Location: ' . 'index.php');
    }
} else if (!isset($_SESSION["isCord"])) {
    header('Location: ' . 'index.php');
}


//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST["deliverableID"])) {


        $configid = filter_input(INPUT_POST,'deliverableID',FILTER_SANITIZE_SPECIAL_CHARS);//$_POST["deliverableID"];
        $configStatus  = filter_input(INPUT_POST,'setDeliverableStatus',FILTER_SANITIZE_SPECIAL_CHARS); //$_POST["setDeliverableStatus"];

        $sql = "UPDATE configurations SET status='$configStatus' WHERE configurationId ='$configid' ";

        if ($configStatus == 'close'){
            if ($conn->query($sql) === TRUE) {
                //Check if config exist in timeline


            }

        }else if ($configStatus == 'open'){
            if ($conn->query($sql) === TRUE) {

                $sql = "SELECT * FROM configurations WHERE configurationId = '$configid' LIMIT 1";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    // output data of each row
                    while($row = $result->fetch_assoc()) {
                        $title = $row['taskName'];
                        $details = $row['taskDetails'];
                        $type = 'task';
                        $sdp_part = $row['projectPart'];
                        $batch_id = "12";
                    }

                    //Add notification to timeline
                    $sql = "INSERT INTO timeline (title, details, type, sdp_part, batch_id)VALUES ('$title', '$details', '$type', '$sdp_part', '$sdp_part')";

                    if ($conn->query($sql) === TRUE) {
                        header('Location:' . $_SERVER['PHP_SELF'] . '?status=t');
                    } else {
                        header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
                    }

                }


            } else {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
            }

        }



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
                <div class="col-md-1"></div>
                <div class="col-md-10">


                    <?php
                    if (isset($_GET['status'])) {
                        if ($_GET['status'] == 'f') { ?>

                            <div style="text-align:center;" class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Something Went Wrong
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>

                        <?php } else if ($_GET['status'] == 't') { ?>
                            <div style="text-align:center;" class="alert alert-success" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Changes Saved Successfully!
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                        <?php }

                    }

                    ?>

                    <!-- Code for setDeliverables starts here-->
                    <div class="box">
                        <h4 class="register-box-msg"><b>SDP - Part 1</b></h4>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-condensed">
                                <tr>
                                    <th>Week</th>
                                    <th>Task</th>
                                    <th>Deadline</th>
                                    <th>Actions</th>

                                </tr>
                                <?php
                                if ($conn->connect_error) {
                                    die("Connection failed: " . $conn->connect_error);
                                } else {

                                    $sql = "SELECT * FROM configurations WHERE configurationType='default' AND projectPart='1' ORDER BY week";
                                    $result = $conn->query($sql);
                                    //$result2 = $conn->query($sql2);
                                    $check = 0;
                                    if ($result->num_rows > 0) {
                                        // output data of each row
                                        while ($row = $result->fetch_assoc()) {
                                            ?>
                                            <tr>
                                                <td><?php echo $row["week"]; ?></td>
                                                <td><?php echo $row["taskName"]; ?></td>
                                                <td><?php echo $row["deadline"]; ?></td>

                                                <form id="setDeliverableStatus" action="<?php echo $_SERVER['PHP_SELF']; ?>"  method="post">
                                                    <td>
                                                        <div class="form-group has-feedback">
                                                            <input type="hidden" name="deliverableID" value="<?php echo $row["configurationId"]; ?>"/>
                                                            <input name="setDeliverableStatus"  class="btn btn-sm  btn-primary" type="submit" value="open"/>


                                                            <input type="hidden" name="deliverableID"  value="<?php echo $row["configurationId"]; ?>"/>
                                                            <input name="setDeliverableStatus" class="btn btn-danger  btn-sm" type="submit"  value="close"/>
                                                        </div>
                                                    </td>
                                                </form>


                                            </tr>

                                            <?php
                                        }
                                    }
                                }
                                ?>

                            </table>




                    </div>
                    <!-- /.box -->

                        <h4 class="register-box-msg"><b>SDP - Part 2</b></h4>

                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-condensed">
                                <tr>
                                    <th>Week</th>
                                    <th>Task</th>
                                    <th>Deadline</th>
                                    <th>Action</th>
                                </tr>
                                <?php
                                if ($conn->connect_error) {
                                    die("Connection failed: " . $conn->connect_error);
                                } else {

                                    $sql = "SELECT * FROM configurations WHERE configurationType='default' AND projectPart='2' ORDER BY week";
                                    $result = $conn->query($sql);
                                    //$result2 = $conn->query($sql2);
                                    $check = 0;
                                    if ($result->num_rows > 0) {
                                        // output data of each row
                                        while ($row = $result->fetch_assoc()) {
                                            ?>
                                            <tr>
                                                <td><?php echo $row["week"]; ?></td>
                                                <td><?php echo $row["taskName"]; ?></td>
                                                <td><?php echo $row["deadline"]; ?></td>

                                                <form id="setDeliverableStatus" action="setDeliverables.php"
                                                      method="post">
                                                    <td>
                                                        <div class="form-group has-feedback">
                                                            <input type="hidden" name="deliverableID" value="<?php echo $row["configurationId"]; ?>"/>
                                                            <input name="setDeliverableStatus" class="btn btn-sm  btn-primary" type="submit" value="Open"/>



                                                            <input type="hidden" name="deliverableID"  value="<?php echo $row["configurationId"]; ?>"/>
                                                            <input name="setDeliverableStatus" class="btn btn-danger  btn-sm" type="submit"  value="Close"/>
                                                        </div>
                                                    </td>
                                                </form>

                                            </tr>
                                            <?php
                                        }
                                    }
                                }
                                ?>

                            </table>

                            <div class="box-footer ">
                                <a href="<?php echo siteroot?>" class="btn  btn-default btn-sm ">Back</a>
                            </div>
                        </div>
                        <!-- /.box-body -->





                    <!-- Code for setDeliverables ends here-->
                </div>
                <div class="col-md-1"></div>
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
</body>
</html>