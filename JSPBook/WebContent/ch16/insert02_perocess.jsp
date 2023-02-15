<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "insert into member(mem_no, mem_id, mem_pw, mem_name) values (" +
						"seq_member.nextval, ?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			pstmt.setString(3,name);
			pstmt.executeUpdate();
			out.println("MEMBER 테이블 삽입이 성공했습니다!<br>");
			
		}catch(SQLException e){
			out.println("MEMBER 테이블 삽입이 실패했습니다!<br>");
			out.println("SQLException : " + e.getMessage());
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>