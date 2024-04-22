<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib  prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <%@taglib  prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="<%=request.getContextPath()%>/adminResources/image/favicon.ico">

    <title>Add Prediction </title>
  
	<!-- Bootstrap 4.0-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/bootstrap.min.css">
	
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

<script type="text/javascript">

function checkPredictionType()
{
	var predictionType = document.getElementById("predictionType");
	var usage = document.getElementById("usagediv");
	alert("In Function");
	
	if(predictionType.value == "usage")
	{
		usage.style.display='none';
	}
	else
	{
		usage.style.display='';
	}
	
}
</script>
<script type="text/javascript">

function PredictionVerification()
{
	
	alert("in function()");
	var dateOfWater = document.getElementById("date1").value;
	var supply = document.getElementById("supply").value;
	var predictionType = document.getElementById("predictionType").value;
	var population = document.getElementById("population").value;
	var zoneId = document.getElementById("zoneId").value;
	var wardId = document.getElementById("wardId").value;
	var usagePrediction = document.getElementById("usagePrediction").value;
	
	
	
var htp = new XMLHttpRequest();
	
	htp.onreadystatechange=function()
	{
		
		if(htp.readyState==4)
		{	
		
			alert(htp.responseText);
	
		}
	
	}
	
	if(predictionType == "usage")
	{
		alert("in if");
		console.log(dateOfWater);
		console.log(supply);
		console.log(predictionType);
		console.log(population);
		console.log(zoneId);
		console.log(wardId);
		
		htp.open("GET","http://127.0.0.1:2020/admin/getData?dateOfWater="+dateOfWater+"&predictionType="+predictionType+"&supply="+supply+"&population="+population
			+"&zoneId="+zoneId+"&wardId="+wardId,true);
	}
	else
	{
		alert("in else");
		console.log(dateOfWater);
		console.log(supply);
		console.log(predictionType);
		console.log(population);
		console.log(zoneId);
		console.log(wardId);
		console.log(usagePrediction);
		
		htp.open("GET","http://127.0.0.1:2020/admin/getData?dateOfWater="+dateOfWater+"&predictionType="+predictionType+"&supply="+supply+"&population="+population
				+"&zoneId="+zoneId+"&wardId="+wardId+"&usage="+usagePrediction,true);
	}
	htp.send();
	
}
</script>
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
					<h3 class="page-title br-0">Add Prediction</h3>
				</div>
			</div>
		</div>

    <!-- Main content -->
    <section class="content">
		<div class="row">
			<div class="col-12">
				 <!-- Basic Forms -->
				  <div class="box">
					
					<!-- /.box-header -->
					<div class="box-body">
					  <div class="row">
						<div class="col">
							<f:form  action="/admin/addPrediction" modelAttribute="WastagePredictionVO" method="post">
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<h5>Enter Date <span class="text-danger">*</span></h5>
											<div class="controls">
												<input type="date"  id="date1" path="dateOfWater" class="form-control" placeholder="Enter Date" required="required"/></div>
										<%-- 	<div class="form-control-feedback"><small>Add <code>required</code> attribute to field for required validation.</small></div> --%>
										</div>
										<div class="form-group">
											<h5>Supply <span class="text-danger">*</span></h5>
											<div class="controls">
												<f:input class="form-control" id="supply" path="supply" placeholder="Supply" required="required" data-validation-required-message="This field is required"  ></f:input>
											</div>	
										</div>	
										<div class="form-group">
											<h5>Prediction type <span class="text-danger">*</span></h5>
											<div class="controls">
												<f:select  required="required" class="form-control" path="predectionType" id="predictionType" onChange="checkPredictionType()">
														<f:option value="usage">usage</f:option>
														<f:option value="wastage">wastage</f:option>
												</f:select>
											</div>
										</div>		
										
										<div class="form-group">
											<h5>Zone <span class="text-danger">*</span></h5>
											<div class="controls">
												<f:select  required="required" class="form-control" path="zoneVO.id" id="zoneId">
													<c:forEach items="${zoneList}" var="i">
														<f:option value="${i.id}">${i.zoneName}</f:option>
													</c:forEach><br>
												</f:select>
											</div>
										</div>	
											
										<div class="form-group">
											<h5>Ward <span class="text-danger">*</span></h5>
											<div class="controls">
												<f:select  required="required" class="form-control" path="wardVO.id" id="wardId">
													<c:forEach items="${wardList}" var="i">
														<f:option value="${i.id}">${i.wardName}</f:option>
													</c:forEach><br>
												</f:select>
											</div>
										</div>	
											
										<div class="form-group">
											<h5>Population <span class="text-danger">*</span></h5>
											<div class="controls">
												<f:input class="form-control" path="population" id="population" placeholder="Population" required="required" data-validation-required-message="This field is required"></f:input>
											</div>	
										</div>		
										
										<div class="form-group" style="display:none" id="usagediv">
											<h5>Usage <span class="text-danger">*</span></h5>
											<div class="controls">
												<f:input class="form-control" path="usagePrediction"  placeholder="Usage" id="usagePrediction"></f:input>
											</div>	
										</div>	
										
										<f:hidden path="id"/>
										<div class="text-xs-right">
											<button type="button" class="btn btn-info" onclick="PredictionVerification()">Add</button>
										</div>
									</div>
								</div>
							</f:form>
						</div>
						<!-- /.col -->
					  </div>
					  <!-- /.row -->
					</div>
					<!-- /.box-body -->
				  </div>
				  <!-- /.box -->
			</div>
		</div>      
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
   
