<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="plugIn.Movie" %>
<%@page import="plugIn.Member" %>
<%@page import="plugIn.DbBean" %>
<%@page import="plugIn.QueueEntry" %>
<jsp:useBean id = "db" scope = "page" class = "plugIn.DbBean">
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <% 
    Member user = ((Member)request.getSession().getAttribute("user"));
    int movieID = Integer.parseInt(request.getParameter("id"));
    Movie movie = db.getMovie(movieID);
    boolean didLikeMovie = db.didLikeMovie(movieID, user.getMemberID());
    %>
    
    <title><%= movie.getTitle() %></title>
    <!--  request.getParameter(); -->
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
	<script>
	function markWatched(movieID) {
		var saveData = $.ajax({
		      type: 'POST',
		      url: "History",
		      data: {"movieID" : movieID},
		      dataType: "text",
		      beforeSend: function() { 
		          
		          
		        },
		      success: function(resultData) {
		    	  
		    	  var objData = jQuery.parseJSON(resultData);
		    	  if(objData.remainingMovies > 0) {
			    	  $.notify(objData.remainingMovies+" movie"+(objData.remainingMovies == 1 ? "" : "s")+" remaining", {
		    			    offset: 20,
		    				animate: {
		    					enter: 'animated fadeInRight',
		    					exit: 'animated fadeOutRight'
		    				}
		    		  		
		    			});
		    	  }
	
			}
		});
	}
	function toggleLike(movieID, memberID) {
		console.log($("#likeBtn").text());
		var isLiked = ($("#likeBtn").text() == " Unlike");
		var saveData = $.ajax({
		      type: 'POST',
		      url: "Like",
		      data: {"action": $("#likeBtn").text(), "movieID" : movieID, "memberID": memberID},
		      dataType: "text",
		      beforeSend: function() {


		        },
		      success: function(resultData) {
		    	  if(isLiked) {
		    		  $("#likeCount").text(parseInt($("#likeCount").text()) - 1);
		    		  $("#likeBtn").html("<i class='fa fa-lg fa-2x fa-heart'></i> Like");
		    		  
			    	  $.notify("You unliked <%= movie.getTitle() %>", {
		    			    offset: 20,
		    			    spacing: 10,
		    				animate: {
		    					enter: 'animated fadeInRight',
		    					exit: 'animated fadeOutRight'
		    				}

		    			});

		    	  } else {
		    		  $("#likeCount").text(parseInt($("#likeCount").text()) + 1);
		    		  $("#likeBtn").html("<i class='fa fa-lg fa-2x fa-heart-o'></i> Unlike");
			    	  $.notify("You liked <%= movie.getTitle() %>", {
		    			    offset: 20,
		    			    spacing: 10, 
		    				animate: {
		    					enter: 'animated fadeInRight',
		    					exit: 'animated fadeOutRight'
		    				}

		    			});
		    	  }


			}
		});
	}

	</script>
   <style>
   .vid {
    position: relative;
    padding-bottom: 56.25%;
    padding-top: 30px; height: 0; overflow: hidden;
}
 
.vid iframe,
.vid object,
.vid embed {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}</style>
</head>
<body>
	<jsp:include page="parts/navbar.jsp"/>
    <div class="padTop container">
    	<div class="panel panel-default">
    	<div class="panel panel-heading">
			<h1 class="text-center"><%= movie.getTitle()%> - <%= movie.getYearReleased() %></h1>
		</div>
		<div class="panel-body">
<div class="row">
<div class="col-sm-8">
<% 


