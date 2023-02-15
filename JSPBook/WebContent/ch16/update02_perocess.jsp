<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
			String sql = "select mem_no, mem_id, mem_pw, mem_name from member where mem_id = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String rId = rs.getString("mem_id");
				String rPw = rs.getString("mem_pw");
				
				if(id.equals(rId) && pw.equals(rPw)){
					sql = "update member set mem_name = ? where mem_id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, id);
					pstmt.executeUpdate();
					out.println("MEMBER 테이블을 수정했습니다!");
				}else{
					out.println("일치하는 정보가 아닙니다!");
				}
			}else{
				out.println("MEMBER 테이블에 일치하는 아이디가 없습니다!");
			}
			
		}catch(SQLException e){
			out.println("SQLException : " + e.getMessage());
		}finally{
			if(rs != null)
				rs.close();
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