<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
#myProgress {
	width: 100%;
	background-color: #ddd;
}

#myBar {
	width: 10%;
	height: 30px;
	background-color: #04AA6D;
	text-align: center; /* To center it horizontally (if you want) */
	line-height: 30px; /* To center it vertically */
	color: white;
}
</style>
<body>
	<caption>앞(SEM PC 자리)</caption>
	<table width="100%" border="1"
		style="text-align: center; font-size: 24px;">
		<tr width="100%" height="80px">
			<td width="10%"></td>
			<td width="10%">양유림</td>
			<td width="10%">김주은</td>
			<td width="10%">박나래</td>
			<td width="20%"></td>
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
			<td>박경훈</td>
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
	<hr />
	<div class="progress" style="height: 40px;">
		<div class="progress-bar progress-bar-striped" id="myBar"
			role="progressbar" aria-valuenow="60" aria-valuemin="0"
			aria-valuemax="100" style="width: 1px; height: 40px;">
			<span class="sr-only">60% Complete</span>
		</div>
	</div>
	<br />
	<h4 id="txt"></h4>
	<button type="button" onclick="move()"
		style="padding: 12px; border: none; cursor: pointer;">출력</button>
</body>
<script type="text/javascript">
	var i = 0;
	var myArray = [ "김주은", "양유림", "허자연", "김정찬", "송지나", "신민수", "임치택", "김성준",
			"김지선", "권나영", "이국주", "김용익", "박나래", "임주완", "한유진", "심효정", "이치영",
			"박경훈", "김혜림", "서동혁", "정시원", "윤선희", "이소라" ];
	
	var cnt = 0;		// myArray에서 이름을 꺼낼때 사용하는 index
	var seat = 0;		// show를 위한 index(td에 index를 배정할 때)
	
	function move() {
		if (i == 0) {
			i = 1;
			var elem = document.getElementById("myBar");
			var width = 0;
			var id = setInterval(frame, 100);
			
			function frame() {
				$("td:eq("+seat+")").css("background-color", "white");
				if (width >= 100) {		// 결과를 내기 위한 공간
					
					$("#txt").html(myArray[cnt]);
					
					var tds = document.getElementsByTagName("td");
					
					myArray.map(function(ele, i){
						console.log(tds[i].innerText + " : " + myArray[cnt]);
						
						if(tds[i].innerText == myArray[cnt]){
							tds[i].style.backgroundColor = "yellow";
						}
					});
					
					clearInterval(id);
					i = 0;
					
				} else {		// show를 위한 공간
					cnt = Math.floor(Math.random() * 21);
					seat = Math.floor(Math.random() * 31)
					
					console.log(cnt + " : " + seat);
					$("td:eq("+seat+")").css("background-color", "yellow");
					
					width++;
					elem.style.width = width + "%";
					elem.innerHTML = width + "%";
					
					if(width == 10){
						$("#txt").html("학생을 선정중입니다!!!");
					}					
					if(width == 20){
						$("#txt").html("조금만 기다려주세요!!!");
					}					
				}
			}
		}
	}
</script>
</html>