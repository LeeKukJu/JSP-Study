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
		// 선언문 태그는 변수나 메소드 등을 선언하는 태그
		// 선언문 태그로 선언된 변수는 서블릿 플그램으로 번역될 때 클래스 수준의 멤버 변수가
		// 되므로 전역변수로 사용된다.
		
		// 변수 data에 50을 저장하도록 선언문 태그를 작성
		int data = 50;
	%>
	<%
		// out 내장 객체의 println() 메소드를 이용하여 내용을 출력하도록
		// 스크립틀릿 태그를 작성
		// 변수 data는 선언문 태그에 선언된 전역변수 값 50에 해당함
		out.println("Value of the variable is : " + data);
	%>
</body>
</html>