<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="plugIn.QueueEntry" %>
<script>
	var queueCount = 0;
	function toggleQueue(memID, movID, movTitle) {
	console.log($("#queue"+movID).html());
	var isInserted = $("#queue"+movID).html() == '<i class="fa fa-minus fa-lg"></i> Queue';
		
		<% if(request.getSession().getAttribute("id") == null) { %>
			return false;
		<% } 
		else {
			
	    	  TreeSet queueSet = (TreeSet<QueueEntry>)request.getSession().getAttribute("queueSet");
			%>
			var isQueueEmpty = <%= queueSet != null && queueSet.isEmpty() %>;
			
			
			
			var saveData = $.ajax({
			      type: 'POST',
			      url: "Queue",
			      data: { "action": isInserted ? "delete" : "add", "memberID" : memID, "movieID" : movID, "movieTitle" : movTitle},
			      dataType: "text",
			      beforeSend: function() { 
			          $("#loading"+movID).html('<span>Loading ...</span>');
			          
			        },
			      success: function(resultData) { 
			    	  $("#loading"+movID).html('');
			    	  //$("#queue"+movID).addClass("btn btn-primary disabled");
			    	  $("#queue"+movID).html('<i class="fa fa-minus fa-lg"></i> Queue');
			    	  if(isInserted) {
			    		  $.notify(movTitle+" removed from queue", {
			    			    offset: 20,
			    				animate: {
			    					enter: 'animated fadeInRight',
			    					exit: 'animated fadeOutRight'
			    				}
			    		  		
			    			});
			    		  $("#queue"+movID).html('<i class="fa fa-plus fa-lg"></i> Queue');
			    		  $("#"+movID).remove();
			    		  $("#queueCount").text(parseInt($("#queueCount").text()) - 1);
					    	queueCount--;
					    	
			    	  } else {
			    		  $.notify(movTitle+" added to queue", {
			    			    offset: 20,
			    				animate: {
			    					enter: 'animated fadeInRight',
			    					exit: 'animated fadeOutRight'
			    				}
			    		  		
			    			});
			    		$("#queue").append('<li id="'+movID+'"><a href="details.jsp?id='+movID+'">'+movTitle+'</a></li>');
			    		$("#queue"+movID).html('<i class="fa fa-minus fa-lg"></i> Queue');
					    $("#queueCount").text(parseInt($("#queueCount").text()) + 1);
				    	queueCount++;
			    	  }

				}
			});
		
		<% } %>
		
	}
	
		</script>