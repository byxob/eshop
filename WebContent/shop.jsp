<%@ page pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.newcapect.eshop.service.*"%>
<%@ page import="com.newcapect.eshop.entity.*"%>
<%@ include file="access.jsp"%>
<!DOCTYPE html>
<!-- 超文本
HTTP  HyperText Transportation Protocal
HyperText Markup Language -->
<html>
<head>
<meta charset="UTF-8">
<title>物联网专业-新开普实训</title>
<link rel="stylesheet" href="css/shoplist.css" type="text/css" />
<link rel="stylesheet" href="css/top.css" type="text/css" />
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	border: none;
	text-decoration: none;
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
</head>
<%
	String gcode = request.getParameter("gcode");
	if (gcode != null) {
		int code = Integer.parseInt(gcode);
		GoodsService gs = new GoodsService();
		Goods g = gs.findGoodsByCode(code);

		List<CartItem> shc = (List<CartItem>) session.getAttribute("shc");

		//如果购物车集合为空，说明之前没有购物，属于第一次操作购物车
		if (shc == null) {
			//创建购物车商品集合
			shc = new ArrayList<CartItem>();
			//创建购物车中的商品项
			CartItem item = new CartItem();
			item.setGoods(g);
			item.setNum(1);
			item.setSum(g.getGprice());

			//把商品项添加到购物车集合中
			shc.add(item);

			//存储购物车集合到会话对象中
			session.setAttribute("shc", shc);
		} else {
			//如果存在已选中的商品，增加其购买数量（加1）
			boolean exist = false;
			for (CartItem it : shc) {
				if (it.getGoods().getGcode() == code) {
					it.setNum(it.getNum() + 1);
					exist = true;
					break;
				}
			}

			if (!exist) {
				CartItem ci = new CartItem();
				ci.setGoods(g);
				ci.setNum(1);
				ci.setSum(g.getGprice());
				shc.add(ci);
			}
		}
	}
%>
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
			<div class="btn-area"><a href="oder.jsp" class="submit-btn">
			去结算<b></b></a>
			</div></td>
		</tr>
	</table>
</body>
</html>