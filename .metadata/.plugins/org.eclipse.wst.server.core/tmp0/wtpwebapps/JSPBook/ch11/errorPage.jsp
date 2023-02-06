<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		JSP 페이지가 실행되는 도중에 오류가 발새하면 오류 페ㅣ지를 호출하도록 page 디렉티브 태그에
		errorPage 속성을 작성한다.
	 -->
	name 파라미터 : <%=request.getParameter("name").toUpperCase() %>
</body>
</html>