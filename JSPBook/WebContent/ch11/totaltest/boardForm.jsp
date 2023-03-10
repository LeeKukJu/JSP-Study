<%@page import="org.apache.commons.lang3.RandomStringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>@304_이국주</title>
</head>
<script type="text/javascript">
	function CheckRegist() {
		var form = document.registForm;
		var title = form.title.value;
		var author = form.author.value;

		var regExpTitle = /^.{5,30}$/;
		var regExpAuthor = /^[a-zA-Z가-힣]+$/;

		if (!regExpTitle.test(title)) {
			alert("제목은 최소 모든 문자 5자에서 최대 30자까지 작성 가능합니다.");
			form.title.focus();
			form.title.select();
			return;
		}

		if (!regExpAuthor.test(author)) {
			alert("작성자는 영소대문자, 한글만 작성 가능합니다.");
			form.author.focus();
			form.author.select();
			return;
		}

		form.submit();
	}
</script>
<body>
	<!-- 
	게시판 FORM 페이지를 작성해주세요.
	
	[출력 예]
	
	게시글 등록
	─────────────────────────────
	제목 : 
	작성자 : 
	내용 :
	─────────────────────────────
	첨부파일 : [파일 선택 ]
	─────────────────────────────
	등록 목록
	
	1) 등록 버튼을 클릭 시, 게시글 등록을 진행해주세요.
		등록을 위해 이동할 페이지(boardInsert.jsp)로 이동해서 등록 처리를 진행해주세요.
		등록이 완료되었다면 현재 등록된 상세정보 페이지(boardView)로 이동해주세요.
		
		(정규식)
		등록 시, 제목은 최소 모든 문자 5자에서 최대 30자까지로 설정가능하게 해주세요.
		작성자는 영소대문자, 한글만 가능하게 설정해주세요. 
		
	2) 목록 버튼을 클릭 시, 게시판 목록 페이지로 이동해주세요(boardList.jsp)

 -->
	<%
		String id = RandomStringUtils.randomAlphanumeric(6);
	%>
	<c:set var="boardId" value="<%=id%>" />

	<%@include file="./menu.jsp"%>
	<div class="jumbotron">
		<div class="container" align="center">
			<h1 class="display-4">게시글 등록</h1>
		</div>
	</div>

	<div class="container">
		<form action="./boardInsert.jsp" name="registForm" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col">
					<!-- id -->
					<input type="hidden" name="id" value="${boardId}">

					<!-- 제목 -->
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">제목</span>
						</div>
						<input type="text" class="form-control" name="title"
							placeholder="제목을 작성해주세요." aria-label="Username"
							aria-describedby="basic-addon1">
					</div>

					<!-- 작성자 -->
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon2">작성자</span>
						</div>
						<input type="text" class="form-control" name="author"
							placeholder="작성자를 작성해주세요." aria-label="Username"
							aria-describedby="basic-addon2">
					</div>

					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">내용</span>
						</div>
						<textarea class="form-control" name="content"
							style="height: 400px;" aria-label="With textarea"></textarea>
					</div>
					<br>

					<!-- 파일 업로드 -->
					<div class="input-group mb-3">
						<input type="file" name="filename" multiple="multiple">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col" align="left">
					<a class="btn btn-primary" href="./boardList.jsp" role="button">목록
						이동</a>
				</div>
				<div class="col" align="right">
					<!-- 등록하기 -->
					<button type="button" class="btn btn-primary"
						onclick="CheckRegist();">등록하기</button>
				</div>
			</div>
		</form>
	</div><br>
	<%@include file="./footer.jsp"%>
</body>
</html>