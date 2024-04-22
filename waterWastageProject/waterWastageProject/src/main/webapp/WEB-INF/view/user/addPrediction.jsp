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
	
	//alert("in function()");
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
		
		//	alert(htp.responseText);
	
		}
	
	}
	
	if(predictionType == "usage")
	{
		//alert("in if");
		console.log(dateOfWater);
		console.log(supply);
		console.log(predictionType);
		console.log(population);
		console.log(zoneId);
		console.log(wardId);
		
		htp.open("GET","http://127.0.0.1:2020/user/getData?dateOfWater="+dateOfWater+"&predictionType="+predictionType+"&supply="+supply+"&population="+population
				+"&zoneId="+zoneId+"&wardId="+wardId,true);
	}
	else
	{
		//alert("in else");
		console.log(dateOfWater);
		console.log(supply);
		console.log(predictionType);
		console.log(population);
		console.log(zoneId);
		console.log(wardId);
		console.log(usagePrediction);
		
		htp.open("GET","http://127.0.0.1:2020/user/getData?dateOfWater="+dateOfWater+"&predictionType="+predictionType+"&supply="+supply+"&population="+population
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
												<input type="date"  id="date1" name="date" class="form-control" placeholder="Enter Date" required="required"/></div>
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
