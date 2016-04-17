<aside class="main-sidebar">
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?php if (isset($_SESSION['image'])) {
                    echo 'public/profile_images/' . $_SESSION['image'];
                } else {
                    echo 'public/profile_images/dummy.png';
                } ?>" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><?php
                    echo $_SESSION["usrnm"];
                    ?></p>
                <p><?php
                    if ($_SESSION["type"] == "Student") {
                        echo $_SESSION["usrCMS"];
                    } else if ($_SESSION["type"] == "Faculty" && $_SESSION["isCord"] == "1") {
                        echo $_SESSION["design"] ;
                    } else if ($_SESSION["type"] == "Faculty") {
                        echo $_SESSION["design"];
                    }
                    ?></p>
            </div>
        </div>


        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
                      <li  id="home "><a href="home.php"><i class="fa fa-dashboard"></i>
                    Dashboard
                </a></li>


                <?php
                if ($_SESSION["type"] === "Examiner"){ ?>
            <li><a href="gradeStudents.php"><i class="fa fa-graduation-cap"></i> <span>Grade Students</span></a></li>

            <?php }

            /****************************************
             *                                      *
             * STUDENT*******************************
             *                                      *
             ***************************************/
            if ($_SESSION["type"] === "Student") {
                $studId = $_SESSION["usrId"];

                ?>
                <li class="treeview">
                <li>
                    <a href="#"><i class="fa fa-users"></i> <span>Group</span> <i
                            class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                        <li ><a id="groupMembers" href="groupDetails.php"><i class="fa fa-circle-o"></i>GroupMembers</a></li>

                        <?php
                            

                        if ($_SESSION["isLead"] != "1" && $_SESSION["GroupID"]== 0 ) {
                            ?>
                            <li><a id="InitiateGroup" href="initiateGroup.php"><i class="fa fa-circle-o"></i>Initiate
                                    Group</a></li>
                            <li><a id="JoinGroup" href="joinGroup.php"><i class="fa fa-circle-o"></i>Join Group</a></li>
                            <?php
                        } ?>

                        <?php
                        if ($_SESSION["isLead"] == "1") {
                            /****************************************
                             *                                      *
                             * STUDENT-> Group Leader
                             *                                      *
                             ***************************************/
                            ?>
                            
                            <li><a id="chooseSupervisor" href="chooseSupervisor.php"><i class="fa fa-circle-o"></i>Choose
                                    Supervisor</a></li>
                            <?php
                        } ?>
                    </ul>
                </li>
                <?php
                if ($_SESSION["GroupID"] != "0") {
                    ?>

                    <li>
                        <a href="#"><i class="fa fa-list-alt"></i> <span>Project</span> <i
                                class="fa fa-angle-left pull-right"></i></a>
                        <ul class="treeview-menu">
                            <li><a id="setProjectName" href="setProjectName.php"><i class="fa fa-pencil-square-o"></i>Set Project Name</a>
                            <li><a id="templates" href="projectTemplates.php"><i class="fa fa fa-file"></i>Project Templates</a>
                            <li><a id="uploadDeliverables" href="uploadDeliverables.php"><i class="fa fa-upload"></i>Deliverables</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="studentTasks.php">
                            <i class="fa fa-tasks"></i><span>Tasks</span>
                        </a>
                    </li>

                    <li>
                        <a href="groupDetails.php">
                            <i class="fa fa-users"></i><span>Group Details</span>
                        </a>
                    </li>

                    <?php
                } ?>


            <?php } ?>


            <?php if ($_SESSION["type"] === "Faculty" AND $_SESSION["isCord"]==1)//if coordinator
            {
                            /****************************************
                             *                                      *
                             * COORDINATOR
                             *                                      *
                             ***************************************/
                ?>
                <li class="header">COORDINATOR MENU</li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-graduation-cap "></i> <span>Batch</span> <i
                            class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="createBatch.php"><i class="fa fa-plus"></i> <span>Create Batch</span></a></li>
                        <li><a href="batchTemplates.php"><i class="fa fa-file"></i> <span>Batch Templates</span></a></li>
                        <li><a href="batchTasks.php"><i class="fa fa-tasks"></i> <span>Batch Tasks</span></a></li>
                        <li><a href="manageBatch.php"><i class="fa fa-minus "></i> <span>Manage Batch</span></a></li>
                        <li><a href="setDeliverables.php"><i class="fa fa-circle-o"></i> <span>Deliverables</span></a>
                        </li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-user-plus "></i> <span>Register Users</span> <i
                            class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="registerStudents.php"><i class="fa fa-plus"></i> <span>Register Students</span></a>
                        </li>
                        <li><a href="registerFaculty.php"><i class="fa fa-plus"></i>
                                <span>Register Faculty Member</span></a></li>
                        <li><a href="registerExternal.php"><i class="fa fa-plus "></i> <span>Register External Examiner</span></a> </li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa  fa-pencil-square-o  "></i> <span>Manage</span> <i
                            class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="manageStudents.php"><i class="fa fa-circle-o"></i> <span>Manage Students</span></a>
                        </li>
                        <li><a href="manageGroups.php"><i class="fa fa-circle-o"></i> <span>Manage Student Groups</span></a>
                        </li>
                        <li><a href="manageFaculty.php"><i class="fa fa-circle-o "></i> <span>Manage Faculty</span></a>
                        </li>
                        <li><a href="manageTimeline.php"><i class="fa fa-circle-o "></i>
                                <span>Manage Timeline</span></a></li>
                    </ul>
                </li>

                <li>
                    <a href="sendEmail.php">
                        <i class="fa fa-envelope-o"></i> <span>Send Email</span>
                    </a>
                </li>

                <li>
                    <a href="generateReports.php">
                        <i class="fa fa fa-file-pdf-o"></i><span>Generate Reports</span>
                    </a>
                </li>

                <li>
                    <a href="projectRepository.php">
                        <i class="fa fa-database"></i><span>Project Repository</span>
                    </a>
                </li>



                <?php
            } ?>


            <?php

            if ($_SESSION["type"] === "Faculty" && $_SESSION["isAdmin"] === "1")//if Administrator
            {
                ?>
                <li>
                    <a href="registerCoordinator.php">
                        <i class="fa fa-user-md" aria-hidden="true"></i> <span>Add Coordinator</span>
                    </a>
                </li>


                <?php
            } ?>

            <?php if ($_SESSION["type"] === "Faculty")//if faculty member
            {
                            /****************************************
                             *                                      *
                             * SUPERVISOR
                             *                                      *
                             ***************************************/
                ?>
             <?php if ($_SESSION["type"]== 'Faculty' && $_SESSION['isAdmin']!=1){ ?>
                <li class="header">SUPERVISOR MENU</li>
                <li>
                    <a href="superviseGroup.php">
                        <i class="fa fa-user-plus"></i> <span>Supervise Group</span>
                    </a>

                </li>
                <li>
                    <a href="meetingLogs.php">
                        <i class="fa fa-list-ul"></i> <span>Meeting Logs</span>
                    </a>
                </li>
               <?php
            }

            }?>



            <li><a href="#"><i class="fa fa-book"></i> <span>Documentation</span></a></li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>

