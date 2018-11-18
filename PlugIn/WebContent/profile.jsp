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
    <title>Profile</title>

	 <!-- Latest compiled and CSS --
	<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/equalize-panels.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
	<script src="https://use.fontawesome.com/fafff4b056.js"></script>
  	<link rel="stylesheet" href="css/style.css" type="text/css"/>
</head>
<jsp:include page="parts/navbar.jsp"></jsp:include>
  <body>
  
   <div class="padTop container">
 	  <h1 class="text-center">${sessionScope.user.getFirstName()}'s profile</h1>
   		<div class="row">
   			<div class="col-sm-6">
				
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default">
							<div class="panel-heading text-center"><h2>Personal Information</h2></div>
							<div class="panel-body">
								<div class="row">
									<h4 class="col-xs-1 col-xs-push-3 text-center"><i class="fa fa-2x fa-id-card-o fa-lg padRight"></i></h4>
									<div class="col-xs-8 col-xs-push-4"><h4>${sessionScope.user.getFirstName()} ${sessionScope.user.getLastName()}</h4></div>
								</div>
								<div class="row">
									<div class="col-xs-1 col-xs-push-3 text-center"><p><i class="fa fa-lg fa-2x fa-envelope-o"></i> </p></div>
									<div class="col-xs-8 col-xs-push-4 "><p> ${sessionScope.user.getEmail()} </p></div>
								</div>
								<div class="row">
									<div class="col-xs-1 col-xs-push-3 text-center"><i class="fa fa-lg fa-2x fa-mobile"></i></div>
									<div class="col-xs-8 col-xs-push-4"><p> ${sessionScope.user.getPhone()} </p></div>
								</div>
								<div class="row">
									<div class="col-xs-1 col-xs-push-3 text-center"><i class="fa fa-lg fa-2x fa-thumbs-o-up"></i></div>
									<div class="col-xs-8 col-xs-push-4"><p> ${sessionScope.user.getFavoriteGenre()} </p></div>
								</div>
								<div class="row">
									<div class="col-xs-1 col-xs-push-3 text-center"><i class="fa fa-lg fa-2x fa-trophy"></i></div>
									<div class="col-xs-8 col-xs-push-4"><p>${sessionScope.user.getLevelName() } </p></div>
								</div>
								
								<a class="btn btn-info col-xs-8 col-xs-push-2" href="edit.jsp">Edit Profile</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="panel panel-default">
				<div class="panel-heading"><h2 class="text-center">Watch History</h2></div>
				<div class="panel-body">
					<table class="table table-responsive table-striped table-bordered">
						<tr>
							<th>Title</th>
							<th>Watch Date</th>
						</tr>
						<% for(Movie m : db.getHistory((Integer) request.getSession().getAttribute("id"))) {%>
						<tr>
							<td><a href="details.jsp?id=<%=m.getId()%>"><%= m.getTitle() %></a></td>
							<td><%= m.getReleaseDate() %></td>
						</tr>
						<% } %>
					</table>
				</div>
				</div>
			</div>
		</div>
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
