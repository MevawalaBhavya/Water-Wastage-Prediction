<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon"
	href="<%request.getContextPath();%>/adminResources/image/favicon.ico">

<title>Water Wastage Prediction</title>

<!-- Bootstrap 4.0-->
<link rel="stylesheet"
	href="<%request.getContextPath();%>/adminResources/css/bootstrap.css">

<!-- Bootstrap extend-->
<link rel="stylesheet"
	href="<%request.getContextPath();%>/adminResources/css/bootstrap-extend.css">

<!-- theme style -->
<link rel="stylesheet"
	href="<%request.getContextPath();%>/adminResources/css/master_style.css">

<!-- AIUI Admin skins -->
<link rel="stylesheet"
	href="<%request.getContextPath();%>/adminResources/css/_all-skins.css">

<script
	src="<%=request.getContextPath()%>/adminResources/js/highcharts.js"></script>
<script
	src="<%=request.getContextPath()%>/adminResources/js/exporting.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->


</head>

<!-- <body class="hold-transition skin-black light-sidebar sidebar-mini"> -->
<div class="wrapper">


	<jsp:include page="header.jsp"></jsp:include>



	<!-- Left side column. contains the logo and sidebar -->



	<jsp:include page="menu.jsp"></jsp:include>



	<!-- Content Wrapper. Contains page content -->

	<div class="content-wrapper">

		<!--	Content Header  (Page header) -->
		<div class="content-header d-none d-md-block">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title br-0">Dashboard</h3>
				</div>
		
			</div>
		</div>


		<section class="content">
			<div class="container-full">
				<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
				<div class="row">
													
					<%@taglib  prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    				<%@taglib  prefix="f" uri="http://www.springframework.org/tags/form"%>
					<div class="col-lg-12 col-12">
					
						<form  action="seachByWardZOne" method="post">
							<div class="row">
								<div class="col-4">
									<div class="form-group">
										<h5>
											Zone<span class="text-danger">*</span>
										</h5>
										<div class="controls">
											<select required="required" class="form-control"
												name="zoneId">
												<c:forEach items="${zoneList}" var="i">
													<option value="${i.id}">${i.zoneName}</option>
												</c:forEach>
												<br>
											</select>
										</div>
									</div>

								</div>
								<div class="col-4">
									<div class="form-group">
										<h5>
											Ward<span class="text-danger">*</span>
										</h5>
										<div class="controls">
											<select required="required" class="form-control"
												name="wardId">
												<c:forEach items="${wardList}" var="i">
													<option value="${i.id}">${i.wardName}</option>
												</c:forEach>
												<br>
											</select>
										</div>
									</div>

								</div>
								<div class="col-2">
									<div class="text-xs-right">
											<button type="submit" class="btn btn-info">Search</button>
										</div>
								</div>
								
								
								
							</div>
						</form>
				</div>
				
				<div class="col-lg-6">
					
						<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>


						<c:forEach var="i" items="${dataByWardZOneWastage}">

							<c:forEach var="k" items="${i}" varStatus="j">
								<c:if test="${j.count eq 1}">
									<input type="hidden" name="xvalue" value="${k}" />
								</c:if>
								<c:if test="${j.count eq 2}">
									<input type="hidden" name="yvalue" value="${k}" />
								</c:if>
								
							</c:forEach>
						</c:forEach>
				</div>
				<div class="col-lg-6">
					
						<div id="seachByWardZOneUsage" style="min-width: 310px; height: 400px; margin: 0 auto"></div>


						<c:forEach var="i" items="${seachByWardZOneUsage}">

							<c:forEach var="k" items="${i}" varStatus="j">
								<c:if test="${j.count eq 1}">
									<input type="hidden" name="xvalue1" value="${k}" />
								</c:if>
								<c:if test="${j.count eq 2}">
									<input type="hidden" name="yvalue1" value="${k}" />
								</c:if>
								
							</c:forEach>
						</c:forEach>
				</div>
		</section>
		<!--  /.content
  </div> 
  /.content-wrapper
   -->


		<jsp:include page="footer.jsp"></jsp:include>

		<div class="control-sidebar-bg"></div>
	</div>
