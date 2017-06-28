<%@ page  pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.newcapect.eshop.service.*" %>
<%@ page import="com.newcapect.eshop.entity.*" %>
<%@ include file="access.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>物联网专业-新开普实训</title>
<style type="text/css">
	*{margin: 0px;padding: 0px;border: none;}
	input{border: 1px #EBEBEB solid;}
	table, tr, td {
	margin: 5px;
	padding: 5px;
	border: 1px #EBEBEB solid;
}

table {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
}
</style>

</head>
<body>
<form action="">
	<p>收货信息:<input type="text" name="addr"></p>
	<p>支付方式：<select>
		<option value="网银">网银</option>
		<option value="支付宝">支付宝</option>
		<option value="微信">微信</option>
		<option value="货到付款">货到付款</option>
	</select></p>
	<table>
		<tr>
			<td>商品信息</td>
			<td>单价</td>
			<td>数量</td>
			<td>小计</td>
		</tr>
		<%
			List<CartItem> shopcart = (List<CartItem>) session.getAttribute("shc");
			for (CartItem i : shopcart) {
		%>
		<tr>
			<td><%=i.getGoods().getGname()%></td>
			<td><%=i.getGoods().getGprice()%></td>
			<td><%=i.getNum()%></td>
			<td><%=i.getNum() * i.getGoods().getGprice()%></td>
		</tr>
		<% 
			}
		%>
	</table>
	
	<input type="submit" value="支付">
	</form>
</body>
</html>