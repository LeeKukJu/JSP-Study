<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>------------ 세션 삭제 전 -------------</h3>
	<%
		String user_id = (String)session.getAttribute("userId");
		String user_pw = (String)session.getAttribute("userPw");
	
		out.println("설정된 세션 이름 userId : " + user_id + "<br>");
		out.println("설정된 세션 이름 userPw : " + user_pw + "<br>");
	
		if(request.isRequestedSessionIdValid() == true){
			out.println("세션이 유효합니다.");
		}else{
			out.println("세션이 유효하지 않습니다.");
		}
		
		session.invalidate();
	%>
	
	<h3>------------ 세션 삭제 후 -------------</h3>
	<%
	if(request.isRequestedSessionIdValid() == true){
		out.println("세션이 유효합니다.");
	}else{
		out.println("세션이 유효하지 않습니다.");
	}
	%>
	
</body>
</html>