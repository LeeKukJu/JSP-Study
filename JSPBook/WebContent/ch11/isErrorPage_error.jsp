<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  
		현재 JSP 페이지가 오류 페이지가 되도록 page디렉티브 태그에 isErrorPage 속성을 작성
		오류가 발생했을 때 해당 예외 객체 타입을 가져와 출력하도록 표현문 태그에 exception 내장 객체의 함수를 이용하여 작성
	 -->
	<h3>오류가 발생했습니다.</h3>
	<p>예외유형 : <%=exception.getClass().getName() %></p>
	<p>오류 메세지 : <%=exception.getMessage() %></p>
</body>
</html>