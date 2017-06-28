<%@ page pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.newcapect.eshop.service.*"%>
<%@ page import="com.newcapect.eshop.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>物联网专业-新开普实训</title>
<link rel="stylesheet" href="css/top.css" type="text/css" />
<style type="text/css">
* {
	margin: 0px;
	border: none;
	padding: 0px;
	text-decoration: none;
}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function search() {
		//1,得到查询关键字
		//var wd = $("#swd").val();
		$("#sform").submit();
	}
</script>
</head>
<body>
	<div id="shortcut">
		<div class="w">
			<ul class="fr">
				<li id="ttbar-login" class="fore1 icon-plus-state0" id="ttbar-login">
					<a href="login.jsp" class="link-login">你好，请登录</a>&nbsp;&nbsp;<a
					href="reg.jsp" class="link-regist style-red">免费注册</a>
				</li>
				<li class="spacer"></li>
				<li class="fore2">
					<div class="dt">
						<a href="oderlist.jsp">我的订单</a>
					</div>
				</li>
				<li class="spacer"></li>
				<li class="fore2">
					<div class="dt">
						<a href="shop.jsp">购物车</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<form action="index.jsp" method="get" id="sform">
		<div id="searchDiv">
			<input class="sbox" type="text" id="swd" name="swd"> <input
				type="image" class=sbtn value="" src="images/sbutton.png"
				onclick="search()">
		</div>
	</form>
	<%
		String gname = request.getParameter("swd");
		GoodsService gs = new GoodsService();
		List<Goods> list = gs.findGoodsByTitle(gname);
		for (int i = 0; i < list.size(); i++) {
			Goods g = list.get(i);
	%>
	<section>
		<%-- ?作为查询的起始符号，后续使用"="组成“名=值”对，多个名值对之间使用“&”断开--%>
		<a href="detail.jsp?gcode=<%=g.getGcode()%>"> <img alt=""
			src="<%=g.getGpic()%>"></a> <a
			href="detail.jsp?gcode=<%=g.getGcode()%>">
			<h1 class="cls-title"><%=g.getGname()%></h1>
		</a> <a href="shop.jsp?gcode=<%=g.getGcode()%>">放入购物车</a>
	</section>
	<%
		}
	%>
</body>
</html>