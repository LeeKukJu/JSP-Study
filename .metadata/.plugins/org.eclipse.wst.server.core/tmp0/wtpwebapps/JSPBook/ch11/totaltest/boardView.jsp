<%@page import="dto.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="exceptionBoard_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>@304_이국주</title>
</head>
<body>
	<!-- 
	리스트에서 선택한 해당 게시글 1개의 데이터를 출력해주세요.
	넘겨받은 게시판 데이터 객체를 코어태그에 저장하고 코어 태그를 이용해서 출력해주세요.
	c:set, c:out 등등 
	
	[출력 예]
	
	게시판 상세보기
	──────────────────────────────────────────────
	제목 : 
	작성자 작성일 조회수
	──────────────────────────────────────────────
	내용
	──────────────────────────────────────────────
	
	수정 삭제 목록
	
	1) 수정 버튼을 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 넘어가서 수정을 진행 할 수 있도록 해주세요.
	
	2) 삭제 버튼을 클릭 시, "정말로 삭제하시겠습니까?" 라는 알림창이 뜨고 [확인]을 클릭 했을 때
	   삭제(boardRemove.jsp)를 진행해주세요. 삭제 후, 게시판 목록 페이지(boardList.jsp)로 이동해주세요.
	   
	3) 목록 버튼을 클릭 시, 목록 페이지(boardList.jsp)로 이동해주세요.
 -->
	<%@include file="./menu.jsp"%>
	<div class="jumbotron">
		<div class="container" align="center">
			<h1 class="display-4">게시판 상세보기</h1>
		</div>
	</div>
	<%
		// 	request.setCharacterEncoding("utf-8");

	String boardId = request.getParameter("id");
	int boardHit = 0;

	if (request.getParameter("hit") != null) {
		boardHit = Integer.parseInt(request.getParameter("hit")) + 1;
	}

	BoardDAO boardDAO = BoardDAO.getInstance();
	BoardVO board = boardDAO.getBoardById(boardId);

	board.setHit(boardHit);
	%>
	<c:set var="board" value="<%=board%>" />
	<div class="container" align="center">

		<table class="table">
			<thead>
				<tr>
					<th colspan="2">
						<h3>제목 : <c:out value="${board.title}" /></h3>
						<h5 align="right">
							<c:out value="${board.author}" />|
							<c:out value="${board.writeDate}" />| 
							조회수 : <c:out value="${board.hit}" />
						</h5>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr colspan="2">
					<td height="450px">
						<c:if test="${not empty board.filename}">
							<img alt="" src="<%=request.getContextPath()%>/resources/images/${board.filename}"
							height="280" width="180"><br>
						</c:if>
						<c:out value="${board.content}" />
					</td>
				</tr>
				<tr>
					<td><a class="btn btn-primary" href="./boardList.jsp"
						role="button">목록 이동</a></td>
					<td align="right"><a class="btn btn-primary"
						href="./boardUpdateForm.jsp?id=${board.id}" role="button">수정하기</a> 
						<a class="btn btn-primary" href="./boardRemove.jsp?id=${board.id}" role="button">삭제하기</a></td>
				</tr>
			</tbody>
		</table>
	</div>

	<%@include file="./footer.jsp"%>
</body>
</html>