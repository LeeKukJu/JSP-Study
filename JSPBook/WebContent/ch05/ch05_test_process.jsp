<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 스크립트 사용시 -->
<!-- <meta http-equiv="Refresh" content="5;url=www.naver.com" /> -->
<title>Insert title here</title>
</head>
<body>
	<!-- 
		ch05_test.jsp에서 전송받은 데이터 전부를 taglib를 이용하여 출력하시오
		
		[출력 예시]
		아이디 : a001
		비밀번호 : 1234
		이름 : 홍길동
		성별 : 남자
		핸드폰번호 : 010-1234-1234
		주소 : 대전시 서구 오류동 123
		
		[여기까지 가능한 분은 진행해보세요!!]
		출력을 완료했으면, 5초 뒤에 www.naver.com홈페이지로 이동시켜주세요!
		- 스크립트를 이용하던, 헤더를 이용하던 자유롭게!! 
	 -->
	 <%
	 	request.setCharacterEncoding("utf-8");
	 %>
	<p>아이디: <c:out value="${param.id}"/></p>	 
	<p>비밀번호: <c:out value="${param.pw}"/></p>	 
	<p>이름: <c:out value="${param.name}"/></p>	 
	<p>성별: <c:out value="${param.gender}"/></p>	 
	<p>핸드폰번호: <c:out value="${param.tel}"/></p>	 
	<p>주소: <c:out value="${param.addr}"/></p>
	<br>
	
	<p id="p1"></p>
	
	<script type="text/javascript">
	var a = 0;
	var pTag = document.getElementbyId("p1");
	
	// [방법1]
	setInterval(() => {
		a++;
		pTag.innerHTML = a + "초 뒤에 이동합니다!";
		if(a == 5)
			location.href = "https://www.naver.com";
	}, 1000);
	
	// [방법2]
	setTimeout(() => {
		location.href = "https://www.naver.com";
	}, 5000);
	</script>	 
	
	<%
	// 헤더를 사용시
	response.setHeader("Refresh", "5; URL=http://www.naver.com"); 
	%>
	 
</body>
</html>