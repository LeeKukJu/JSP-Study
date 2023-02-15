<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문완료</title>
</head>
<body>
	<%
		String shopping_cartId = "";
		String shopping_name = "";
		String shopping_shippingDate = "";
		String shopping_country = "";
		String shopping_zipCode = "";
		String shopping_addressName = "";		

		// 쿠키 전부를 꺼내주세요
		// :::TODO getCookies() 함수 사용
		Cookie[] cookies = request.getCookies();
		

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				
				// 쿠키 이름을 꺼내주세요, 꺼낸 쿠키를 문자열 타입 n변수에 넣어주세요
				// :::TODO getName() 함수 사용
				String n = thisCookie.getName();
				
				if (n.equals("Shopping_cartId"))
					shopping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if (n.equals("Shopping_shippingDate"))
					shopping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">주문완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>
		<p>
			주문은	<%	out.println(shopping_shippingDate);	%>
			에 배송될 예정입니다! !	
		<p>
			주문번호 :	<%	out.println(shopping_cartId);	%>		
	</div>
	<div class="container">
		<p>
			<a href="./books.jsp" class="btn btn-secondary"> &laquo; 상품목록</a>
		</p>
	</div>
</body>
</html>
<%
	// ::: TODO
	// 세션 초기화
	session.invalidate();

	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();

		// ::: TODO
		// 쿠키 삭제 진행
		// 삭제할 쿠키명
		// Shopping_cartId, Shopping_name, Shopping_shippingDate, Shopping_country, Shopping_zipCode, Shopping_addressName
		
		
	}
%>
