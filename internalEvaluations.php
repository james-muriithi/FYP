<?php
$title="FYPMS";
$subtitle="Internal Demo Evaluations";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();

//Check if External Examiner is logged in
if(!isset($_SESSION["facultyId"]))
{
    header('Location: '.'index.php');
}
$facultyId = $_SESSION['facultyId'];



//Check if form is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET["group"]) and is_numeric($_GET["group"]) ){

        $groupId =  filter_input(INPUT_GET, "group",FILTER_SANITIZE_SPECIAL_CHARS);

        //Check if group is already graded
        $sql = "SELECT id FROM grades WHERE groupId='$groupId' AND sdpPart=1 LIMIT 1 ";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $grade_check = TRUE;

        }else{
            $grade_check = FALSE;
            $projName= $conn->query("SELECT projectName FROM student_group WHERE student_group.groupId = '$groupId' ")->fetch_object()->projectName;

            //Supervisor Data
            $supervisorId = $conn->query("SELECT facultyId FROM faculty_student_group WHERE faculty_student_group.groupId = '$groupId' ")->fetch_object()->facultyId;
            if($supervisorId){
                $supervisorName = $conn->query("SELECT facultyName FROM faculty WHERE faculty.facultyId= '$supervisorId' ")->fetch_object()->facultyName;
            }

        }

    }



}

//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {


    if (isset($_POST['internalEval'])){
        //Validations
        if (isset($_POST['ae_vote']) && isset($_POST['oh_vote'])){

        }
        else{
            header('Location:' . $_SERVER['PHP_SELF'] . '?status=validation_err');
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
                <div class="col-md-12">

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
                        else if ($_GET['status'] == 'validation_err'){ ?>
                            <div style="text-align:center;" class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Error! Please fill all the required fields correctly
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




                    <!-- general form elements -->
                    <div class="box no-border">
                        <div class="box-header with-border">
                            <h3 class="box-title">Internal Demo Evaluations</h3>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">

                            <div class="form-group">
                                <label for="chooseGroup" class="col-sm-2 control-label">Choose Group</label>
                                <div class="col-sm-10">
                                    <div class="dropdown">
                                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                            Choose a Group
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                            <li><a href="<?php echo $_SERVER['PHP_SELF'];?>">---</a></li>
                                            <?php
                                            $sql = "SELECT * FROM faculty_student_group JOIN student_group ON faculty_student_group.groupId = student_group.groupId ";
                                            $result = $conn->query($sql);

                                            if ($result->num_rows > 0) {
                                                // output data of each row
                                                while($row = $result->fetch_assoc()) { ?>
                                                    <li><a href="<?php echo $_SERVER['PHP_SELF'].'?internal_group='.$row['groupId'];?>"><?php echo $row['projectName'];?></a></li>
                                                <?php    }
                                            } else { ?>
                                                <li><a href="<?php echo $_SERVER['PHP_SELF'];?>">No Groups Available</a></li>
                                            <?php   }
                                            ?>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <br>

                            <?php
                            if (isset($_GET['internal_group']) && is_numeric($_GET['internal_group']) && strlen($_GET['internal_group']) > 0){ ?>
                                <form action="" method="post" name="internalEval" data-toggle="validator">
                                <table class="table table-striped">
                                    <tr>
                                        <th>Group Team</th>
                                        <th>Allow External Exam</th>
                                        <th>Allow in Open House</th>
                                        <th style="width: 40px">Action</th>
                                    </tr>
                                    <tr>
                                        <td>FYP Management System Supervised by Zeeshan Sabir</td>
                                        <td>
                                            <select name="ae_vote" id="ae_vote" required>
                                                <option value="">--</option>
                                                <option value="2" style="color:green;">Strong Accept [2] </option>
                                                <option value="1" style="color:lightgreen;">Weak Accept [1]</option>
                                                <option value="-1" style="color:lightpink;">Weak Reject [-1] </option>
                                                <option value="-2" style="color:red;">Strong Reject [-2]</option>
                                            </select>
                                        </td>
                                        <td>
                                            <select name="oh_vote" id="oh_vote" required>
                                                <option value="">--</option>
                                                <option value="2" style="color:green;">Strong Accept [2] </option>
                                                <option value="1" style="color:lightgreen;">Weak Accept [1]</option>
                                                <option value="-1" style="color:lightpink;">Weak Reject [-1] </option>
                                                <option value="-2" style="color:red;">Strong Reject [-2]</option>
                                            </select>
                                        </td>
                                        <td>
                                           <button type="submit" class="btn btn-primary btn-flat btn-sm">Submit</button>
                                        </td>
                                    </tr>
                                </table>
                                </form>
                            <?php
                            }
                            ?>

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
<!--PAGE SCRIPT-->

</body>