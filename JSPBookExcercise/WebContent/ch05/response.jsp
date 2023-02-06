<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>implicit Object</title>
</head>
<body>
	<%
// 		response.setIntHeader("Refresh", 5);
		response.setHeader("Refresh", "5;");
		Date nowDate = Calendar.getInstance().getTime();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("h:mm:ss a"); 
		
	%>
	
	<p>현재시간은 <%=simpleDateFormat.format(nowDate)%>
	<p> <a href="./response_data.jsp"> Google 홈페이지로 이동하기</a>
</body>
</html>