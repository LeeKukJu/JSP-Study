<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		아이디 : OO
		비밀번호 : OO
		이름 : OO
		연락처 :
		성별 : 
		취미 : 
		소개 :
		
		위와 같은 형식으로 출력해주세요.
		출력은 Core태그를 이용하여 출력해주세요.
		취미는 Core태그 반복문을 이용하여 출력
	 -->
	 <%
	 	request.setCharacterEncoding("utf-8");
	 %>
	<p>아이디 : <c:out value="${param.id}"/></p>
	<p>비밀번호 : <c:out value="${param.pw}"/></p>
	<p>이름 : <c:out value="${param.name}"/> </p>
	<p>연락처 : <c:out value="${param.phone1}"/>-<c:out value="${param.phone2}"/>-<c:out value="${param.phone3}"/> </p>
	<p>성별 : <c:out value="${param.sex}"/></p>
	<p>취미 : 
		<%
			String[] hobby = request.getParameterValues("hobby");
		%>
		<c:forEach var="i" begin="0" end="<%=hobby.length %>">
			<c:out value="${paramValues.hobby[i] }"/>
		</c:forEach>
		
	</p>
	<p>가입인사 : <c:out value="${param.comment}"/> </p>
</body>
</html>