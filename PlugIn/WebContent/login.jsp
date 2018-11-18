<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Login</title>

	 <link rel="stylesheet" href="css/bootstrap.min.css">
	 <link rel="stylesheet" href="css/style.css">
	 <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
		<script src="https://use.fontawesome.com/fafff4b056.js"></script>
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
	<script src="js/equalize-panels.js"></script>
	<script type="text/javascript">

		$(document).ready(function() {
			$('#reg_form').bootstrapValidator({
				// To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {

					email : {
						validators : {
							notEmpty : {
								message : 'Please supply your email or username'
							},
							
						}
					},

					password : {
						validators : {
							notEmpty : {
								message : 'Please supply your password'
							},

						}
					},

				}
			});
		});
	</script>

  </head>
<jsp:include page="parts/navbar.jsp"></jsp:include>
  <body>

    <div class="padTop container" style="margin-top: 1.5em;">
		<% Object error = request.getAttribute("errorMsg");
		if(error != null){ 
			String errorMsg = (String)error;
		%>
		
		<div class="alert alert-danger">
		  <strong>Error!</strong> ${errorMsg}
		</div>
		<% } %>
		<div class="row eq-row">
			<div class="col-sm-push-6 col-sm-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h1 class="text-center">Login</h1>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" id="reg_form" role="form" method = "post" action = "Login">
							<div class="form-group">
								<label class="control-label col-sm-2" for="email">Email or Username</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="email" placeholder="Enter your email or username">
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-sm-2" for="password">Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="password" placeholder="Enter your password">
								</div>
							</div>
							
							<button type="submit" class="btn btn-default">Submit</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-pull-6 col-sm-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h1 class="text-center">Not a Member?</h1>
					</div>
					<div class="panel-body">
						<div class="text-center">
						<a href="registration.jsp">
							<i class="fa fa-user-plus fa-4x"></i></a>
							<p>Click on the button to register today!</p>
						</div>
						
					</div>
				</div>
			</div>
		</div>
    </div>
  </body>
  <script>equalizePanels();</script>
</html>
