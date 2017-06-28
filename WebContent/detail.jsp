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
	div{margin: 10px}
	#left{width: 35%}
	#right{width: 50%}
	#left,#right {float: left;}
</style>
</head>
<body>
	<%
		//request 是JSP的内置对象（不需要实例化创建，直接使用）
		//用于取得浏览器发送到服务器的数据。
		String gcode = request.getParameter("gcode");
		//把字符串转换成整型数据，用Integer包装类
		int code = Integer.parseInt(gcode);
		
		GoodsService gs = new GoodsService();
		
		Goods g = gs.findGoodsByCode(code);
	%>
	
	<div id="header">
		<img alt="" src="images/header.png">
	</div>
	<div id="content">
		<div id="left"><img src="images/left.png"></div>
		<div id="right"><img alt="" src="images/right.png"> </div>
		<div style="clear: both;border: none"></div>
	</div>
	<div id="footer">页脚</div>
	
</body>
</html>