<jsp:include page="footer.jsp"></jsp:include>
   
   
   
  <!-- Control Sidebar -->
  <%-- <aside class="control-sidebar control-sidebar-light">
	  <div class="rpanel-title"><span class="btn pull-right"><i class="ion ion-close" data-toggle="control-sidebar"></i></span> </div>  
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="nav-item"><a href="#control-sidebar-home-tab" data-toggle="tab" class="active">Chat</a></li>
      <li class="nav-item"><a href="#control-sidebar-settings-tab" data-toggle="tab">Todo</a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
	  <div class="tab-pane active" id="control-sidebar-home-tab">
          <div class="flexbox">
			<a href="javascript:void(0)" class="text-grey">
				<i class="ti-more"></i>
			</a>	
			<p>Users</p>
			<a href="javascript:void(0)" class="text-right text-grey"><i class="ti-plus"></i></a>
		  </div>
		  <div class="lookup lookup-sm lookup-right d-none d-lg-block">
			<input type="text" name="s" placeholder="Search" class="w-p100">
		  </div>
          <div class="media-list media-list-hover mt-20">
			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-success" href="#">
				<img src="<%=request.getContextPath()%>/adminResources/image/1.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Tyler</strong></a>
				</p>
				<p>Praesent tristique diam...</p>
				  <span>Just now</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-danger" href="#">
				<img src="<%=request.getContextPath()%>/adminResources/image/2.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Luke</strong></a>
				</p>
				<p>Cras tempor diam ...</p>
				  <span>33 min ago</span>
			  </div>
			</div>1

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-warning" href="#">
				<img src="<%=request.getContextPath()%>/adminResources/image/3.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Evan</strong></a>
				</p>
				<p>In posuere tortor vel...</p>
				  <span>42 min ago</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-primary" href="#">
				<img src="<%=request.getContextPath()%>/adminResources/image/4.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Evan</strong></a>
				</p>
				<p>In posuere tortor vel...</p>
				  <span>42 min ago</span>
			  </div>
			</div>			
			
			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-success" href="#">
				<img src="<%=request.getContextPath()%>/adminResources/image/1.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Tyler</strong></a>
				</p>
				<p>Praesent tristique diam...</p>
				  <span>Just now</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-danger" href="#">
				<img src="<%=request.getContextPath()%>/adminResources/image/2.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Luke</strong></a>
				</p>
				<p>Cras tempor diam ...</p>
				  <span>33 min ago</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-warning" href="#">
				<img src="<%=request.getContextPath()%>/adminResources/image/3.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Evan</strong></a>
				</p>
				<p>In posuere tortor vel...</p>
				  <span>42 min ago</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-primary" href="#">
				<img src="<%=request.getContextPath()%>/adminResources/image/4.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Evan</strong></a>
				</p>
				<p>In posuere tortor vel...</p>
				  <span>42 min ago</span>
			  </div>
			</div>
			  
		  </div>
      </div>
	  <div class="tab-pane" id="control-sidebar-settings-tab">
          <div class="flexbox">
			<a href="javascript:void(0)" class="text-grey">
				<i class="ti-more"></i>
			</a>	
			<p>Todo List</p>
			<a href="javascript:void(0)" class="text-right text-grey"><i class="ti-plus"></i></a>
		  </div>
        <ul class="todo-list mt-20">
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_1" class="filled-in">
			  <label for="basic_checkbox_1" class="mb-0 h-15"></label>
			  <!-- todo text -->
			  <span class="text-line">Nulla vitae purus</span>
			  <!-- Emphasis label -->
			  <small class="badge bg-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
			  <!-- General tools such as edit or delete-->
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_2" class="filled-in">
			  <label for="basic_checkbox_2" class="mb-0 h-15"></label>
			  <span class="text-line">Phasellus interdum</span>
			  <small class="badge bg-info"><i class="fa fa-clock-o"></i> 4 hours</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_3" class="filled-in">
			  <label for="basic_checkbox_3" class="mb-0 h-15"></label>
			  <span class="text-line">Quisque sodales</span>
			  <small class="badge bg-warning"><i class="fa fa-clock-o"></i> 1 day</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_4" class="filled-in">
			  <label for="basic_checkbox_4" class="mb-0 h-15"></label>
			  <span class="text-line">Proin nec mi porta</span>
			  <small class="badge bg-success"><i class="fa fa-clock-o"></i> 3 days</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_5" class="filled-in">
			  <label for="basic_checkbox_5" class="mb-0 h-15"></label>
			  <span class="text-line">Maecenas scelerisque</span>
			  <small class="badge bg-primary"><i class="fa fa-clock-o"></i> 1 week</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_6" class="filled-in">
			  <label for="basic_checkbox_6" class="mb-0 h-15"></label>
			  <span class="text-line">Vivamus nec orci</span>
			  <small class="badge bg-info"><i class="fa fa-clock-o"></i> 1 month</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_7" class="filled-in">
			  <label for="basic_checkbox_7" class="mb-0 h-15"></label>
			  <!-- todo text -->
			  <span class="text-line">Nulla vitae purus</span>
			  <!-- Emphasis label -->
			  <small class="badge bg-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
			  <!-- General tools such as edit or delete-->
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_8" class="filled-in">
			  <label for="basic_checkbox_8" class="mb-0 h-15"></label>
			  <span class="text-line">Phasellus interdum</span>
			  <small class="badge bg-info"><i class="fa fa-clock-o"></i> 4 hours</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_9" class="filled-in">
			  <label for="basic_checkbox_9" class="mb-0 h-15"></label>
			  <span class="text-line">Quisque sodales</span>
			  <small class="badge bg-warning"><i class="fa fa-clock-o"></i> 1 day</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_10" class="filled-in">
			  <label for="basic_checkbox_10" class="mb-0 h-15"></label>
			  <span class="text-line">Proin nec mi porta</span>
			  <small class="badge bg-success"><i class="fa fa-clock-o"></i> 3 days</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
		  </ul>
      </div>
    </div>
  </aside>
 --%>  <!-- /.control-sidebar -->
  
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
	
	<!-- Form validator JavaScript -->
    <script src="<%=request.getContextPath()%>/adminResources/js/validation.js"></script>
    <script>
    ! function(window, document, $) {
        "use strict";
			$("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
		}(window, document, jQuery);
    </script>
	
</body>
</html>
