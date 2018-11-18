<%@page import="java.util.*" %>
<%@page import="plugIn.QueueEntry" %>
<nav class="nav navbar-default">
  	<div class="container">
  		<div class="navbar-header">
  			<a class="navbar-brand" href="index.jsp"><img style="height: 20px;" src="logo.png" alt="Plug_In"/></a>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nb-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
  		</div>
  		<div class="collapse navbar-collapse" id="nb-collapse">
	  		<ul class="nav navbar-nav">
	  			<li><a href="browse.jsp">Browse<i class="fa fa-lg fa-film fa-nav"></i></a></li>
	  			<li><a href="search.jsp">Search<i class="fa fa-lg fa-search fa-nav"></i></a></li>
	  			<% 
				  	TreeSet<QueueEntry> queueSet = (TreeSet<QueueEntry>) request.getSession().getAttribute("queueSet");
				  	if(queueSet != null) {
				  		%>
				  		<li class="dropdown">
				  		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.user.getFirstName()}'s Queue 
				  		 <span class="badge badge-light" id="queueCount">${sessionScope.queueSet.size() }</span> <span class="caret"></span></a>
              			 <ul class="dropdown-menu" id="queue">	
				  		<%
					  	Iterator<QueueEntry> it = queueSet.iterator();
					  	while (it.hasNext()) {
					         QueueEntry movie = (QueueEntry)it.next(); %>
					  		<li id="<%= movie.getMovieID() %>"><a href="details.jsp?id=<%= movie.getMovieID() %>"><%= movie.getMovieTitle() %></a></li>
				  		<%} %>
					  	</ul>
					  </li>
				  	<% 
				  	} %>
			</ul>
	  		<ul class="navbar-nav nav navbar-right">
	  			<% if(request.getSession().getAttribute("id") == null) { %>
	  				<li><a href="Login">Login <i class="fa fa-lg fa-sign-in fa-nav"></i></a></li>
	  			<% } else { %>
	  				<li><a href="profile.jsp">Profile<i class="fa fa-lg fa-user fa-nav"></i></a></li>
	  				<li><a href="Logout">Logout <i class="fa fa-lg fa-sign-out fa-nav"></i></a></li>
	  			<% } %>
	  			
  			</ul>
	  	</div>
  	</div>
 </nav>