if(db.canWatchMovie(user, movieID)) { %>
<div class="embed-responsive embed-responsive-16by9">
	<div class="embed-responsive-item" id="player"></div>
</div>


<script src="http://www.youtube.com/player_api"></script>
<script> 
var firstPlay = true;
    // create youtube player
    var player;
    function onYouTubePlayerAPIReady() {
        player = new YT.Player('player', {

          videoId: '<%= movie.getTrailer() %>',
          events: {
            'onStateChange': onPlayerStateChange
          }
        });
    }

    function onPlayerStateChange(event) { 
		if(event.data == YT.PlayerState.PLAYING && firstPlay) {
    		markWatched(<%= movieID %>);
    		$("#viewCount").text(parseInt($("#viewCount").text()) + 1);
    		firstPlay = false;
    	}
    	if(event.data == YT.PlayerState.ENDED && ($("#queue<%= movieID%>").html() == '<i class="fa fa-minus fa-lg"></i> Queue')) {
    		toggleQueue(<%= user.getMemberID()%>, <%= movieID %>, '<%= movie.getTitle() %>');
    	}
    }
    
</script>
<% } else { %>
	<div class="alert alert-danger">
		<strong>Error!</strong> You have exceeded your monthly movie limit.
	</div>
<% } %>
</div>
		<div class="col-sm-4">
			<div class="row">
				<div class="col-xs-12">
					<p><%= movie.getDesc() %></p>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<p><i class="fa fa-star-o fa-lg fa-2x"></i></p>
				</div>
				<div class="col-xs-10">
					<p><%= movie.getActor1() %>, <%= movie.getActor2() %></p>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<p><i class="fa fa-bullhorn fa-lg fa-2x"></i></p>
				</div>
				<div class="col-xs-10">
					<p><%= movie.getDirector() %></p>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<p><i class="fa fa-video-camera fa-lg fa-2x"></i></p>
				</div>
				<div class="col-xs-10">
					<p><%= movie.getGenre() %>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<p><i class="fa fa-film fa-lg fa-2x"></i></p>
				</div>
				<div class="col-xs-10">
					<p><%= movie.getRating() %></p>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<p><i class="fa fa-eye fa-lg fa-2x"></i></p>
				</div>
				<div class="col-xs-10">
					<p><span id="viewCount"><%= movie.getViewCount() %></span></p>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<p><i class="fa fa-thumbs-o-up fa-lg fa-2x"></i></p>
				</div>
				<div class="col-xs-10">
					<p><span id="likeCount"><%= movie.getLikeCount() %></span></p>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<p><i class="fa fa-certificate fa-lg fa-2x"></i></p>
				</div>
				<div class="col-xs-10">
					<span class="imdbRatingPlugin" data-user="ur83027010" data-title="<%=movie.getImdbKey()%>" data-style="p2">
					<a href="http://www.imdb.com/title/<%=movie.getImdbKey()%>/?ref_=plg_rt_1"><img src="http://g-ecx.images-amazon.com/images/G/01/imdb/plugins/rating/images/imdb_38x18.png" 
					alt="333" /></a> </span>
						<script>(function(d,s,id){
						var js,stags=d.getElementsByTagName(s)[0];
						if(d.getElementById(id))
						{
							return;
						}
						js=d.createElement(s);
						js.id=id;js.src="http://g-ec2.images-amazon.com/images/G/01/imdb/plugins/rating/js/rating.min.js";
						stags.parentNode.insertBefore(js,stags);})(document,'script','imdb-rating-api');
						</script>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6">
				<% boolean isInserted = ((Map<Integer, QueueEntry>)request.getSession().getAttribute("queueMap")).get(movieID) != null;%>
				<button type="button" class="btn btn-primary active col-xs-12" onclick="toggleQueue(<%= request.getSession().getAttribute("id")%>, <%= movieID %>, '<%= movie.getTitle() %>')" id="queue<%= movieID %>"><%= isInserted ? "<i class='fa fa-minus fa-lg'></i> Queue" : "<i class='fa fa-plus fa-lg'></i> Queue"%></button>							
				</div>
				<div class="col-xs-6">
					<button type="button" class="btn btn-success active col-xs-12" onclick="toggleLike(<%= movieID%>, <%= user.getMemberID()%>)" id="likeBtn"><i class="fa fa-heart-o fa-lg fa-x2"></i> <%= didLikeMovie ? "Unlike" : "Like"%></button>
				</div>
			</div>
		</div>
  </body>	
</body>
</html>