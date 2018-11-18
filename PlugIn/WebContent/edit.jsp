<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
 <%@ page import="plugIn.Movie" %> 
 <%@ page import= "plugIn.DbBean" %>
 <%@ page import="plugIn.SubscriptionLevel" %>
<%@ page import="plugIn.Member" %>
 
 <jsp:useBean id = "db" scope = "page" class = "plugIn.DbBean">
 </jsp:useBean>
 
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
      <% Member member = ((Member)request.getSession().getAttribute("user"));%>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <title>Edit Profile</title>

	 <!-- Latest compiled and CSS --
	<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/equalize-panels.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
	<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
	
	<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
	<link rel="stylesheet" href="css/bootstrap-multiselect.css" type="text/css"/>
	<script src="https://use.fontawesome.com/fafff4b056.js"></script>
  	<link rel="stylesheet" href="css/style.css" type="text/css"/>
  	
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
														notEmpty : {
															message: 'Please supply a password'
														},
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
														regexp: { // 
															regexp: /(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}/, ///^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/,
									                
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
															min : 0,
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
															min : 0,
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
  	
  </head>
<jsp:include page="parts/navbar.jsp"></jsp:include>
  <body>
  
   <div class="container">
	<h1 class="text-center">Profile Information</h1>
	<%! public String safe(String s) { 
			if(s == null) {
				return "";
			}
			return s;
		} %>
		<form class="form-horizontal" id="reg_form" role="form"  method="post" action="editProfileMember.jsp" >
			<div class="row">
			<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading"><h1>Personal Information</h1></div>
				<div class="panel-body">
						<div class="form-group">
							<label class="control-label col-sm-4" for="First Name">First Name</label>
							<div class="col-sm-8">
								<input name="firstName" type="text" class="form-control" id="firstName" value="<%= member.getFirstName() %>">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-4" for="Last Name">Last Name</label>
							<div class="col-sm-8">
								<input name="lastName" type="text" class="form-control" id="lastName" value="<%= member.getLastName() %>">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="password">Password</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" name="password"	placeholder="Enter a password">
							</div>
						</div>
							
							 <div class="form-group">
							<label class="control-label col-sm-4" for="confirmPassword">Confirm Password</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" name="confirmPassword"placeholder="Confirm your password">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-4" for="phone">Phone Number</label>
							<div class="col-sm-8">
								<input name="phone" type="text" class="form-control" id="phoneNumber" value="<%= member.getPhone() %>">
							</div>
						</div>
										
							<div class="form-group">
							<label class="control-label col-sm-4" for="levelName">Subscription</label>
							<div class="col-sm-8">
							<select id="subLevel" class="form-control" name="levelName">
								<% for(SubscriptionLevel level : db.getLevels()) { %>
											<% if(level.getLevelNoDvdPerMonth() < 0) { %>
											<option value="<%= level.getLevelName() %>"> <%= level.getLevelName() %> - Unlimited Movies - <%= level.getLevelChargePerMonth() %>/month</option>
											<% } else { %>
											<option value="<%= level.getLevelName() %>"> <%= level.getLevelName() %> - <%= level.getLevelNoDvdPerMonth() %>movie/month  - <%= level.getLevelChargePerMonth() %>/month</option>
											<% }
									} %>
								
							</select>
							<script>
								$(document).ready( function() {
									$("#subLevel").val("<%= member.getLevelName() %>");
								});
							</script>
							</div>
							</div>
								<div class="form-group">
							<label class="control-label col-sm-4" for="favoriteGenre">Favorite Genre</label>
							<div class="col-sm-8">
							<select id="fav" class="form-control" name="favoriteGenre">
								<% for(String s : db.getGenres()) { %>
										<option><%= s %></option>
								<% } %>
							</select>
							<script>
							$(document).ready( function() {
									$("#fav").val("<%= member.getFavoriteGenre() %>");
								});
							</script>
							</div>
						</div>
					</div>
					</div>
				</div>
			
				<div class="col-sm-6">
					<div class="panel panel-default">
							<div class="panel-heading"><h2 class="text-center">Payment Information</h2></div>
							<div class="panel-body">
								<div class="form-group">
								<label class="control-label col-sm-4" for="creditCardNumber">Credit Card Number</label>
								<div class="col-sm-8">
									<input name="ccNumber" type ="text" class="form-control" id="creditCardNumber" value="<%= member.getCcNumber() %>">
								</div>
								</div>
								
								<div class="form-group">
								<label class="control-label col-sm-4" for="creditCardCCV">Credit Card CCV</label>
								<div class="col-sm-8">
									<input name="ccv" type ="number" class="form-control" id="creditCardCCV" value="<%= member.getCcv() %>">
								</div>
								</div>
								
								<div class="form-group">
								<label class="control-label col-sm-4" for="cardHolderFirstName">Card Holder First Name</label>
								<div class="col-sm-8">
									<input name="ccFirstName" type ="text" class="form-control" id="cardHolderFirstName" value="<%= member.getCcFirstName() %>">
								</div>
								</div>
								
								<div class="form-group">
								<label class="control-label col-sm-4" for="cardHolderLastName">Card Holder Last Name</label>
								<div class="col-sm-8">
									<input name="ccLastName" type ="text" class="form-control" id="cardHolderLastName" value="<%= member.getCcLastName() %>">
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
									 <script>
									 	$(document).ready(function () {
									 		$("#ccMonth").val("<%=member.getExpMonth()%>");
									 		$("#ccYear").val("<%=member.getExpYear()%>");
									 	});
									 </script>
								</div>
												
								<div class="form-group">
								<label class="control-label col-sm-4" for="ccType">Card Type</label>
								<div class="col-sm-8">
									<select id="cc" class="form-control" name="ccType">
									<option>Discover</option>
									<option>AmericanExpress</option>
									<option>MasterCard</option>
									<option>Visa</option>
								</select>
								<script>
									$(document).ready(function(){
										$("#cc").val("<%= member.getCcType() %>")
									});
								</script>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
				
				<div class="row">
				<div class="col-sm-6">
				<div class="panel panel-default">
				<div class="panel-heading"><h2 class="text-center"> Billing Information</h2>	</div>			
				<div class="panel-body">
				<div class="form-group">
				<label class="control-label col-sm-4" for="Address Line 1">Address Line 1</label>
				<div class="col-sm-8">
					<input name="billingAddress1" type="text" class="form-control" id="billAddressLine1" value="<%= member.getBillingAddress1() %>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="Address Line 2">Address Line 2</label>
				<div class="col-sm-8">
					<input name="billingAddress2" type="text" class="form-control" id="billAddressLine2" value="<%= safe(member.getBillingAddress2()) %>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="city">City</label>
				<div class="col-sm-8">
					<input name="billingCity" type="text" class="form-control" id="billCity" value="<%= member.getBillingCity() %>">
				</div>
			</div>
			
		<div class="form-group">
				<label class="control-label col-sm-4" for="billingState">State</label>
				<div class="col-sm-8">
				<select id="billState" class="form-control" name="billingState">
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
						<option value="IL">Illinois</option>
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
				<script>
				$(document).ready( function() {
					$('#billState').val('<%= member.getBillingState()%>');
				});
				</script>
				</div>
			</div>
				<div class="form-group">
				<label class="control-label col-sm-4" for="bill zip">Zip Code</label>
				<div class="col-sm-8">
					<input name="billingZip" type="text" class="form-control" id="billzip" value="<%= member.getBillingZip() %>">
				</div>
			</div>
			</div>
			</div>
			</div>
			<div class="col-sm-6">
			<div class="panel panel-default">
			<div class="panel-heading"><h2 class="text-center">Shipping Information</h2></div>
			<div class="panel-body">
			<div class="form-group">
				<label class="control-label col-sm-4" for="Address Line 1">Address Line 1 </label>
				<div class="col-sm-8">
					<input name="shippingAddress1" type="text" class="form-control" id="shipAddressLine1" value="<%= member.getShippingAddress1() %>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="Address Line 2">Address Line 2</label>
				<div class="col-sm-8">
					<input name="shippingAddress2" type="text" class="form-control" id="shipAddressLine2" value="<%= safe(member.getShippingAddress2()) %>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="ship city">City</label>
				<div class="col-sm-8">
					<input name="shippingCity" type="text" class="form-control" id="shipCity" value="<%= member.getShippingCity() %>">
				</div>
			</div>			
			<div class="form-group">
				<label class="control-label col-sm-4" for="shippingState">State</label>
				<div class="col-sm-8">
				<select id="shipState" class="form-control" name="shippingState">
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
						<option value="IL">Illinois</option>
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
				<script>
					$(document).ready( function() {
						$("#shipState").val("<%= member.getShippingState() %>");
					});
				</script>
			</div>
				<div class="form-group">
				<label class="control-label col-sm-4" for="bill zip">Zip Code</label>
				<div class="col-sm-8">
					<input name="shippingZip" type="text" class="form-control" id="shipZip" value="<%= member.getBillingZip() %>">
				</div>
			</div>
			
					</div>
					</div>
					</div>
					</div>
			<button type="submit" class="btn btn-lg btn-info col-sm-8 col-sm-push-2" >Submit Changes</button>
		</form>
   </div>
     <script type="text/javascript">
    $(document).ready(function() {
        $('.selects').multiselect();
    });
</script> 
<script> // equalizePanels();</script>
<script>
function refreshPage(){
	window.location.reload();
}
</script>
  </body>
</html>
