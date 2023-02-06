<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<%@ include file ="menu.jsp" %>
	<%! 
		String greeting="도서 웹 쇼핑몰";
		String tagline="Welcome to Web Market!";
	%>
	
	<!-- 
		해당 위치에 디렉티브 태그를 이용하여 menu.jsp 내용을 포함시켜 주세요.
		:: TODO
	-->
	
	<!--
		문자열 타입의 greeting 이라는 전역 변수에 "도서 웹 쇼핑몰"로 변수 선언 및 초기화를 해주세요.
		문자열 타입의 tagline 이라는 전역 변수에 "Welcome to Web Market!"로 변수 선언 및 초기화를 해주세요.
		:: TODO
	-->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">
			<%=greeting %>
				<!-- 표현문을 이용하여 greeting을 출력해주세요. -->
			</h1>
		</div>
	</div>
	<main role="main">
	<div class="container">
		<div class="text-center">
			<h3>
			<%=tagline %>
				<!-- 표현문을 이용하여 tagline을 출력해주세요. -->
			</h3>			
		</div>
		<hr>
	</div>
	</main>
	<%@include file="footer.jsp" %>
	<!-- 
		해당 위치에 디렉티브 태그를 이용하여 footer.jsp 내용을 포함시켜 주세요.
		:: TODO
	-->
</body>
</html>