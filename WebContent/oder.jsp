<%@ page pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.newcapect.eshop.service.*"%>
<%@ page import="com.newcapect.eshop.entity.*"%>
<%@ include file="access.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>物联网专业-新开普实训</title>
<link rel="stylesheet" href="css/top.css" type="text/css" />
<link rel="stylesheet" href="css/oder.css" type="text/css" />
<link rel="stylesheet" href="css/shoplist.css" type="text/css" />
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	border: none;
	text-decoration: none;
}

input {
	border: 1px #EBEBEB solid;
}

table, tr, td {
	margin: 5px;
	padding: 5px;
	border: 0px #EBEBEB solid;
}

table {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<script type="text/javascript">
function ale() {  
	alert("支付成功")
	window.location.href = "oderlist.jsp";
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
						<a href="index.jsp">首页</a>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="w">
		<div class="checkout-tit">
			<span class="tit-txt">填写并核对订单信息</span>
		</div>
		<div class="checkout-steps">
			<div class="step-tit">
				<h3>收货人信息：河南省郑州市科学大道136号郑州轻工业学院</h3>
			</div>
			<div>
				<div class="step-tit">
					<h3>
						支付方式： <select>
							<option value="网银">网银</option>
							<option value="支付宝">支付宝</option>
							<option value="微信">微信</option>
							<option value="货到付款">货到付款</option>
						</select>
					</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="cart-thead x">
		<div class="column t-goods">商品</div>
		<div class="column t-props"></div>
		<div class="column t-price">单价</div>
		<div class="column t-quantity">数量</div>
		<div class="column t-sum">小计</div>
		<div class="column t-action">操作</div>
	</div>
	<%
		double a = 0.0;
		double sum = 0.0;
		List<CartItem> shopcart = (List<CartItem>) session.getAttribute("shc");
		for (CartItem i : shopcart) {
	%>
	<div class="item-form x">
		<div class="cell p-goods">
			<div class="goods-item">
				<div class="p-img">
					<a href="detail.jsp?gcode=<%=i.getGoods().getGcode()%>" class="J_zyyhq_11922453">
					<img alt="" src="<%=i.getGoods().getGpic()%>"></a>
				</div>
				<div class="item-msg">
					<div class="p-name">
						<a href="detail.jsp?gcode=<%=i.getGoods().getGcode()%>"><%=i.getGoods().getGname()%></a>
					</div>
				</div>
			</div>
		</div>
		<div class="cell p-price">
			<strong>¥<%=i.getGoods().getGprice()%></strong>
		</div>

		<div class="cell p-quantity"><%=i.getNum()%></div>

		<div class="cell p-sum">
			<strong>¥<%=i.getNum() * i.getGoods().getGprice()%></strong>
		</div>
		<div class="cell p-ops">
			<a href="delitem.jsp?gcode=<%=i.getGoods().getGcode()%>">删除</a>
			<%
				a = i.getNum() * i.getGoods().getGprice();
					sum = sum + a;
			%>
		</div>
	</div>
	<div class="item-line"><hr/></div>
	<%
		}
	%>
	<table>
		<tr>
			<td colspan="5" align="right">总价：<%=sum%></td>
		</tr>
		<tr>
			<td colspan="5" align="right">
			<div class="btn-area"><a href="oderlist.jsp" class="submit-btn" onclick="ale()">
			提交订单<b></b></a>
			
			</div>
			</td>
		</tr>
	</table>
</body>
</html>