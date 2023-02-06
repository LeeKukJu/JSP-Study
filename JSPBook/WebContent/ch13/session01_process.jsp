<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("admin") && pw.equals("1234")){
		session.setAttribute("userId", id);
		session.setAttribute("userPw", pw);
		
		out.println("세션설정이 성고했습니다!");
		out.println(id + "님 환영합니다.");
		
	}else {
		out.println("세션 설정이 실패했습니다.");
	}
	
%>