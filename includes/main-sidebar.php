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
                        echo $_SESSION["design"] . "(Cordinator)";
                    } else if ($_SESSION["type"] == "Faculty") {
                        echo $_SESSION["design"];
                    }
                    ?></p>
            </div>
        </div>


        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li id="timeline"><a href="home.php"><i class="fa fa-circle-o"></i>
                            Timeline
                        </a></li>
                </ul>


                <?php

                if ($_SESSION["type"] === "Examiner"){ ?>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-graduation-cap "></i> <span>Grade Students</span> <i
                        class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href=""><i class="fa fa-plus"></i> <span>Submenu 1</span></a></li>
                    <li><a href=""><i class="fa fa-plus"></i> <span>Submenu 2</span></a></li>
                </ul>
            </li>


            <?php }


            if ($_SESSION["type"] === "Student") {
                $studId = $_SESSION["usrId"];

                ?>
                <li class="treeview">
                <li>
                    <a href="#"><i class="fa fa-users"></i> <span>Group</span> <i
                            class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                        <li><a id="group_members" href="groupDetails.php"><i class="fa fa-circle-o"></i>Group
                                Members</a></li>
                        <?php

                        if ($_SESSION["isLead"] != "1" && $_SESSION["GroupID"]== 0 ) {
                            ?>
                            <li><a id="InitiateGroup" href="initGroupForm.php"><i class="fa fa-circle-o"></i>Initiate
                                    Group</a></li>
                            <li><a id="JoinGroup" href="joinGroup.php"><i class="fa fa-circle-o"></i>Join Group</a></li>
                            <?php
                        } ?>

                        <?php
                        if ($_SESSION["isLead"] == "1") {
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
                            <li><a id="uploadDeliverables" href="uploadDeliverables.php"><i class="fa fa-upload"></i>Deliverables</a>
                            </li>
                        </ul>
                    </li>

                    <?php
                } ?>


            <?php } ?>

            <!-- check if coordinator logged in-->
            <?php if ($_SESSION["type"] === "Faculty" || isset($_SESSION["isCord"]))//if coordinator
            {
                ?>
                <li class="header">COORDINATOR MENU</li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-graduation-cap "></i> <span>Batch</span> <i
                            class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="createBatch.php"><i class="fa fa-plus"></i> <span>Create Batch</span></a></li>
                        <li><a href="deleteBatch.php"><i class="fa fa-minus "></i> <span>Delete Batch</span></a></li>
                        <li><a href="setDeliverables.php"><i class="fa fa-circle-o"></i> <span>Deliverables</span></a>
                        </li>
                    </ul>
                </li>
                <?php
            } ?>


            <?php

            if ($_SESSION["type"] === "Faculty" && $_SESSION["isAdmin"] === "1")//if Administrator
            {
                ?>
                <li class="header">ADMIN MENU</li>
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

                <?php
            } ?>

            <?php if ($_SESSION["type"] === "Faculty")//if faculty member
            {
                ?>
                <li class="header">SUPERVISOR MENU</li>
                <li>
                    <a href="superviseGroup.php">
                        <i class="fa fa-user-plus"></i> <span>Supervise Group</span>
                    </a>
                </li>
                <?php
            } ?>


            <li>
                <a href="#">
                    <i class="fa fa-bell-o"></i> <span>Notifications</span>
                </a>
            </li>

            <li>
                <a href="#">
                    <i class="fa fa-calendar"></i> <span>Calendar</span>
                </a>
            </li>

            <li><a href="#"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
            <li><a href="#"><i class="fa fa-question"></i> <span>Help</span></a></li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>

