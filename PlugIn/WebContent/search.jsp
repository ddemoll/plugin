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
    <title>Search for Movies</title>

	 <!-- Latest compiled and minified CSS --
	<!-<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

	<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
	<link rel="stylesheet" href="css/bootstrap-multiselect.css" type="text/css"/>
	<script src="https://use.fontawesome.com/fafff4b056.js"></script>
  	<link rel="stylesheet" href="css/style.css" type="text/css"/>
  	<jsp:include page="parts/autocomplete.jsp"></jsp:include>
  </head>
<jsp:include page="parts/navbar.jsp"></jsp:include>
  <body>
    <div class="padTop container">
		<script>
			function createError(reason, element) {
				var container = $("#error");
				container.empty();
				container.css("visibility", "visible");
				var error = $("<div></div>");
				error.addClass("alert");
				error.addClass("alert-warning");
				var desc = $("<p></p>");
				desc.html(" " + reason);
				var icon = $("<i></i>");
	 			icon.addClass("fa");
	 			icon.addClass("fa-lg");
	 			icon.addClass("fa-exclamation-circle");
	 			icon.attr("aria-hidden", "true");
	 			desc.prepend(icon);
	 			error.append(desc);
	 			container.append(error);
	 			
	 			// https://stackoverflow.com/questions/17780756/put-cursor-at-end-of-text-inputs-value
	 			element.focus();
	 			var len = $(element).val().length;
	 			if(len > 0) {
	 				element.setSelectionRange(len, len);
	 			}
	 			
			}
			
			function validateSearch() {
				console.log("now searching");
				var empty = true;
				var tooShort = null;
				$("#search").find("input:text").each(function() {
					if(this.value != '' && this.value != null) {
						empty = false;
						if(this.value.length < 3 && tooShort == null) {
							createError("A minimum of 3 characters is required", this)
							tooShort = this;
							console.log(tooShort);
						}
					}
				});
				
				console.log(tooShort);
				console.log("F" + $("#startYear").value + "F");
				if(!tooShort && $("#startYear").value != null && !$.isNumeric($("#startYear").value)) {
					console.log($("#startYear").value);
					createError("Start year must be a number", startYear);
					return false;
				}
				if(!tooShort && $("#endYear").value != null && !$.isNumeric($("#startYear").value)) {
					console.log($("#endYear").value);
					createError("End year must be a number", endYear);
					return false;
				}
				if(empty) {
					createError("Please enter at least one field", $("title"));
				}
				if(tooShort != null) {
					$(tooShort).focus();
				}
				return !empty && tooShort == null;
			}
		</script>
		
		<form class="form-horizontal" id="search" role="form" method="post" action="results.jsp" onsubmit="return validateSearch();">
		<div class="col-sm-8 col-sm-push-2">
			<div class="panel panel-default">
				<div class="panel-heading"><h1 class="text-center">Search</h1></div>
				<div class="panel-body">
					<div id="row">
						<div id="error" class="col-sm-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">Title</label>
						<div class="col-sm-10">
							<input name="title" type="text" class="form-control" id="title" placeholder="Enter title">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="actor">Starring Actor</label>
						<div class="col-sm-10">
							<input name="actor" type="text" class="form-control" id="actor" placeholder="Starring Actor">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="director">Director</label>
						<div class="col-sm-10">
							<input name="director" type="text" class="form-control" id="director" placeholder="Director">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="genre">Genre:</label>
						<div class="col-sm-2">
							<select name="genre" multiple class="form-control selects" id="genre">
								<% for(String genre : db.getGenres()) { %>
										<option><%= genre %></option>
								<% } %>
							</select>
						</div>
						<label class="control-label col-sm-2" for="ratings">Ratings:</label>
						<div class="col-sm-2">
							<select name="rating" multiple class="form-control selects" id="ratings">
								<% for(String rating : db.getRatings()) { %>
										<option><%= rating %></option>
								<% } %>
										
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="startYear">Release Year By Range</label>
						<div class="col-sm-5">
							<input type="text" name="startYear" class="form-control" id="startYear" placeholder="Starting year">
						</div>
						<div class="col-sm-5">
							<input type="text" name="endYear" class="form-control yearOffset" id="endYear" placeholder="Ending year">
						</div>
					</div>
				<button type="submit" class="btn btn-success col-sm-12">Search</button>
				</div>
			</div>
			</div>
		</form>
    </div>
    <script type="text/javascript">
    $(document).ready(function() {
        $('.selects').multiselect();
    });
</script>
  </body>
</html>