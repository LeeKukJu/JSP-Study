<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			int a = 12;
			int b = 0;
			int c = a / b;
			out.println("a / b = " + c);
		} catch (ArithmeticException e) {
			out.println("오류 발생 : " + e.getMessage());
		}
		
	%>
</body>
</html>