<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="plugIn.Movie" %>
<%@ page import="plugIn.DbBean" %>
  <jsp:useBean id = "db" scope = "page" class = "plugIn.DbBean">
  </jsp:useBean>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	
    <title>Plug-In</title>

	 <!-- Latest compiled and minified CSS --
	<!-<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
	<script src="js/equalize-panels.js"></script>
	<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
	<link rel="stylesheet" href="css/bootstrap-multiselect.css" type="text/css"/>
	<script src="https://use.fontawesome.com/fafff4b056.js"></script>
  	<link rel="stylesheet" href="css/style.css" type="text/css"/>
  </head>
<jsp:include page="parts/navbar.jsp"></jsp:include>
  <body>
    <div class="padTop container">
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<h1 class="text-center">Plug-In</h1>
		</div>
		<div class="panel-body">
		    <div class="row">
		    	<img class="img-responsive img-rounded center-block" src="theater_logo.png">
		   </div>
	   </div>
	</div>
   <% if(request.getSession().getAttribute("id") == null) { %>
   <div class="row padTop">
   		<div class="col-md-12">
   			<div class="alert alert-info text-center">
   				<p>Not a member? Click <a href="registration.jsp">here</a> to register.</p>
   			</div>
   		</div>
   </div>
  
	<% } %>
   		<div class="row">
   		<div class="col-md-4">
   			<div class="panel panel-default">
   				<div class="panel-heading text-center">
	   				<h1 class="text-center">Anytime, Anywhere.</h1>
	   			</div>
	   			<div class="panel-body">
	   			<div class="row">
		   			<div class="col-xs-4 text-center"><i class="fa fa-4x fa-laptop"></i></div>
		   			<div class="col-xs-4 text-center"><i class="fa fa-4x fa-mobile"></i></div>
		   			<div class="col-xs-4 text-center"><i class="fa fa-4x fa-television"></i></div>
	   			</div>
	   			<p class="padTop">View your favorite movies from all your favorite devices. Whether you're on the train using your phone, on a laptop on a plane, or sitting on the couch at home.</p></div>
	   		</div>
   		</div>
   		<div class="col-md-4">
   			<div class="panel panel-default">
   				<div class="panel-heading">
	   			<h1 class="text-center">All Your Favorites, Curated for you</h1>
	   			</div>
	   			<div class="panel-body">
	   			<div class="row">
	   				<div class="col-xs-6 text-center"><i class="fa fa-4x fa-thumbs-o-up"></i></div>
	   				<div class="col-xs-6 text-center"><i class="fa fa-4x fa-heart-o"></i></div>
	   			</div>
	   			<p class="padTop">Find your favorite movies quickly based on our recommendations. An advanced algorithm takes your favorite movies and what you've watched to develop a personal list of movies you'll surely enjoy.</p></div>
	   		</div>
	   	</div>
   		<div class="col-md-4">
	   		<div class="panel panel-default">
	   			<div class="panel-heading"><h1 class="text-center">Pay For What You Need</h1></div>
	   			<div class="padTop row">
	   				<div class="col-xs-3 text-center"><i class="fa fa-4x fa-trophy bronze"></i></div>
		   			<div class="col-xs-3 text-center"><i class="fa fa-4x fa-trophy silver"></i></div>
		   			<div class="col-xs-3 text-center"><i class="fa fa-4x fa-trophy gold"></i></div>
		   			<div class="col-xs-3 text-center"><i class="fa fa-4x fa-trophy plat"></i></div>
	   			</div>
	   			<div class="panel-body"><p>We offer different levels that make it easy for you to find the perfect plan. Don't watch much? Our Bronze level subscription lets you watch up to 5 movies per month at only $2.00 per month. Or you can get access to 10, 15, or an unlimited number of movies per month with our Silver, Gold and Platinum level subscriptions.</p></div>
	   		</div>
   		</div>
   	</div>
   	</div>
   	<script>//equalizePanels();</script>
  </body>
</html>