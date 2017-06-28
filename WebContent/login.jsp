<%@ page  pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.newcapect.eshop.service.*" %>
<%@ page import="com.newcapect.eshop.entity.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>物联网专业-新开普实训</title>
<style type="text/css">
	*{margin: 0px;padding: 0px;border: none;}
	#loginDiv input{border: 1px #e6e6e6 solid;
		width: 300px;height: 30px;
		margin: 15px 0}
	#loginDiv{
		width: 300px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 100px;
	}
	.loginbtn{
		background-color: #ff2832;
		font-size:16px;
		color: #fff;
	}
</style>

</head>
<body>
	<%
		String userid = request.getParameter("userid");
		String password = request.getParameter("userpwd");
		UserService us = new UserService();
		User u = us.login(userid, password);
		
		if(u !=null){
			//把当前的登录用户对象，存储在会话当中，以便后续请求/响应取出使用
			session.setAttribute("user", u);
			response.sendRedirect("index.jsp");//让浏览器重新请求参数指定的资源
		}
	%>
	<div id="loginDiv">
		<form action="login.jsp" method="post">
			<p>登录名：</p>
			<p><input type="text" name="userid"></p>
			<p>密码：</p>
			<p><input type="password" name="userpwd"></p>
			<p><input class="loginbtn" type="submit" value="快速登录"></p>
		</form>
	</div>
</body>
</html>