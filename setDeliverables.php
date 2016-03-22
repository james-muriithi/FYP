<?php
$GLOBALS['title'] = "FYPMS";
$GLOBALS['subtitle'] = "Set Deliverables";
require_once("includes/header.php");
require_once("includes/config.php");
$error = "";
session_start();
if (isset($_SESSION["isCord"])) {
    if ($_SESSION["isCord"] === "0") {
        header('Location: ' . 'index.php');
    }
} else if (!isset($_SESSION["isCord"])) {
    header('Location: ' . 'index.php');
}
if (isset($_POST["deliverableID"])) {
    $configid = $_POST["deliverableID"];
    $configStat = $_POST["setDeliverableStatus"];
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {

        $sqlUpdNoti = "UPDATE configurations SET status='$configStat' WHERE configurationId='$configid'";

        $conn->query($sqlUpdNoti);

        $conn->close();
    }
    header("Location: setDeliverables.php");
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
                <div class="col-md-2"></div>
                <div class="col-md-8">

                    <!-- Code for setDeliverables starts here-->
                    <div class="box">
                        <p class="register-box-msg"><b>Part 1</b></p>
                        <?php
                        if (isset($success_msg)) {
                            echo "<p class='text-green'>$success_msg</p>";
                        } else if (isset($error_msg)) {
                            echo "<p class='text-green'>$error_msg</p>";
                        }
                        ?>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
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

                                                <form id="setDeliverableStatus" action="setDeliverables.php"
                                                      method="post">
                                                    <td>
                                                        <div class="form-group has-feedback">
                                                            <input type="hidden" name="deliverableID"
                                                                   value="<?php echo $row["configurationId"]; ?>"/>
                                                            <input name="setDeliverableStatus"
                                                                   class="btn btn-sm" type="submit"
                                                                   value="open"/>
                                                        </div>


                                                        <div class="form-group has-feedback">

                                                            <input type="hidden" name="deliverableID"
                                                                   value="<?php echo $row["configurationId"]; ?>"/>
                                                            <input name="setDeliverableStatus"
                                                                   class="btn btn-danger" type="submit"
                                                                   value="close"/>
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
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                    <div class="box">

                        <p class="register-box-msg"><b>Part 2</b></p>

                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
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

                                                            <input type="hidden" name="deliverableID"
                                                                   value="<?php echo $row["configurationId"]; ?>"/>
                                                            <input name="setDeliverableStatus"
                                                                   class="btn btn-sm" type="submit"
                                                                   value="open"/>
                                                        </div>


                                                        <div class="form-group has-feedback">
                                                            <input type="hidden" name="deliverableID"
                                                                   value="<?php echo $row["configurationId"]; ?>"/>
                                                            <input name="setDeliverableStatus"
                                                                   class="btn btn-danger" type="submit"
                                                                   value="close"/>
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
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                    <form id="Save" action="CreateBatch.php" method="post">
                        <br/>
                        <div class="row">
                            <div class="col-lg-12">
                                <button type="submit" name="save" class="btn btn-primary btn-block btn-flat">Save
                                </button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                    <form id="Cancel" action="home.php" method="post">
                        <br/>
                        <div class="row">
                            <div class="col-lg-12">
                                <button type="submit" name="Cancel" class="btn btn-primary btn-block btn-flat">
                                    Cancel
                                </button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>


                    <!-- Code for createBatch ends here-->
                </div>
                <div class="col-md-2"></div>
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