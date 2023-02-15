<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cartId = session.getId();

	// 쿠키를 담을때 사용하세요.
	String shopping_cartId = "";
	String shopping_name = "";
	String shopping_shippingDate = "";
	String shopping_country = "";
	String shopping_zipCode = "";
	String shopping_addressName = "";
	
	// ::: TODO
	// request 내장객체에서 모든 쿠키를 얻어옵니다. getCookies() 함수 이용
	// 저장 변수는 cookies
	
	Cookie[] cookies = request.getCookies();
	
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			
			
			if (n.equals("Shopping_cartId"))
				// ::: TODO
				// 꺼낸 쿠키의 쿠키명을 비교하여 해당 쿠키명에 맞는 쿠키를 각 쿠키변수에 저장해주새요.
				// getValue() 이용
				shopping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shopping_name"))
				// ::: TODO
				// 꺼낸 쿠키의 쿠키명을 비교하여 해당 쿠키명에 맞는 쿠키를 각 쿠키변수에 저장해주새요.
				// getValue() 이용
				shopping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shopping_shippingDate"))
				// ::: TODO
				// 꺼낸 쿠키의 쿠키명을 비교하여 해당 쿠키명에 맞는 쿠키를 각 쿠키변수에 저장해주새요.
				// getValue() 이용
				shopping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shopping_country"))
				shopping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shopping_zipCode"))
				shopping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shopping_addressName"))
				shopping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문정보</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">주문정보</h1>
		</div>
	</div>

	<div class="container col-8 alert alert-info">
		<div class="text-center ">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<!-- 
					:::TODO
					아래를 채워주세요. 
				-->
				<strong>배송 주소</strong> <br> 성명 : <% out.println(shopping_name); %>	<br> 
				우편번호 : <% 	out.println(shopping_zipCode);%><br> 
				주소 : <%	out.println(shopping_addressName);%>(<%	out.println(shopping_country);%>) <br>
			</div>
			<div class="col-4" align="right">
				<p>	<em>배송일: <% out.println(shopping_shippingDate);	%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">			
			<tr>
				<th class="text-center">도서</th>
				<th class="text-center">#</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Book>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Book book = cartList.get(i);
					int total = book.getUnitPrice() * book.getQuantity();
					sum = sum + total;
			%>
			<tr>
				<td class="text-center"><em><%=book.getName()%> </em></td>
				<td class="text-center"><%=book.getQuantity()%></td>
				<td class="text-center"><%=book.getUnitPrice()%>원</td>
				<td class="text-center"><%=total%>원</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><%=sum%> </strong></td>
			</tr>
			</table>
				<a href="./shoppingInfo.jsp?cartId=<%=shopping_cartId%>"class="btn btn-secondary" role="button"> 이전 </a>
				<a href="./thankCustomer.jsp"  class="btn btn-success" role="button"> 주문완료 </a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button"> 취소 </a>
		</div>
	</div>	
</body>
</html>
