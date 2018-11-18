<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="plugIn.QueueEntry" %>
<%@ page import="plugIn.Member" %>
<!-- <jsp:useBean id="member" class="plugIn.Member" scope="session"/> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Member m = (Member) session.getAttribute("user");
	m.setFirstName(request.getParameter("firstName"));
	m.setLastName(request.getParameter("lastName"));
	m.setPhone(request.getParameter("phone"));
	m.setPassword(request.getParameter("password"));
	m.setLevelName(request.getParameter("levelName"));
	m.setFavoriteGenre(request.getParameter("favoriteGenre"));
	m.setCcNumber(request.getParameter("ccNumber"));
	m.setCcFirstName(request.getParameter("ccFirstName"));
	m.setCcLastName(request.getParameter("ccLastName"));
	m.setCcv(new Integer((String) request.getParameter("ccv")));
	System.out.println("we did it");
	m.setExpMonth(new Integer((String) request.getParameter("ccMonth")));
	System.out.println("we did it");
	m.setExpYear(new Integer((String) request.getParameter("ccYear")));
	System.out.println("we did it");
	m.setCcType(request.getParameter("ccType"));
	m.setBillingAddress1(request.getParameter("billingAddress1"));
	m.setBillingAddress2(request.getParameter("billingAddress2"));
	m.setBillingCity(request.getParameter("billingCity"));
	m.setBillingState(request.getParameter("billingState"));
	m.setBillingZip(request.getParameter("billingZip"));
	m.setShippingAddress1(request.getParameter("shippingAddress1"));
	m.setShippingAddress2(request.getParameter("shippingAddress2"));
	m.setShippingCity(request.getParameter("shippingCity"));
	m.setShippingState(request.getParameter("shippingState"));
	m.setShippingZip(request.getParameter("shippingZip"));
	m.updateProfile();	
	session.setAttribute("user", m);
%>
	<jsp:forward page="profile.jsp" /> 
	
</body>
</html>