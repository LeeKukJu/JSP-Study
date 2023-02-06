<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		response.setStatus(500);
	--%>

	<h3>오류 발생</h3>
	<table border="1">
		<tr>
			<th>Error:</th>
			<td><%=exception.getClass().getName() %>: <%=exception.getMessage() %></td>
		</tr>
		<tr>
			<th>URI:</th>
			<td><%=request.getRequestURI() %></td>
		</tr>
		<tr>
			<th>Status code:</th>
			<td><%=response.getStatus() %></td>
		</tr>
	</table>
</body>
</html>