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
<link rel="icon" href="<%request.getContextPath();%>/adminResources/image/favicon.ico">

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

	<jsp:include page="menu.jsp"></jsp:include>

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
					<div class="col-lg-4 col-12">
						<div class="box">
							<div class="box-header">
								<h4 class="box-title">All Complaints</h4>
								<ul class="box-controls pull-right">
									<li><a class="box-btn-close" href="#"></a></li>
									<li><a class="box-btn-slide" href="#"></a></li>
									<li><a class="box-btn" href="#"> <i class="ti-reload"></i></a></li>
								</ul>
							</div>
							<div class="box-body">
								<div class="d-flex justify-content-between align-items-center">
									<div class="text-dark">
										<h4 class="font-size-16">${totalComplainCountList}</h4>
										<p class="font-size-12 mb-0">All</p>
									</div>
									<div class="text-dark">
										<h4 class="font-size-16">${pendingComplainCountList}</h4>
										<p class="font-size-12 mb-0">pending</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%-- <div class="col-lg-4 col-12">
						<div class="box">
							<div class="box-header">
								<h4 class="box-title">Pending Complaints</h4>
								<ul class="box-controls pull-right">
									<li><a class="box-btn-close" href="#"></a></li>
									<li><a class="box-btn-slide" href="#"></a></li>
									<li><a class="box-btn" href="#"> <i class="ti-reload"></i></a></li>
								</ul>
							</div>
							<div class="box-body">
								<div class="d-flex justify-content-between align-items-center">
									<div class="text-dark">
										<h4 class="font-size-16">${pendingComplainCountList}</h4>
										<p class="font-size-12 mb-0">New Complaints</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					 --%><div class="col-lg-4 col-12">
						<div class="box">
							<div class="box-header">
								<h4 class="box-title">Feedback</h4>
								<ul class="box-controls pull-right">
									<li><a class="box-btn-close" href="#"></a></li>
									<li><a class="box-btn-slide" href="#"></a></li>
									<li><a class="box-btn" href="#"> <i class="ti-reload"></i></a></li>
								</ul>
							</div>
							<div class="box-body">
								<div class="d-flex justify-content-between align-items-center">
									<div class="text-dark">
										<h4 class="font-size-16">${feedbackCountList}</h4>
										<p class="font-size-12 mb-0">Feedbacks</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-12">
						<div class="box">
							<div class="box-header">
								<h4 class="box-title">Users</h4>
								<ul class="box-controls pull-right">
									<li><a class="box-btn-close" href="#"></a></li>
									<li><a class="box-btn-slide" href="#"></a></li>
									<li><a class="box-btn" href="#"> <i class="ti-reload"></i></a></li>
								</ul>
							</div>
							<div class="box-body">
								<div class="d-flex justify-content-between align-items-center">
									<div class="text-dark">
										<h4 class="font-size-16">${userCountList}</h4>
										<p class="font-size-12 mb-0">Users</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-lg-12 col-12">

						<!-- Wastage graph -->

						<div id="wastageGraph"
							style="min-width: 310px; height: 400px; margin: 0 auto"></div>
						<c:forEach var="i" items="${plotGraph }">

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
					
					<!-- Usage graph -->
					<div class="col-lg-12 col-12">

						<div id="usageGraph"
							style="min-width: 310px; height: 400px; margin: 0 auto"></div>
						<c:forEach var="i" items="${plotUsageGraph}">

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
					
					<!-- wastageOFWardGraph -->
					<div class="col-lg-12 col-12">

						<div id="wastageOFWardGraph"
							style="min-width: 310px; height: 400px; margin: 0 auto"></div>
						<c:forEach var="i" items="${wastageGraph }">

							<c:forEach var="k" items="${i}" varStatus="j">
								<c:if test="${j.count eq 1}">
									<input type="hidden" name="yvalue2" value="${k}" />
								</c:if>
								<c:if test="${j.count eq 2}">
									<input type="hidden" name="xvalue2" value="${k}" />
								</c:if>
							</c:forEach>
						</c:forEach>

					</div>
					
					<!-- usageOFWardGraph graph -->
					<div class="col-lg-12 col-12">

						<div id="usageOFWardGraph"
							style="min-width: 310px; height: 400px; margin: 0 auto"></div>
						<c:forEach var="i" items="${usageGraph}">

							<c:forEach var="k" items="${i}" varStatus="j">
								<c:if test="${j.count eq 1}">
									<input type="hidden" name="yvalue3" value="${k}" />
								</c:if>
								<c:if test="${j.count eq 2}">
									<input type="hidden" name="xvalue3" value="${k}" />
								</c:if>
							</c:forEach>
						</c:forEach>

					</div>
				</div>
		</section>
		<!--  /.content
  </div> 
  /.content-wrapper
   -->


		<jsp:include page="footer.jsp"></jsp:include>

				<!-- /.control-sidebar -->

		<!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
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
			renderTo : "wastageGraph",

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

<!-- usage graph -->
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
			renderTo : "usageGraph",

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

<!-- wastageOFWardGraph -->
<script>
	var xvalue = document.getElementsByName("xvalue2");
	var xdata = [];
	var yvalue = document.getElementsByName("yvalue2");
	var ydata = [];
	for (var i = 0; i < xvalue.length; i++) {
		xdata.push(xvalue[i].value);
		ydata.push(parseFloat(yvalue[i].value));
	}
	Highcharts.chart({
		chart : {
			renderTo : "wastageOFWardGraph",

			type : 'column'
		},
		title : {
			text : 'Ward wise water wastage'
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
			name : 'Ward Name',
			data : ydata

		} ]
	});
</script>

<!-- usageOFWardGraph -->
<script>
	var xvalue = document.getElementsByName("xvalue3");
	var xdata = [];
	var yvalue = document.getElementsByName("yvalue3");
	var ydata = [];
	for (var i = 0; i < xvalue.length; i++) {
		xdata.push(xvalue[i].value);
		ydata.push(parseFloat(yvalue[i].value));
	}
	Highcharts.chart({
		chart : {
			renderTo : "usageOFWardGraph",

			type : 'column'
		},
		title : {
			text : 'Ward wise water Usage'
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
			name : 'Name of Ward',
			data : ydata

		} ]
	});
</script>
</body>
</html>