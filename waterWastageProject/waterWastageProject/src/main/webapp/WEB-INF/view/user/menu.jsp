
  <aside class="main-sidebar">
    <!-- sidebar-->
    <section class="sidebar">		
	  <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="image">
          <img src="<%request.getContextPath();%>/adminResources/image/icon.jpg" class="rounded-circle" alt="User Image">
        </div>
        <div class="info">
          <p>Only for Earth</p>
    <!--       <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
        </div>
      </div>
		
      <!-- sidebar menu-->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-view-dashboard"></i> <span>Dashboard</span>	
          </a>			
        </li>
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-file-chart"></i>
            <span>Manage Complain</span>
            <span class="pull-right-container">
              <i class="ti-plus pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/addComplain"><i class="mdi mdi-resize-bottom-right"></i>Post Complaint</a></li>
            <li><a href="/searchUserComplain"><i class="mdi mdi-resize-bottom-right"></i>View Complaint</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-file-document"></i>
             <span>Manage Feedback</span>
            <span class="pull-right-container">
              <i class="ti-plus pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
          	<li><a href="/postFeedback"><i class="mdi mdi-resize-bottom-right"></i>Post Feedback</a></li>
            <li><a href="/viewUserFeedback"><i class="mdi mdi-resize-bottom-right"></i>View Feedback</a></li>
          </ul>
        </li>  
    </section>
  </aside>