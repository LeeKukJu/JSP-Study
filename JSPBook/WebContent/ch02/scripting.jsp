<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting Tag</title>
</head>
<body>
	<h2>Scripting Tag</h2>
	<%!
		// 선언문 태그를 사용하여 자바 변수와 메소드 정의
		int count = 3;
		 String makeItLower(String data){
			 return data.toLowerCase();
		 }
		 
	%>
	
	<%
		for(int i = 1; i <=count; i++){
			out.println("Java Server Pages " + i + "<br/>");
			
		}
	%>
	<!-- 표현문 태그로 선언문의 메소드를 호출하여 문자열 형태로 출력 -->
	<%=makeItLower("Hello World!") %>
</body>
</html>