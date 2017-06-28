<%@ page pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.newcapect.eshop.service.*"%>
<%@ page import="com.newcapect.eshop.entity.*"%>
<%@ include file="access.jsp"%>

<%
	String gcode = request.getParameter("gcode");

	if (gcode != null) {
		int code = Integer.parseInt(gcode);
		List<CartItem> shc = (List<CartItem>) session.getAttribute("shc");
		if (shc != null) {
			for (CartItem it : shc) {
				if (it.getGoods().getGcode() == code) {
					shc.remove(it);
					break;
				}
			}
		}
	}
	
	response.sendRedirect("shop.jsp");
%>
