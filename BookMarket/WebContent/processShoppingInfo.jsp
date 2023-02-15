<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>

<%
	request.setCharacterEncoding("UTF-8");

	Cookie cartId = new Cookie("Shopping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("Shopping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie shippingDate = new Cookie("Shopping_shippingDate", URLEncoder.encode(request.getParameter("shoppingDate"), "utf-8"));
	Cookie country = new Cookie("Shopping_country", URLEncoder.encode(request.getParameter("country"), "utf-8"));
	Cookie zipCode = new Cookie("Shopping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
	Cookie addressName = new Cookie("Shopping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8"));

	// ::: TODO
	// 쿠키 생성 기간은 1년으로 해주세요.
	cartId.setMaxAge(24*60*60);
	name.setMaxAge(24*60*60);
	zipCode.setMaxAge(24*60*60);
	country.setMaxAge(24*60*60);
	addressName.setMaxAge(24*60*60);

	// ::: TODO
	// response 내장객체를 이용하여 쿠키를 추가해주세요.
	cartId.setMaxAge(24*60*60);
	name.setMaxAge(24*60*60);
	zipCode.setMaxAge(24*60*60);
	country.setMaxAge(24*60*60);
	addressName.setMaxAge(24*60*60);

	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);

	response.sendRedirect("orderConfirmation.jsp");
%>
