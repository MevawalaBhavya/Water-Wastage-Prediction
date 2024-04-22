<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../images/favicon.ico">

    <title>Employee Table</title>
  
	<!-- Bootstrap 4.0-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/bootstrap.min.css">
	
	<!-- Data Table-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminResources/css/datatables.min.css"/>
	
	<!-- Bootstrap extend-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/bootstrap-extend.css">

	<!-- Theme style -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/master_style.css">

	<!-- AIUI Admin skins -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/_all-skins.css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>

<body class="hold-transition skin-black light-sidebar sidebar-mini">
<div class="wrapper">

   

<jsp:include page="header.jsp"></jsp:include>
  <!-- Left side column. contains the sidebar -->
 
  <jsp:include page="menu.jsp"></jsp:include>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
	  <div class="content-header d-none d-md-block">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title br-0">Employee Table</h3>
				</div>
		</div>
		</div>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">         
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Employee Table</h4>
              <h6 class="box-subtitle">Export data to Copy, CSV, Excel, PDF & Print</h6>
            </div>
		<!-- /.box-header -->
            <div class="box-body">
				<div class="table-responsive">
				  <table id="example" class="table table-bordered table-hover display nowrap margin-top-10 w-p100">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Address</th>
							<th>Mobile Number</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList}" var="i">
							<tr>
								<td>${i.registerId}</td>
								<td>${i.firstName}</td>
								<td>${i.address}</td>
								<td>${i.mobileNumber}</td>
								<td>
									<a href="/admin/deleteUser?id=${i.registerId}">Delete</a>
									<a href="/admin/editUser?id=${i.registerId}">Edit</a>
								</td>	
							</tr>	
						</c:forEach>
					</tbody>				  
					</table>
				</div>              
            </div>
            <!-- /.box-body -->
          </div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  


<jsp:include page="footer.jsp"></jsp:include>

  
  <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script src="<%=request.getContextPath()%>/adminResources/js/jquery-3.3.1.min.js"></script>
	
	<!-- popper -->
	<script src="<%=request.getContextPath()%>/adminResources/js/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="<%=request.getContextPath()%>/adminResources/js/bootstrap.min.js"></script>
	
	<!-- SlimScroll -->
	<script src="<%=request.getContextPath()%>/adminResources/js/jquery.slimscroll.min.js"></script>
	
	<!-- FastClick -->
	<script src="<%=request.getContextPath()%>/adminResources/js/fastclick.js"></script>
	
	<!-- Sparkline -->
	<script src="<%=request.getContextPath()%>/adminResources/js/jquery.sparkline.min.js"></script>
	
	<!-- AIUI Admin App -->
	<script src="<%=request.getContextPath()%>/adminResources/js/template.js"></script>
	
	<!-- This is data table -->
    <script src="<%=request.getContextPath()%>/adminResources/js/datatables.min.js"></script>
	
	<!-- AIUI Admin for Data Table -->
	<script src="<%=request.getContextPath()%>/adminResources/js/data-table.js"></script>
	
</body>
</html>