</div>
<!-- ./wrapper -->



<!-- jQuery 3 -->
<script
	src="<%request.getContextPath();%>/adminResources/js/jquery-3.3.1.min.js"></script>

<!-- jQuery UI 1.11.4 -->
<script
	src="<%request.getContextPath();%>/adminResources/js/jquery-ui.js"></script>

<!-- popper -->
<script
	src="<%request.getContextPath();%>/adminResources/js/popper.min.js"></script>

<!-- Bootstrap 4.0-->
<script
	src="<%request.getContextPath();%>/adminResources/js/bootstrap.js"></script>

<!-- Slimscroll -->
<script
	src="<%request.getContextPath();%>/adminResources/js/jquery.slimscroll.js"></script>

<!-- FastClick -->
<script
	src="<%request.getContextPath();%>/adminResources/js/fastclick.js"></script>

<!-- Sparkline -->
<script
	src="<%request.getContextPath();%>/adminResources/js/jquery.sparkline.min.js"></script>

<!-- apexcharts -->
<script
	src="<%request.getContextPath();%>/adminResources/js/irregular-data-series.js"></script>
<script
	src="<%request.getContextPath();%>/adminResources/js/apexcharts.js"></script>

<!-- FLOT CHARTS -->
<script
	src="<%request.getContextPath();%>/adminResources/js/jquery.flot.js"></script>
<script
	src="<%request.getContextPath();%>/adminResources/js/jquery.flot.resize.js"></script>
<script
	src="<%request.getContextPath();%>/adminResources/js/sampledata1.js"></script>

<!-- AIUI Admin App -->
<script
	src="<%request.getContextPath();%>/adminResources/js/template.js"></script>

<!-- AIUI Admin dashboard demo (This is only for demo purposes) -->
<script
	src="<%request.getContextPath();%>/adminResources/js/dashboard.js"></script>
	
	<!-- wastage graph -->
	
	<script>
	var xvalue = document.getElementsByName("xvalue");
	var xdata = [];
	var yvalue = document.getElementsByName("yvalue");
	var ydata = [];
	for (var i = 0; i < xvalue.length; i++) {
		xdata.push(xvalue[i].value);
		ydata.push(parseFloat(yvalue[i].value));
	}
	Highcharts.chart({
		chart : {
			renderTo : "container",

			type : 'column'
		},
		title : {
			text : 'Yearly water wastage'
		},
		subtitle : {
			text : ''
		},
		xAxis : {
			categories : xdata,
			crosshair : true
		},
		yAxis : {
			min : 0,
			title : {
				text : 'wastage'
			}
		},
		plotOptions : {
			column : {
				pointPadding : 0.2,
				borderWidth : 0
			}
		},
		series : [ {
			name : 'year',
			data : ydata

		} ]
	});
</script>

<script>
	var xvalue = document.getElementsByName("xvalue1");
	var xdata = [];
	var yvalue = document.getElementsByName("yvalue1");
	var ydata = [];
	for (var i = 0; i < xvalue.length; i++) {
		xdata.push(xvalue[i].value);
		ydata.push(parseFloat(yvalue[i].value));
	}
	Highcharts.chart({
		chart : {
			renderTo : "seachByWardZOneUsage",

			type : 'column'
		},
		title : {
			text : 'Yearly water Usage'
		},
		subtitle : {
			text : ''
		},
		xAxis : {
			categories : xdata,
			crosshair : true
		},
		yAxis : {
			min : 0,
			title : {
				text : 'Usage'
			}
		},
		plotOptions : {
			column : {
				pointPadding : 0.2,
				borderWidth : 0
			}
		},
		series : [ {
			name : 'year',
			data : ydata

		} ]
	});
</script>
</body>
</html>