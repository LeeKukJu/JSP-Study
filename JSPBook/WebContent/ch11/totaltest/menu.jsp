<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<!-- 
	메뉴를 제공하는 페이지를 구성해주세요.
	- 메뉴를 구성하고 각 페이지(view)를 담당하는 jsp 마다 페이지 모듈화를 진행해주세요.
	
	[상단 메뉴 구성]
	게시판  자료실 -> boardList.jsp 요청 ( 시큐리티 작동하도록)
 -->

<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./boardList.jsp">게시판</a> 
			<a class="navbar-brand" href="#">자료실</a> 
			
			<%if (request.isUserInRole("admin")){
			%>
				<a class="navbar-brand" href="./logout.jsp">로그아웃</a>
			<%
			}
			%>
		</div>
	</div>
</nav>