<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting Tag</title>
</head>
<body>
	<h2>선언문 태그</h2>
	<%!
		// 전역 메소드 makeItLower()를 선언하기 위해 선언문 태그를 작성
		String makeItLower(String data){
			return data.toLowerCase();
	}
	%>
	<%
		// println() 메소드를 makeItLower() 메소드를 호출하여 내용을 출력하도록
		// 스크립틀릿 태그를 작성함
		// println() 메소드는 선언문 태그에 선언된 전역 메소드인 makeItLower()를 호출함
		out.println(makeItLower("Hello World!"));
	%>
</body>
</html>