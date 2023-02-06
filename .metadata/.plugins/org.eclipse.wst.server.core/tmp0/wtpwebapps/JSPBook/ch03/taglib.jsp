<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- 1) forEach문 출력해보고 아래 여러 태그들을 이용하여 값을 출력해봅시다. -->

	<!-- 변수 k가 1부터 10까지 1씩 증가하도록 JSTL의 Core 태그 반복문 작성 -->
	<c:forEach var="k" begin="1" end="10" step="1" varStatus="stat">
		<c:out value="${k }" /> : <c:out value="${stat.count }" /> : <c:out
			value="${stat.index }" /> &nbsp;
   </c:forEach>
	<hr>

	<!-- JSTL을 사용하지 않고 스크립틀릿과 표현문을 통해 str을 출력 -->
	<%
		String str = "스크립틀릿으로 선언한 개똥이";
	%>
	<%=str%>

	<c:set var="str" value="core태그로 선언한 개똥이" />

	<!-- Core 태그 setter로 넣은 변수 str을 Core태그 out으로 출력 값에 EL언어로 출력 -->
	<c:out value="${str }" />
	<hr />

	<!-- 스크립틀릿으로 리스트를 선언하고 값 3개를 추가 -->
	<%
		List<String> list = new ArrayList<>();
	list.add("개똥이");
	list.add("김철수");
	list.add("메뚜기");

	// list[0] = 개똥이
	// list[1] = 김철수
	// list[2] = 메뚜기
	%>

	<!-- items << Collection -->
	<!-- items list와 같은 반복문을 돌리기 위한 컬렉션 객체 변수가 들어간다. -->
	<c:forEach var="item" items="<%=list%>">
		<c:out value="${item }" />
	</c:forEach>
	<br>
	<hr>

	<c:set var="money" value="5000" scope="page" />
	<p>내가 가진 돈은 ${money}원 이다.</p>
	<c:choose>
		<c:when test="${money <= 0 }">무일푼</c:when>
		<c:when test="${money >= 5000 }">커피 세잔의 여유 가능</c:when>
		<c:otherwise>밥묵자</c:otherwise>
	</c:choose>
	<br>
	<hr>

	<!-- 
      문제 풀기
      
      1) 리스트에 304호 반 학생 이름을 모두 넣고 Core태그 set에 저장한 후 , 전체를 출력해주세요.
      
      2) 전체 출력을 4명씩 끊어서 출력해주세요.
         이름 이름 이름 이름
         이름 이름 이름 이름
         ...
         
      3) 4명씩 끊어서 출력할 때, 본인의 이름은 '본인임' 으로 출력해주세요.
         '본인임' 글자를 출력 시 , 굵은 글씨/파랑색으로 출력해주세요.
    -->
	<p>1) 리스트에 304호 반 학생 이름을 모두 넣고 Core태그 set에 저장한 후 , 전체를 출력해주세요.</p>
	<%
		List<String> list304 = new ArrayList<String>();
	list304.add("김용익");
	list304.add("박경훈");
	list304.add("권나영");
	list304.add("김성준");
	list304.add("이국주");
	list304.add("김주은");
	list304.add("김지선");
	list304.add("김혜림");
	list304.add("박나래");
	list304.add("박종일");
	list304.add("송지나");
	list304.add("신민수");
	list304.add("심효정");
	list304.add("양유림");
	list304.add("윤선희");
	list304.add("이소라");
	list304.add("이치영");
	list304.add("임주완");
	list304.add("임치택");
	list304.add("정시원");
	list304.add("김정찬");
	list304.add("한유진");
	list304.add("허자연");
	list304.add("서동혁");
	%>
	
	<c:set var="list2" value="<%=list304%>" scope="page" />

	<c:forEach var="item" items="${list2 }">
		<c:out value="${item}" />
	</c:forEach>
	<hr>

	<p>2) 전체 출력을 4명씩 끊어서 출력해주세요.</p>

	<c:forEach var="item" items="${list2 }" varStatus="stat">
		<c:out value="${item}" />
		<c:choose>
			<c:when test="${stat.count mod 4 eq 0}">
				<br>
			</c:when>
		</c:choose>
	</c:forEach>
	<hr>

	<p>3) 4명씩 끊어서 출력할 때, 본인의 이름은 '본인임' 으로 출력해주세요. '본인임' 글자를 출력 시 , 굵은
		글씨/파랑색으로 출력해주세요.</p>

	<c:forEach var="item" items="${list2 }" varStatus="stat">
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${item eq '이국주'}"> --%>
<!-- 				<b style="color: blue;">본인임</b> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				<c:out value="${item}" /> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
<%-- 		<c:if test="${stat.count mod 4 eq 0}"> --%>
<!-- 			<br> -->
<%-- 		</c:if> --%>
		<c:choose>
			<c:when test="${item eq '이국주'}">
				<b style="color: blue;">본인임</b>
			</c:when>
			<c:when test="${stat.count mod 4 eq 0}">
				${item}<br>
			</c:when>
			<c:otherwise>
				${item }
			</c:otherwise>
		</c:choose>
	</c:forEach>

</body>
</html>