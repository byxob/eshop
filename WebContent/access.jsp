<%@ page  pageEncoding="utf-8" %>
<%@ page import="com.newcapect.eshop.entity.*" %>
<%
	User user = (User) session.getAttribute("user");

	if(user == null){
		response.sendRedirect("login.jsp");
	}
%>