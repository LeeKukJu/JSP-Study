<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./welcome.jsp">Home</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="/products.jsp"/>">상품목록</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="/addProduct.jsp"/>">상품등록</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="/editProduct.jsp?edit=update"/>">상품수정</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="/editProduct.jsp?edit=delete"/>">상품삭제</a></li>
			</ul>
		</div>
	</div>
</nav>