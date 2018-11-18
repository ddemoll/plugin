<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="plugIn.Movie" %>
<%@page import="plugIn.QueueEntry" %>
<%@ page import="plugIn.DbBean" %>
  <jsp:useBean id = "db" scope = "page" class = "plugIn.DbBean">
  </jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Search Results</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	 <!-- Latest compiled and minified CSS -->
	<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
	<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
	<link rel="stylesheet" href="css/bootstrap-multiselect.css" type="text/css"/>
	<script src="https://use.fontawesome.com/fafff4b056.js"></script>
	<link rel="stylesheet" href="css/style.css" type="text/css"/>
	
	<link rel="stylesheet" href="css/animate.css" type="text/css"/>
	<script type="text/javascript" src="js/bootstrap-notify.min.js"></script>
	<jsp:include page="parts/toggleQueue.jsp"></jsp:include>
	<jsp:include page="parts/autocomplete.jsp"></jsp:include>
  </head>
	<jsp:include page="parts/navbar.jsp"/>
  <body>
    <div class="container">
	<h1 class="text-center">Search Results</h1>
		<div class="row">
		    <div class="col-sm-8 col-sm-push-2">
		    	<div class="panel panel-default">
		    	<div class="row">
		    		<button class="col-sm-10 col-sm-push-1 center-block btn btn-primary search" data-toggle="collapse" href="#searchOptions">Modify Search</button>
		    	</div>
		    	<div id="searchOptions" class="panel-collapse collapse">
		    		<div class="panel-body">
		    			<form class="form-horizontal" id="search" role="form" method="post" action="results.jsp" >
		    			<%! public String safeParam(HttpServletRequest r, String param) {
			    				String s = r.getParameter(param);
			    				if(s == null) {
			    					return "";
			    				}
			    				return s;
			    			}
		    				%>
		    			
							<div class="form-group">
								<label class="control-label col-sm-2" for="title">Title</label>
								<div class="col-sm-10">
									<input name="title" type="text" class="form-control" id="title" placeholder="Enter title" value="<%= safeParam(request, "title")  %>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="actor">Starring Actor</label>
								<div class="col-sm-10">
									<input name="actor" type="text" class="form-control" id="actor" placeholder="Starring Actor" value="<%= safeParam(request, "actor") %>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="director">Director</label>
								<div class="col-sm-10">
									<input name="director" type="text" class="form-control" id="director" placeholder="Director" value="<%= safeParam(request, "director") %>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="genre">Genre:</label>
								<div class="col-sm-2">
									<select name="genre" multiple class="form-control selects" id="genre">
										<% 
										for(String genre : db.getGenres()) { %>
												<option><%= genre %></option>
										<% } %>
									</select>
								</div>
								<label class="control-label col-sm-2" for="ratings">Ratings:</label>
								<div class="col-sm-2">
									<select name="rating" multiple class="form-control selects" id="ratings">
										<%
											for(String rating : db.getRatings()) { %>
												<option><%= rating %></option>
										<% } %>
												
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="startYear">Release Year By Range</label>
								<div class="col-sm-5">
									<input type="text" name="startYear" class="form-control" id="startYear" placeholder="Starting year" value="<%= safeParam(request, "startYear") %>">
								</div>
								<div class="col-sm-5">
									<input type="text" name="endYear" class="form-control" id="startYear" placeholder="Ending year" value="<%= safeParam(request, "endYear") %>">
								</div>
							</div>
							<button type="submit" class="btn btn-success hcenter col-sm-10 col-sm-push-1">Search</button>
						</form>
		    		</div>
		    	</div>
		    </div>
	    </div>
	    </div>

		<div class="row">
			<% ArrayList<Movie> movies = db.search(request); 
				if(movies == null) {
					response.sendRedirect("search.jsp");
					return;
				}
			%>
			<% if(request.getSession().getAttribute("id") == null) { %>
				<div class="alert alert-warning col-sm-10 col-sm-push-1">
						<p class="text-center"><i class="fa fa-lg fa-exclamation-circle" aria-hidden="true"></i> You must be logged in to view movies.</p>
					</div>
			<% } %>
			<% if(movies.size() != 0) { %>
				<div id="collapse-table">
				
					<table id="results" class="table table-striped table-responsive">
						<% for(Movie m : movies) { %>
							<tr>
								<td class="col-sm-2"><img style="max-width: 250px;" class="img-responsive img-rounded img-search" src="<%= m.getThumbnail() %>"></td>
								<td class="col-sm-5"><h2><%= m.getTitle() %></h2> <p><%= m.getDesc() %></p></td>
								
								<td class="col-sm-1"><h4 class="text-center"><%= m.getRating() %></h4></td>
								
								<% if(request.getSession().getAttribute("id") != null) { 
									boolean isInserted = ((Map<Integer, QueueEntry>)request.getSession().getAttribute("queueMap")).get(m.getId()) != null;
								%>
								<td class="col-sm-1">
									<button type="button" class="btn btn-primary active" onclick="toggleQueue(<%= request.getSession().getAttribute("id")%>, <%= m.getId() %>, '<%= m.getTitle() %>')" id="queue<%= m.getId() %>"><%= isInserted ? "<i class='fa fa-minus fa-lg'></i> Queue" : "<i class='fa fa-plus fa-lg'></i> Queue"%></button>
								</td>
								<td class="col-sm-1">
									<a href="details.jsp?id=<%= m.getId() %>" class="btn btn-info btn-sm">Watch Now</a>		
								</td>							
								<% }%>
								
								
								
							</tr>
						<% } %>
					</table>
				</div>
			<% } else { %>
					<div class="alert alert-danger col-sm-10 col-sm-push-1">
						<p class="text-center"><i class="fa fa-lg fa-exclamation-circle" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;No results found.</p>
					</div>
				<% } %>
		</div>
	</div>
  </body>
  <script type="text/javascript">
    $(document).ready(function() {
        $('.selects').multiselect();
    });
</script>
</html>