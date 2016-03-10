<?php
//****************************************************************************************************************************************************
//
//													Setting global variables for title breadrumbs and header puposes
//
//**************************************************************************************************************************************************** -->

$GLOBALS['title'] = "FYPMS";
$GLOBALS['subtitle'] = "Register Students";
require_once("includes/header.php");
require_once("includes/connection.php");
$error = "";
session_start();
if (!isset($_SESSION["isAdmin"])) {
    header('Location: ' . 'index.php');
}
if ((isset($_POST['studentName'])) && (isset($_POST['studentCMS'])) && (isset($_POST['studentEmail']))) {
    if (($_POST['studentName'] != "") && ($_POST['studentCMS'] != "") && ($_POST['studentEmail'] != "")) {

        //echo $_POST['studentName']." ".$_POST['studentCMS']." ".$_POST['studentEmail']." ".$_POST['phoneNumber']." ".$_POST['batch']." ".$_POST['studentPass'];
        $StudentName = $_POST['studentName'];
        $StudentCMS = $_POST['studentCMS'];
        $StudentEmail = $_POST['studentEmail'];
        $StudentPhone = $_POST['phoneNumber'];
        $StudentBatch = $_POST['Batch'];
        $StudentPass = $_POST['studentPass'];
        $GroupId = 0;
        $StudentGender = $_POST['gender'];
        echo "batch is" . $StudentBatch . $StudentCMS . $StudentEmail . $StudentName . $StudentPhone;

        if ($conn->connect_error) {
            trigger_error('Database connection failed:' . $conn->connect_error, E_USER_ERROR);
            die("Connection failed: " . $conn->connect_error);
        } else {
            $sql = "INSERT INTO student (studentName, studentCMS, studentPhoneNo, studentEmail, studentGender, studentPassword, groupId, batchId)
				VALUES ('$StudentName','$StudentCMS','$StudentPhone','$StudentEmail','$StudentGender','$StudentPass','$GroupId','$StudentBatch')";

            $sqlCheck = "SELECT studentCMS, studentEmail FROM student WHERE studentCMS = '$StudentCMS' OR studentEmail = '$StudentEmail'";

            $results = $conn->query($sqlCheck);

            if (!$results->num_rows > 0) {
                if (!$conn->query($sql) === TRUE) {
                    $error = "Registration Unsuccessfull";
                    header("Location: registerStudents.php?status=f");
                    ?>
                    <?php
                } else {
                    $error = "";
                    header('Location: registerStudents.php?status=t');
                }
            } else {
                $error = "Already Registered";
                header('Location: ' . 'registerStudents.php?status=f'); ?>

                <?php
            }
//    unset($StudentName);
//    unset($StudentCMS);
//    unset($StudentEmail);
//    unset($StudentPhone);
//    unset($StudentBatch);
//    unset($StudentPass);
//    unset($_POST['studentName']);
//    unset($_POST['studentCMS']);
//    unset($_POST['studentEmail']);
//    unset($_POST['phoneNumber']);
//    unset($_POST['Batch']);
//    unset($_POST['studentPass']);
//    unset($_POST);
//   $_POST = array();
//   $conn->close();
//    header('Location: '.'registerStudents.php');
//    die;
        }
    }
}
?>
<?php
require_once 'includes/swal_css.php';
?>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">


    <?php require_once("includes/main-header.php"); ?>
    <?php require_once("includes/main-sidebar.php"); ?>
    <div class="content-wrapper">
        <?php require_once("includes/content-header.php"); ?>

        <section class="content" style="min-height: 700px">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">

                    <!--Code for register student starts here-->
                    <div class="register-box-body">
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
                                    Student Registered
                                    <button type="button" class="close" data-dismiss="alert">x</button>
                                </div>
                            <?php }

                        }

                        ?>
                        <div class="box-header">
                            <a href="home.php" ><i class="fa fa-arrow-left"></i></a>
                            <h4 class="text-center ">Register a Student</h4>
                        </div>
                        <form id="AddStudent" action="registerStudents.php" method="post">
                            <div class="form-group has-feedback">
                                <input type="text" name="studentCMS" class="form-control" placeholder="CMS" required/>
                                <span class="glyphicon glyphicon-asterisk form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input type="text" name="studentName" class="form-control" placeholder="Full name"
                                       required/>
                                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <label>Gender </label>
                                <input type="radio" name="gender" value="male"> Male
                                <input type="radio" name="gender" value="female"> Female<br>
                            </div>

                            <div class="form-group has-feedback">
                                <input type="email" name="studentEmail" class="form-control" placeholder="Email"
                                       required/>
                                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                            </div>

                            <div class="form-group has-feedback">
                                <input type="text" name="phoneNumber" class="form-control bfh-phone"
                                       placeholder="Phone Number"/>
                                <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <select name="Batch" class="form-control">
                                    <?php
                                    $sqlGet = "SELECT * FROM batch ORDER BY batchId DESC";
                                    $result = $conn->query($sqlGet);
                                    if ($result->num_rows > 0) {
                                        while ($row = $result->fetch_assoc()) {
                                            echo "<option value=\"" . $row["batchId"] . "\">" . $row["batchName"] . "</option>";
                                        }
                                    }
                                    $conn->close();

                                    ?>

                                    <span class="glyphicon glyphicon-education form-control-feedback"></span>
                                </select>
                            </div>
                            <div class="form-group has-feedback">
                                <input type="password" name="studentPass" class="form-control" placeholder="Password"
                                       required/>
                                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            </div>

                            <div class="box-footer ">
                                <div class="form-group pull-right">
                                <button type="submit" name="AddStudent" class="btn btn-primary">Register</button>
                                </div>
                            </div>

                        </form>

                    </div>
                    <!--Code for register student ends here-->

                </div>
                <div class="col-md-2"></div>

            </div>
        </section>
    </div>

    <?php
    //****************************************************************************************************************************************************
    //
    //															Footer Includes
    //
    //**************************************************************************************************************************************************** -->

    require_once("includes/main-footer.php");
    require_once("includes/required_js.php");
    require_once("includes/swal_js.php");
    ?>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>


</body>
</html>