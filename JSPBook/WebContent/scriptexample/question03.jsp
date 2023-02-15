<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
div{
	width:600px;
	height: 100px;
	border: 1px solid black;
}
p{
	margin: 0;
}
.dtext{
	font-size:30px;
}
</style>
<body>
	<!-- 
		총 4가지의 div가 있습니다.
		제일 먼저 선택한(클릭) div에 있는 텍스트를 
		두번째 눌린 div로 옮기는데 이때, 서로 박스에 들어있는 텍스트를 교체한다.
	 -->
	<div class="dtext" id="firstDiv">첫번째 박스</div>
	<div class="dtext" id="secondDiv">두번째 박스</div>
	<div class="dtext" id="thirdDiv">세번째 박스</div>
	<div class="dtext" id="fourDiv">네번째 박스</div>
	
	<br/>
	<hr/>
	<br/>
	
	<div style="overflow-y: scroll;" id="history"></div>
	<!-- 
		아래 select box에 있는 박스 순서를 선택하고
		출력 할 텍스트를 입력 후에 출력 버튼을 클릭 시,
		내가 입력한 텍스트가 선택한 div 박스안에 
		내가 입력한 텍스트가 추가로 출력되게 해주세요.
	 -->
	<select id="boxSelect">
		<option value="1">첫번째 박스</option>
		<option value="2">두번째 박스</option>
		<option value="3">세번째 박스</option>
		<option value="4">네번째 박스</option>
		<option value="5">모든 박스</option>
	</select>
	<input type="text" id="content"/>
	<input type="button" value="출력" id="pBtn"/>
</body>
<script type="text/javascript">
$(function(){
	var flag = false;
	var textBox = "";
	var elementBox;
	
	$("div").on("click", function(){
		if(flag){
			flag = false;
			elementBox.html($(this).html());
			$(this).html(textBox);
			
			textBox = "";
			elementBox = null;
			$("div").css("background-color", "white");
		}else{
			flag = true;
			textBox = $(this).html();
			elementBox = $(this);
			$(this).css("background-color", "yellow");
		}
	});
	
	$("#firstDiv").on("click", function(){
		$("#history").append("<p>firstDiv가 클릭되었습니다!</p>");
	});
	$("#secondDiv").on("click", function(){
		$("#history").append("<p>secondDiv가 클릭되었습니다!</p>");
	});
	$("#thirdtDiv").on("click", function(){
		$("#history").append("<p>thirdtDiv가 클릭되었습니다!</p>");
	});
	$("#fourDiv").on("click", function(){
		$("#history").append("<p>fourDiv가 클릭되었습니다!</p>");
	});
	
	$("#pBtn").on("click", function(){
		var select = $("#boxSelect").val();	// option value를 얻어온다.
		var content = $("#content").val();
		
		console.log(select, content);
		
		switch(select){
		case "1":
			$("#firstDiv").html(content);
			break;
		case "2":
			$("#secondDiv").html(content);
			break;
		case "3":
			$("#thirdtDiv").html(content);
			break;
		case "4":
			$("#fourDiv").html(content);
			break;
		case "5":
			for(var i=0; i<4; i++){
				$("div:eq("+i+")").html("["+(i+1)+"번째 박스]"+content);
			}
			break;
		}	
	});
});
</script>
</html>