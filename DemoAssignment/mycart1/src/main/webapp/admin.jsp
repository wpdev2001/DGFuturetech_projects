<%@page import="com.wp.mycart.entities.User"%>
<%
	User user = (User)session.getAttribute("current-user");

	if(user==null){
		session.setAttribute("message", "You're not logged in!!! Login first");
		response.sendRedirect("login.jsp");
		return;
	}
	else{
		if(user.getUserType().equals("normal user")) {
			session.setAttribute("message", "You're not Admin!! Do not access this page");
			response.sendRedirect("login.jsp");
			return;        	
        }
	}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Admin Panel</title>
	<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<h1>This is Admin user panel</h1>
</body>
</html>