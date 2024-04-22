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
            <i class="mdi mdi-page-layout-sidebar-left"></i>
            <span>Manage Employee</span>
            <span class="pull-right-container">
              <i class="ti-plus pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
          <li><a href="/admin/loadRegister"><i class="mdi mdi-resize-bottom-right"></i>Add Employee</a></li>
            <li><a href="/admin/viewUser"><i class="mdi mdi-resize-bottom-right"></i>View Employee</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-widgets"></i>
            <span>Manage Zone</span>
            <span class="pull-right-container">
              <i class="ti-plus pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			<li><a href="/admin/addZone"><i class="mdi mdi-resize-bottom-right"></i>Add Zone</a></li>
			<li><a href="/admin/viewZone"><i class="mdi mdi-resize-bottom-right"></i>View Zone</a></li>
          </ul>
        </li>
        
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-widgets"></i>
            <span>Manage Area</span>
            <span class="pull-right-container">
              <i class="ti-plus pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			<li><a href="/admin/addArea"><i class="mdi mdi-resize-bottom-right"></i>Add Area</a></li>
			<li><a href="/admin/viewArea"><i class="mdi mdi-resize-bottom-right"></i>View Area</a></li>
          </ul>
        </li>
		
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-format-color-fill"></i>
            <span>Manage Ward</span>
            <span class="pull-right-container">
              <i class="ti-plus pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/addWard"><i class="mdi mdi-resize-bottom-right"></i>Add Ward</a></li>
            <li><a href="/admin/viewWard"><i class="mdi mdi-resize-bottom-right"></i>View Ward</a></li>
          </ul>
        </li>		
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-checkbox-multiple-blank-outline"></i>
            <span>Manage Water Data</span>
            <span class="pull-right-container">
              <i class="ti-plus pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/addWaterData"><i class="mdi mdi-resize-bottom-right"></i>Add Water Data</a></li>
            <li><a href="/admin/viewWaterData"><i class="mdi mdi-resize-bottom-right"></i>View Water Data</a></li>
          </ul>
        </li>
  		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-checkbox-multiple-blank-outline"></i>
            <span>Manage Prediction</span>
            <span class="pull-right-container">
              <i class="ti-plus pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/loadPrediction"><i class="mdi mdi-resize-bottom-right"></i>Add Prediction</a></li>
            <!-- <li><a href="/admin/viewWaterData"><i class="mdi mdi-resize-bottom-right"></i>View Water Data</a></li> -->
          </ul>
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
            <li><a href="/searchAdminComplain"><i class="mdi mdi-resize-bottom-right"></i>View Complaint</a></li>
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
            <li><a href="/admin/viewFeedback"><i class="mdi mdi-resize-bottom-right"></i>View Feedback</a></li>
          </ul>
        </li>
        	
  </ul>
    </section>
  </aside>