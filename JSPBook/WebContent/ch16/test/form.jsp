<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function CheckRegist() {
		var form = document.registForm;

		form.submit();
	}
</script>
<body>
	<!-- 
		제목, 내용, 작성자를 입력받고 게시글을 등록해주세요.
		날짜는 오늘 날짜가 자동으로 들어가도록 해주세요.
		조회수는 기본 0이 들어갑니다.
		게시글 번호는 시퀀스가 1씩 증가하여 들어갑니다.
		
		제목 : ~~~
		작성자 : ~~~~
		내용 : ~~~~
		-------------
		[등록][목록]
		
		처리폼을 만들고, 처리 process를 자유록게 작성하여 진행해도 좋습니다.
	 -->
	<%@include file="dbconn.jsp"%>

	<div class="container">
		<form action="./insert.jsp" name="registForm" method="post">
			<div class="row">
				<div class="col">
				
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
						<input type="text" class="form-control" name="writer"
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
				</div>
			</div><br>

			<div class="row">
				<div class="col" align="left">
					<a class="btn btn-primary" href="./list.jsp" role="button">목록</a>
				</div>
				<div class="col" align="right">
					<!-- 등록하기 -->
					<button type="button" class="btn btn-primary"
						onclick="CheckRegist();">등록</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>