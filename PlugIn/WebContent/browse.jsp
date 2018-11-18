<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="plugIn.DbBean" %>
<%@ page import="plugIn.Movie" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
      <jsp:useBean id = "db" scope = "page" class = "plugIn.DbBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

	<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
	<link rel="stylesheet" href="css/bootstrap-multiselect.css" type="text/css"/>
	<script src="https://use.fontawesome.com/fafff4b056.js"></script>
  	<link rel="stylesheet" href="css/style.css" type="text/css"/>
  	<link rel="stylesheet" href="css/flexisel.css" type="text/css"/>
  	<script type="text/javascript" src="js/jquery.flexisel.js"></script>
  	<!-- 
  	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
  	Add the slick-theme.css if you want default styling ->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.css"/>
<!-- Add the slick-theme.css if you want default styling ->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css"/>
-->
<title>Browse</title>
</head>
<jsp:include page="parts/navbar.jsp"></jsp:include>
<body>
	<div class="container">
		<h1 class="text-center">Browse</h1>
	
		<%
			if(request.getSession().getAttribute("id") != null) {
				%>
				<h1>Recommendations</h1>
				<ul class="flexisel-slider">
				<%
				for(Movie m : db.getRecommendations(Integer.toString( (Integer) request.getSession().getAttribute("id")))) { %>
					<li><a href="details.jsp?id=<%= m.getId() %>"><img class="img-rounded " height="325px" src="<%= m.getThumbnail() %>"/></a></li>
				<% } %>
				</ul>
			<% } %>
		
		<%
			ArrayList<String> genres = db.getGenres();
			Collections.shuffle(genres);
			for(String genre : genres) { %>
			<h2> <%= genre %></h2>
				<%
				ArrayList<Movie> movies = db.getMoviesByGenre(genre); 
				%>
				<ul class="flexisel-slider">
				<%	for(Movie m : movies) { %>
					
						<li><a href="details.jsp?id=<%= m.getId() %>"><img class="img-rounded " height="325px" src="<%= m.getThumbnail() %>"/></a></li>
					
				<% } %>
				</ul>
		<% } %>
	</div>
	<script type="text/javascript">
	// https://stackoverflow.com/questions/3514784/what-is-the-best-way-to-detect-a-mobile-device-in-jquery
		
		$('.flexisel-slider').each(function(index, obj) {
			$(obj).flexisel({
		        visibleItems: 4,
		        itemsToScroll: 4,
		        animationSpeed: 200,
		        infinite: false,
		        navigationTargetSelector: null,
		        autoPlay: {
		            enable: false,
		            interval: 5000,
		            pauseOnHover: true
		        },
		        responsiveBreakpoints: { 
		            portrait: { 
		                changePoint:480,
		                visibleItems: 1,
		                itemsToScroll: 1
		            }, 
		            landscape: { 
		                changePoint:750,
		                visibleItems: 2,
		                itemsToScroll: 2
		            },
		            tablet: { 
		                changePoint:768,
		                visibleItems: 3,
		                itemsToScroll: 3
		            }
		        }
		    });
		});
	/*
		var mobile = window.matchMedia("only screen and (max-width: 760px)");
		if(mobile.matches) {
			$('.slick-slider').slick({
		   		  slidesToShow: 1,
		   		  slidesToScroll: 1,
		   		  dots: true,
		   		  centerMode: true,
		   		  focusOnSelect: true,
		   		  mobileFirst: true
		      });
		}
		else {
			$('.slick-slider').slick({
		   		  slidesToShow: 4,
		   		  slidesToScroll: 4,
		   		  dots: true,
		   		  centerMode: false,
		   		  focusOnSelect: true,
		   		  mobileFirst: false
		      });
		}
		*/
  </script>
</body>
</html>