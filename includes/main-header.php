<header class="main-header">
<a href=<?php echo $_SERVER['REQUEST_URI']?> class="logo">
  <!-- mini logo for sidebar mini 50x50 pixels -->
  <span class="logo-mini"><b>FYP</b></span>
  <!-- logo for regular state and mobile devices -->
  <span class="logo-lg"><b>FYP</b><small>Management System</small></span>
</a>
<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-static-top" role="navigation">
  <!-- Sidebar toggle button-->
  <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
    <span class="sr-only">Toggle navigation</span>
  </a>

  <div class="navbar-custom-menu">
    <ul class="nav navbar-nav">
      <!-- Messages: style can be found in dropdown.less-->
      <li class="dropdown messages-menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <i class="fa fa-envelope-o"></i>
          <span class="label label-success">4</span>
        </a>
        <ul class="dropdown-menu">
          <li class="header">You have 4 messages</li>
          <li>
            <!-- inner menu: contains the actual data -->
            <ul class="menu">
              <li><!-- start message -->
                <a href="#">
                  <div class="pull-left">
                    <img src="dist/img/user1-128x128.jpg" class="img-circle" alt="User Image">
                  </div>
                  <h4>
                    Support Team
                    <small><i class="fa fa-clock-o"></i> 5 mins</small>
                  </h4>
                  <p>Why not buy a new awesome theme?</p>
                </a>
              </li>
              <!-- end message -->
              <li>
                <a href="#">
                  <div class="pull-left">
                    <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                  </div>
                  <h4>
                    AdminLTE Design Team
                    <small><i class="fa fa-clock-o"></i> 2 hours</small>
                  </h4>
                  <p>Why not buy a new awesome theme?</p>
                </a>
              </li>
              <li>
                <a href="#">
                  <div class="pull-left">
                    <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                  </div>
                  <h4>
                    Developers
                    <small><i class="fa fa-clock-o"></i> Today</small>
                  </h4>
                  <p>Why not buy a new awesome theme?</p>
                </a>
              </li>
              <li>
                <a href="#">
                  <div class="pull-left">
                    <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                  </div>
                  <h4>
                    Sales Department
                    <small><i class="fa fa-clock-o"></i> Yesterday</small>
                  </h4>
                  <p>Why not buy a new awesome theme?</p>
                </a>
              </li>
              <li>
                <a href="#">
                  <div class="pull-left">
                    <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                  </div>
                  <h4>
                    Reviewers
                    <small><i class="fa fa-clock-o"></i> 2 days</small>
                  </h4>
                  <p>Why not buy a new awesome theme?</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="footer"><a href="#">See All Messages</a></li>
        </ul>
      </li>
      <!-- Notifications: style can be found in dropdown.less -->
      <li class="dropdown notifications-menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <i class="fa fa-bell-o"></i>
          <span class="label label-warning">10</span>
        </a>
        <ul class="dropdown-menu">
          <li class="header">You have 10 notifications</li>
          <li>
            <!-- inner menu: contains the actual data -->
            <ul class="menu">
              <li>
                <a href="#">
                  <i class="fa fa-users text-aqua"></i> 5 new members joined today
                </a>
              </li>
              <li>
                <a href="#">
                  <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                  page and may cause design problems
                </a>
              </li>
              <li>
                <a href="#">
                  <i class="fa fa-users text-red"></i> 5 new members joined
                </a>
              </li>
              <li>
                <a href="#">
                  <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                </a>
              </li>
              <li>
                <a href="#">
                  <i class="fa fa-user text-red"></i> You changed your username
                </a>
              </li>
            </ul>
          </li>
          <li class="footer"><a href="#">View all</a></li>
        </ul>
      </li>
      <!-- Tasks: style can be found in dropdown.less -->
      
      <li id="groupRequestsMenu" class="dropdown tasks-menu">
        
      </li>

      <!-- User Account: style can be found in dropdown.less -->
      <li class="dropdown user user-menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <img src="<?php if (isset($_SESSION['image'])){
                 echo 'public/profile_images/'.$_SESSION['image'];
             }else {echo 'public/profile_images/dummy.png';}?>" class="user-image" alt="User Image">
          <span class="hidden-xs"><?php echo $_SESSION["usrnm"]; ?></span>
        </a>
        <ul class="dropdown-menu">
          <!-- User image -->
          <li class="user-header">
            <img src="<?php if (isset($_SESSION['image'])){
                 echo 'public/profile_images/'.$_SESSION['image'];
             }else {echo 'public/profile_images/dummy.png';}?>"
             class="img-circle" alt="User Image">
            <p>
                <!--if student then show its CMS if other show its designation-->
              <?php echo $_SESSION["usrnm"]; ?>
                <small>[
                    <?php 
                    if(isset ($_SESSION["usrCMS"]) ){
                        echo $_SESSION["usrCMS"];
                    }
                    else if(isset ($_SESSION["design"]) ){
                            echo $_SESSION["design"];
                    }
                    else{
                            echo "";
                    }
	
                    ?>
                    ]</small>
            </p>
          </li>
          <!-- Menu Body -->
          <li class="user-body">
            <div class="row">
              <div class="col-xs-4 text-center">
                <a href="editProfile.php">Profile</a>
              </div>
              <div class="col-xs-4 text-center">
                <a href="#">Settings</a>
              </div>
              <div class="col-xs-4 text-center">
                <a href="#">Groups</a>
              </div>
            </div>
            <!-- /.row -->
          </li>
          <!-- Menu Footer-->
          <li class="user-footer">
            <div class="pull-left">
              <a href="editProfile.php" class="btn btn-default btn-flat">Profile</a>
            </div>
            <div class="pull-right">
            <form id="signout" action="home.php" method="post">
                    <a href="signout.php"  class="btn btn-default btn-flat">Sign out</a>
                    <input type="hidden" name="signout" value="signout"/>
            </form>

            </div>
          </li>
        </ul>
      </li>

    </ul>
  </div>
</nav>
</header>
