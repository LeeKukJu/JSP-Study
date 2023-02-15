<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	String id = request.getParameter("cartId");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("cart.jsp");
		return;
	}

	// :::TODO
	// 세션을 초기화해주세요.
	session.invalidate();
	
	%>

	response.sendRedirect("cart.jsp");
%>
