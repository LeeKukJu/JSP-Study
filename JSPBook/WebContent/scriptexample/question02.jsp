<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<body>
	<caption>앞(SEM PC 자리)</caption>
	<table id="tb" width="100%" border="1" style="text-align: center; font-size: 24px;">
		<tr width="100%" height="80px">
			<td width="10%"></td>
			<td width="10%">양유림</td>
			<td width="10%">김주은</td>
			<td width="10%">박나래</td>
			<td width="10%"></td>
			<td width="10%">임주완</td>
			<td width="10%">이소라</td>
			<td width="10%">한유진</td>
			<td width="10%"></td>
		</tr>
		<tr height="80px">
			<td>허자연</td>
			<td>김정찬</td>
			<td>송지나</td>
			<td>신민수</td>
			<td></td>
			<td>심효정</td>
			<td>이치영</td>
			<td>김경훈</td>
			<td>김혜림</td>
		</tr>
		<tr height="80px">
			<td>임치택</td>
			<td>김성준</td>
			<td>김지선</td>
			<td>권나영</td>
			<td></td>
			<td>서동혁</td>
			<td>정시원</td>
			<td>윤선희</td>
			<td></td>
		</tr>
		<tr height="80px">
			<td></td>
			<td></td>
			<td>이국주</td>
			<td>김용익</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<hr><br>
	<button type="button" id="clickBtn">현재 자리 출력하기</button>
	<div id="output"></div>
</body>
<script type="text/javascript">
$(function(){
	var textBox = "";	// 텍스트 저장 공간
	var elementBox;		// 엘리멘트 저장 공간
	var flag = false;	// 스위칭 역할 담당
	
	$("td").on("click", function(){
		if(flag){ 	// 두번째 요소가 클릭했을때
			flag = false;	// 두번째 클릭해서 바뀜!
			elementBox.html($(this).text());
			$(this).html(textBox);
			
			textBox = "";
			elementBox = null;
			$("td").css("background-color", "white");
		}else{		// 첫번째 요소가 클릭했을때
			flag = true; 	// 먼저 클릭했음!
			textBox = $(this).text();
			elementBox = $(this);
			$(this).css("background-color", "yellow");
		}
	});
	
	$("#clickBtn").on("click", function(){
		$("#output").html("");	// 초기화
		
		var tds = document.getElementsByTagName("td");
		var html = "<table border=''><tr>";
		
		for(var i=1; i<=tds.length; i++){
			html += "<td width='10%'>" + tds[i-1].innerText + "</td>";
			if(i % 9 == 0){
				html += "</tr>";
			}
		}
		
		$("#output").html(html);
	});
});
</script>
</html>