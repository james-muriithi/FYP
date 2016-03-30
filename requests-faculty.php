<?php
require_once('includes/config.php');
require_once('includes/functions.php');

//Check if user is leader of a group
if (isset($_SESSION["facultyId"])) {


        //Check if he has student requests
        $supervisorId = $_SESSION['facultyId'];
        $sql = "SELECT * from faculty_student_request WHERE faculty_student_request.facultyId = '$supervisorId' ";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            $numOfRequests = $result->num_rows;
        }


}
//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

   if (isset($_POST['btnAccept']) OR isset($_POST['btnDelete'])){
        echo 'form submitted';
       echo 'value:'. $_POST['requestId'];
       exit();
   }




}

?>


<li class="dropdown notifications-menu " id="requests-faculty">

    <script>
        $(document).ready(function () {



        });
    </script>
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-user"></i>
        <span class="label label-primary"><?php  if (isset($numOfRequests)){echo $numOfRequests;}else{echo "0";};  ?></span>
    </a>
    <ul class="dropdown-menu">
        <li class="header">You have <?php if (isset($numOfRequests)){echo $numOfRequests;}else{echo "0";}; ?> request(s)</li>
        <li>
            <!-- inner menu: contains the actual data -->
            <ul class="menu">
                <?php
                if (isset($numOfRequests)){

                    $supervisorId = $_SESSION['facultyId'];
                    $sql = "SELECT * from faculty_student_request JOIN student_group WHERE faculty_student_request.facultyId = '$supervisorId' AND student_group.groupId = faculty_student_request.groupId ";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            $requestFrom = getStudentData($row['leaderId']); ?>
                            <li>
                                <i class="fa fa-user text-aqua"></i><?php echo $requestFrom['name'] ." [".$row['projectName']." ]"; ?> sent you request
                                <form role="form" action="<?php echo $_SERVER['PHP_SELF']; ?>" id="requestForm" method="POST">

                                    <div id="requestActions" class="text-right">
                                        <input type="hidden" name="requestId" value="<?php echo $row['requestId']; ?>">
                                        <button type="submit" name="btnAccept" form="requestForm" class="btn btn-primary btn-xs">Accept</button>
                                        <button type="submit" name="btnDelete" form="requestForm" class="btn btn-danger btn-xs">Delete</button>

<!--                                        <button id="accept---><?php //echo $row['requestId']; ?><!--" class="accept_button btn btn-primary btn-xs">Accept</button>-->
<!--                                        <button id="del---><?php //echo $row['requestId']; ?><!--" class="del_button btn btn-danger btn-xs ">Delete</button>-->
                                    </div>

                                </form>

                            </li>
                        <?php }
                    }

                }


                ?>

            </ul>
        </li>
        <?php if (isset($numOfRequests)){ ?>
            <li class="footer"><a href="#">View all</a></li>
        <?php  }
        ?>

    </ul>
</li>




