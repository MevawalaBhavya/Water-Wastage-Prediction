<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../images/favicon.ico">

    <title>Registration </title>
  
	<!-- Bootstrap 4.0-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/bootstrap.min.css">
	
	<!-- Bootstrap extend-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/bootstrap-extend.css">


	<!-- Theme style -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/master_style.css">
	<script src="https://kit.fontawesome.com/2aea4237f2.js" crossorigin="anonymous"></script>

	<!-- AIUI Admin skins -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/_all-skins.css">	

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body class="hold-transition register-page bg-img" style="background-image:url(<%=request.getContextPath()%>/adminResources/image/bg-3.jpg);">
	
	<div class="container h-p100">
		<div class="row align-items-center justify-content-md-center h-p100">
			<div class="col-lg-4 col-md-8 col-12">
				<div class="register-box bg-white rounded">
				  <div class="register-box-body">
					<h3 class="text-center">Get started with Us</h3>
					<p class="login-box-msg">Register here Yourself</p>

					<f:form action="index.html" method="post" modelAttribute="data" class="form-element">
					  <div class="form-group has-feedback">
						<f:input type="text" class="form-control" name="Full_name" path="Full_name" placeholder="Full Name"></f:input>
						<span class="ion ion-person form-control-feedback"></span>
					  </div>
					  <div class="form-group has-feedback">
						<f:input type="email" class="form-control" name="email" path="username" placeholder="Email"></f:input>
						<span class="ion ion-email form-control-feedback"></span>
					  </div>
					  <div class="form-group has-feedback">
					<h5>Gender<span class="text-danger">*</span></h5>
						<fieldset class="controls">
							<f:input name="group1" type="radio" id="male"  path="gender" value="male" required="required"></f:input>
							<label for="male">Male</label>
						</fieldset>
						<fieldset>
							<f:input name="group1" type="radio" id="female" path="gender"  value="female"></f:input>
							<label for="female">Female</label>									
						</fieldset>
					  </div>
					  <div class="form-group has-feedback">
						<f:input type="text" class="form-control" name="designation" path="designation" placeholder="Designation"></f:input>
						<span class="ion ion-person form-control-feedback"></span>
					  </div>
					  <div class="form-group has-feedback">
						<f:input type="number" class="form-control" name="mobile_No" path="mobile_No" placeholder="Mobile number"></f:input>
						<span class="ion ion-person form-control-feedback"></span>
					  </div>
					  
					  <div class="form-group">
							<h5>Address <span class="text-danger">*</span></h5>
							<div class="controls">
								<f:textarea rows="4" name="address" id="address" path="address" class="form-control" required="required" placeholder="Address"></f:textarea>
							</div>
						</div>
					  <div class="form-group">
							<h5>Area <span class="text-danger">*</span></h5>
							<div class="controls">
								<f:select name="select_Area"  path="select_Area" id="select" required class="form-control">
									<option value="">Select Area</option>
									<option value="1">India</option>
									<option value="2">USA</option>
									<option value="3">UK</option>
									<option value="4">Canada</option>
									<option value="5">Dubai</option>
								</f:select>
							</div>
						</div>
					  <div class="form-group">
							<h5>Ward <span class="text-danger">*</span></h5>
							<div class="controls">
								<f:select name="select_Ward" path="select_Ward" id="select" required="required" class="form-control">
									<option value="">Select Ward</option>
									<option value="1">India</option>
									<option value="2">USA</option>
									<option value="3">UK</option>
									<option value="4">Canada</option>
									<option value="5">Dubai</option>
								</f:select>
							</div>
						</div>
					 <!--  <div class="form-group has-feedback">
						<input type="password" class="form-control" value="Password">
						<span class="ion ion-locked form-control-feedback"></span>
					  </div> -->
					   <div class="row">
						<div class="col-12">
						  <div class="checkbox">
							<f:input type="checkbox" path="basic_checkbox_1" name="basic_checkbox_1" id="basic_checkbox_1" ></f:input>
							<label for="basic_checkbox_1">I agree to the <a href="#"><b>Terms</b></a></label>
						  </div>
						</div>
						<!-- /.col -->
						<div class="col-12 text-center">
						  <button type="submit" class="btn btn-info btn-block margin-top-10">SIGN UP</button>
						</div>
						<!-- /.col -->
					  </div>
					</f:form>
<!-- 
					<div class="social-auth-links text-center">
					  <p>- OR -</p>
					  <a href="#" class="btn btn-social-icon btn-circle btn-facebook"><i class="fa fa-facebook"></i></a>
					  <a href="#" class="btn btn-social-icon btn-circle btn-twitter"><i class="fa fa-twitter"></i></a>
					  <a href="#" class="btn btn-social-icon btn-circle btn-instagram"><i class="fa fa-instagram"></i></a>
					</div>
 -->					<!-- /.social-auth-links -->

					 <div class="margin-top-20 text-center">
						<p>Already have an account?<a href="login.html" class="text-info m-l-5"> Sign In</a></p>
					 </div>

				  </div>
				  <!-- /.form-box -->
				</div>
			
			</div>
		</div>
	</div>


	<!-- jQuery 3 -->
	<script src="<%=request.getContextPath()%>/adminResources/js/jquery-3.3.1.min.js"></script>
	
	<!-- popper -->
	<script src="<%=request.getContextPath()%>/adminResources/js/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="<%=request.getContextPath()%>/adminResources/js/bootstrap.min.js"></script></body>
</html>
