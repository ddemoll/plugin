<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="plugIn.DbBean" %>
  <jsp:useBean id = "db" scope = "page" class = "plugIn.DbBean">
  </jsp:useBean>
<!-- BEGIN AUTOCOMPLETE -->
	<!--  -<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="css/jquery-ui.min.css">
<script>
	  $( function() {
	  <% Map<String, SortedSet<String>> data = db.getAutocompleteData(); %>
	  var actors = [
			<% for(String actor : data.get("actor")) { %>
			 	"<%= actor.trim() %>",
			 <% } %>
			 ];
				
		var movieTitles = [
		<% for(String title : data.get("movieTitle")) { %>
		 	"<%= title %>",
		 <% } %>
		 ];
		
		var directors = [
			<% for(String d : data.get("director")) { %>
			 	"<%= d %>",
			 <% } %>
			 ];
		
	  
	    $("#title").autocomplete({
	    	minLength: 3,
	      source: movieTitles
	    });
	    $("#director").autocomplete({
	    	minLength: 3,
		      source: directors
		});
	    $("#actor").autocomplete({
	    	minLength: 3,
		      source: actors
		});
	  } );
  </script>
 <!-- END AUTOCOMPLETE -->	