<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	var SsameChar = 0;  		// 동일문자 카운트
	var sequeceCount1 = 0;  // 연속성(+) 카운트
	var sequeceCount2 = 0;  // 연속성(-) 카운트
	
	for(var i = 0; i < pw.length; i++){
		var char0;
		var char1;
		var char2;
		
		if(i >= 2){
			char0 = pw.charCodeAt(i-2);
			char1 = pw.charCodeAt(i-1);
			char2 = pw.charCodeAt(i);
			
			// 동일 문자 카운트
			if((char0 == char1) && (char1 == char2)){
				SameChar++;
			}else{
				SameChar = 0;
			}
		}
	}
   
   document.login.submit();
         
}      
</script>
<body>



   <form name="login" action="validation_process.jsp" method="post">
      아이디 : <input type="text" name="id" id="id"/><br/>
      비밀번호 : <input type="text" name="pw" id="pw"/><br/>
      비밀번호 확인 : <input type="text" name="pwCheck" id="pwCheck"/><br/>
   <input type="button" value="전송" onclick="loginCheck()"/>
   </form>





</body>
</html>