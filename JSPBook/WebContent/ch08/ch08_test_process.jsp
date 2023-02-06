<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ch08_test_process</title>
</head>
<body>
<!-- 
	ch08_test.jsp 에서 전송한 데이터를 출력해주세요.
 -->
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<p>	퀘스트1 : <%=request.getParameter("quest1")%>
	<p>	퀘스트2 :	<%=request.getParameter("quest2")%>
	<p>	아이디 : <%=request.getParameter("mem_id")%>
	<p>	비밀번호 : <%=request.getParameter("mem_pw")%>
	<p>	이름 : <%=request.getParameter("mem_name")%>
	<p>	전화번호 : <%=request.getParameter("mem_phone")%>
</body>
</html>