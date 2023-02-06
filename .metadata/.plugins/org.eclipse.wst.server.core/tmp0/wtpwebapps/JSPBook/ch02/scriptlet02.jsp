<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting Tag</title>
</head>
<body>
	<h2>스크립틀릿 태그</h2>
	<%
		// 0부터 10까지의 짝수를 출력하도록 스크립틀릿 태그를 사용
		for(int i = 0; i <= 10; i++){
			if(i % 2 == 0){
				out.println(i + "<br/>");
			}
		}
	%>
</body>
</html>