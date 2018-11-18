<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="plugIn.DbBean" %>
<%@ page import="plugIn.SubscriptionLevel" %>
<jsp:useBean id = "db" scope = "page" class = "plugIn.DbBean">
  </jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Registration</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/jquery.matchHeight-min.js"></script>
<script src="https://use.fontawesome.com/fafff4b056.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>-->
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
<script type="text/javascript">


  
	$(document)
			.ready(
					function() {
						$('#reg_form')
								.bootstrapValidator(
										
										{
											// To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
											feedbackIcons : {
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {
												username : {
													validators : {
														stringLength : {
															min : 2,
														},
														notEmpty : {
															message : 'Please supply your username'
														},
														remote: {
									                        message: 'The username is not available',
									                        url: 'Validate',
									                        data: {
									                            type: 'username'
									                        }
									                    }
													}
												},
												email : {
													validators : {
														notEmpty : {
															message : 'Please supply your email address'
														},
														emailAddress : {
															message : 'Please supply a valid email address'
														},
														remote: {
									                        message: 'The email is not available',
									                        url: 'Validate',
									                        data: {
									                            type: 'email'
									                        }
									                    }
													}
												},
												
												password : {
													validators : {
														identical : {
															field : 'confirmPassword',
															message : 'Confirm your password below - type same password please'
														}
													}
												},
												confirmPassword : {
													validators : {
														identical : {
															field : 'password',
															message : 'The password and its confirm are not the same'
														}
													}
												},
												firstName : {
													validators : {
														stringLength : {
															min : 2,
														},
														notEmpty : {
															message : 'Please supply your first name'
														}
													}
												},
												lastName : {
													validators : {
														stringLength : {
															min : 2,
														},
														notEmpty : {
															message : 'Please supply your last name'
														}
													}
												},
												phone : {
													validators : {
														notEmpty : {
															message : 'Please supply your phone number'
														},
														regexp: {
															regexp: /^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/,
									                
									                        message: 'Please supply a valid phone number'
									                    },
													}
												},

												

												
												billingAddress1 : {
													validators : {
														stringLength : {
															min : 5,
														},
														notEmpty : {
															message : 'Please supply billing address'
														}
													}
												},
												billingAddress2 : {
													validators : {
														stringLength : {
															min : 5,
														},
														
													}
												},
												billingCity : {
													validators : {
														stringLength : {
															min : 5,
														},
														notEmpty : {
															message : 'Please supply city'
														}
													}
												},
												billingZip : {
													validators : {
														integer: {
								                            message: 'Please supply valid zipcode',
														},
														notEmpty : {
															message : 'Please supply zipcode'
														}
													}
												},
												shippingAddress1 : {
													validators : {
														stringLength : {
															min : 5,
														},
														notEmpty : {
															message : 'Please supply shipping address'
														}
													}
												},
												shippingAddress2 : {
													validators : {
														stringLength : {
															min : 5,
														},
														
													}
												},
												shippingCity : {
													validators : {
														stringLength : {
															min : 5,
														},
														notEmpty : {
															message : 'Please supply city'
														}
													}
												},
												shippingZip : {
													validators : {
														integer: {
								                            message: 'Please supply valid zipcode',
														},
														notEmpty : {
															message : 'Please supply zipcode'
														}
													}
												},
												ccFirstName : {
													validators : {
														stringLength : {
															min : 2,
														},
														notEmpty : {
															message : 'Please supply first name'
														}
													}
												},
												ccLastName : {
													validators : {
														stringLength : {
															min : 2,
														},
														notEmpty : {
															message : 'Please supply last name'
														}
													}
												},
												ccNumber : {
													validators : {
														integer: {
								                            message: 'Please supply valid credit card number',
														},
														notEmpty : {
															message : 'Please supply credit card number'
														}
													}
												},
												expDate: {
									                validators: {
									                    notEmpty: {
									                        message: 'Please supply expiration date'
									                    },
									                    date: {
									                        format: 'MM/YYYY',
									                        message: 'Please supply valid date'
									                    }
									                }
									            },
									            ccv : {
													validators : {
														integer: {
								                            message: 'Please supply valid CCV',
														},
														notEmpty : {
															message : 'Please supply CCV'
														}
													}
												},

											}
										});

					});
					
</script>
<script src="js/equalize-panels.js"></script>
</head>
<jsp:include page="parts/navbar.jsp"></jsp:include>
<body>
	<div class="container">
		<h1 class="text-center">Registration</h1>
		<form class="form-horizontal" id="reg_form" role="form" method="post" action="register.jsp">
			<div class="row panel-row">
				<div class="col-sm-6 panel-item">
				<div class="panel panel-default">
					<div class="panel-heading"><h2 class="text-center">Personal Information</h2></div>
					<div class="panel-body">
							<div class="form-group">
								<label class="control-label col-sm-2" for="email">Username</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="username"
										placeholder="Enter your username">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="email">Email</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="email"
										placeholder="Enter your email">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="password">Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="password"
										placeholder="Enter a password">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="confirmPassword">Confirm Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="confirmPassword"
										placeholder="Confirm your password">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="firstName">First
									Name:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="firstName"
										placeholder="Enter your first name">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="lastName">Last
									Name:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="lastName"
										placeholder="Enter your last name">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="phone">Phone</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="phone"
										placeholder="Enter your phone number">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="favoriteGenre">Favorite Genre</label>
								<div class="col-sm-10">
								<select class="form-control" name="favoriteGenre">
									<% for(String s : db.getGenres()) {%>
									<option><%= s %></option>
									<% } %>
								</select>
								</div>
							</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="levelName">Subscription</label>
							<div class="col-sm-10">
							<select class="form-control" name="levelName">
								<% for(SubscriptionLevel level : db.getLevels()) { %>
											<% if(level.getLevelNoDvdPerMonth() < 0) { %> %>
											<option value="<%= level.getLevelName() %>"> <%= level.getLevelName() %> - Unlimited Movies - <%= level.getLevelChargePerMonth() %>/month</option>
											<% } else { %>
											<option value="<%= level.getLevelName() %>"> <%= level.getLevelName() %> - <%= level.getLevelNoDvdPerMonth() %>movie/month  - <%= level.getLevelChargePerMonth() %>/month</option>
											<% }
									} %>
								
							</select>
							</div>
						</div>
					</div>
					</div>
				</div>
				<div class="col-sm-6 panel-item">
				<div class="panel panel-default">
					<div class="panel-heading"><h2 class="text-center">Billing information</h2></div>
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label col-sm-2" for="billingAddress1">Address Line 1</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="billingAddress1"
									placeholder="Enter billing address">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="billingAddress2">Address Line 2</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="billingAddress2"
									placeholder="optional">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="billingCity">City</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="billingCity"
									placeholder="Enter billing city">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="billingState">State</label>
							<div class="col-sm-10">
							<select class="form-control" name="billingState">
									<option value="AL">Alabama</option>
								<option value="AK">Alaska</option>
								<option value="AZ">Arizona</option>
								<option value="AR">Arkansas</option>
								<option value="CA">California</option>
								<option value="CO">Colorado</option>
								<option value="CT">Connecticut</option>
								<option value="DE">Delaware</option>
								<option value="DC">District Of Columbia</option>
								<option value="FL">Florida</option>
								<option value="GA">Georgia</option>
								<option value="HI">Hawaii</option>
								<option value="ID">Idaho</option>
								<option value="IL" selected>Illinois</option>
								<option value="IN">Indiana</option>
								<option value="IA">Iowa</option>
								<option value="KS">Kansas</option>
								<option value="KY">Kentucky</option>
								<option value="LA">Louisiana</option>
								<option value="ME">Maine</option>
								<option value="MD">Maryland</option>
								<option value="MA">Massachusetts</option>
								<option value="MI">Michigan</option>
								<option value="MN">Minnesota</option>
								<option value="MS">Mississippi</option>
								<option value="MO">Missouri</option>
								<option value="MT">Montana</option>
								<option value="NE">Nebraska</option>
								<option value="NV">Nevada</option>
								<option value="NH">New Hampshire</option>
								<option value="NJ">New Jersey</option>
								<option value="NM">New Mexico</option>
								<option value="NY">New York</option>
								<option value="NC">North Carolina</option>
								<option value="ND">North Dakota</option>
								<option value="OH">Ohio</option>
								<option value="OK">Oklahoma</option>
								<option value="OR">Oregon</option>
								<option value="PA">Pennsylvania</option>
								<option value="RI">Rhode Island</option>
								<option value="SC">South Carolina</option>
								<option value="SD">South Dakota</option>
								<option value="TN">Tennessee</option>
								<option value="TX">Texas</option>
								<option value="UT">Utah</option>
								<option value="VT">Vermont</option>
								<option value="VA">Virginia</option>
								<option value="WA">Washington</option>
								<option value="WV">West Virginia</option>
								<option value="WI">Wisconsin</option>
								<option value="WY">Wyoming</option>
							</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="billingZip">Zipcode</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="billingZip"
									placeholder="Enter billing zipcode">
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
			<div class="row panel-row">
				<div class="col-sm-6 panel-item">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="text-center">Shipping Information</h2>
						</div>
						<div class="panel-body">
							<label class="col-xs-push-1"><input type="checkbox" id="sameAsBilling" /> Use billing information</label>
							<div class="form-group">
								<label class="control-label col-sm-2" for="shippingAddress1">Address Line 1</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="shippingAddress1"
										placeholder="Enter your shipping address">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="shippingAddress2">Address Line 2</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="shippingAddress2"
										placeholder="optional">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="shippingCity">City</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="shippingCity"
										placeholder="Enter shipping city">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="shippingState">State</label>
								<div class="col-sm-10">
								<select class="form-control" name="shippingState">
										<option value="AL">Alabama</option>
					<option value="AK">Alaska</option>
					<option value="AZ">Arizona</option>
					<option value="AR">Arkansas</option>
					<option value="CA">California</option>
					<option value="CO">Colorado</option>
					<option value="CT">Connecticut</option>
					<option value="DE">Delaware</option>
					<option value="DC">District Of Columbia</option>
					<option value="FL">Florida</option>
					<option value="GA">Georgia</option>
					<option value="HI">Hawaii</option>
					<option value="ID">Idaho</option>
					<option value="IL" selected>Illinois</option>
					<option value="IN">Indiana</option>
					<option value="IA">Iowa</option>
					<option value="KS">Kansas</option>
					<option value="KY">Kentucky</option>
					<option value="LA">Louisiana</option>
					<option value="ME">Maine</option>
					<option value="MD">Maryland</option>
					<option value="MA">Massachusetts</option>
					<option value="MI">Michigan</option>
					<option value="MN">Minnesota</option>
					<option value="MS">Mississippi</option>
					<option value="MO">Missouri</option>
					<option value="MT">Montana</option>
					<option value="NE">Nebraska</option>
					<option value="NV">Nevada</option>
					<option value="NH">New Hampshire</option>
					<option value="NJ">New Jersey</option>
					<option value="NM">New Mexico</option>
					<option value="NY">New York</option>
					<option value="NC">North Carolina</option>
					<option value="ND">North Dakota</option>
					<option value="OH">Ohio</option>
					<option value="OK">Oklahoma</option>
					<option value="OR">Oregon</option>
					<option value="PA">Pennsylvania</option>
					<option value="RI">Rhode Island</option>
					<option value="SC">South Carolina</option>
					<option value="SD">South Dakota</option>
					<option value="TN">Tennessee</option>
					<option value="TX">Texas</option>
					<option value="UT">Utah</option>
					<option value="VT">Vermont</option>
					<option value="VA">Virginia</option>
					<option value="WA">Washington</option>
					<option value="WV">West Virginia</option>
					<option value="WI">Wisconsin</option>
					<option value="WY">Wyoming</option>
								</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="shippingZip">Zipcode</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="shippingZip"
										placeholder="Enter shipping zipcode">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 panel-item">
					<div class="panel panel-default">
						<div class="panel-heading"><h2>Credit Card Information</h2></div>
						<div class="panel-body">
						<div class="form-group">
							<label class="control-label col-sm-2" for="ccFirstName">First Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="ccFirstName"
									placeholder="Card holder first name">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="ccLastName">Last Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="ccLastName"
									placeholder="Card holder last name">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="ccType">Card Type</label>
							<div class="col-sm-10">
								<select class="form-control" name="ccType">
								<option>Discover</option>
								<option>AmericanExpress</option>
								<option>MasterCard</option>
								<option>Visa</option>
							</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="ccNumber">Card Number</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="ccNumber"
									placeholder="Credit card number">
							</div>
						</div>
						
						<div class="form-group">
									<label class="control-label col-sm-3" for="expDate">Expiration Month</label>
									<div class="col-sm-3">
										<select id="ccMonth" class="form-control" name="ccMonth">
										<% for(int i = 1; i < 13; i++) {%>
											<option><%= i %></option>
											<% } %>
										</select>
									</div>
									<div class="col-sm-3">
										<p>Expiration Year</p>
									</div>
									<div class="col-sm-3">
									<select id="ccYear" class="form-control" name="ccYear">
									<% for(int i = 2017; i < 2030; i++) {%>
										<option><%= i %></option>
										<% } %>
									</select>
									</div>
								</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="ccv">CCV</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="ccv"
									placeholder="Enter CCV">
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<button type="submit" class="btn btn-info col-sm-12">Submit</button>
		</form>
	</div>
	<script type="text/javascript">
	$("#sameAsBilling").on("change", function(){
	    if (this.checked) {
	      $("[name='shippingAddress1']").val($("[name='billingAddress1']").val());
	      $("[name='shippingAddress2']").val($("[name='billingAddress2']").val());
	      $("[name='shippingCity']").val($("[name='billingCity']").val());
	      $("[name='shippingState']").val($("[name='billingState']").val());
	      $("[name='shippingZip']").val($("[name='billingZip']").val());
	  
	    }
	  });
	//equalizePanels();
	</script>
</body>
</html>
