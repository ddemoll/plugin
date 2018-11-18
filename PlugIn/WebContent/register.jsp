<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="plugIn.QueueEntry" %>
<jsp:useBean id="member" class="plugIn.Member" scope="session"/>
<jsp:setProperty name="member" property="*"/>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
member.register();
if(member.getMemberID() != 0){
	
	session.setAttribute("id", member.getMemberID());
	session.setAttribute("user", member);
	
	Map<Integer, QueueEntry> queueMap = new TreeMap<Integer, QueueEntry>();
	SortedSet<QueueEntry> queueSet = new TreeSet<QueueEntry>((m1,m2)->m1.getQueueSequence()-m2.getQueueSequence());
	
	session.setAttribute("queueMap", queueMap);
	session.setAttribute("queueSet", queueSet);
	%>
	<jsp:forward page="search.jsp" /> 
	<%
} else {%>
<h1>DB Error</h1>
<%} %>

</body>
</html>