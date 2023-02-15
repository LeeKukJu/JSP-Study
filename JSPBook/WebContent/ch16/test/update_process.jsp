<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@include file="dbconn.jsp" %> 
<%
	request.setCharacterEncoding("utf-8");

	String no = request.getParameter("no");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	try{
		String sql = "update notice set bo_title = ?, bo_content = ?, bo_date = sysdate where bo_no = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, no);
		pstmt.executeUpdate();
		
	}catch(SQLException e){
		System.out.println("SQLException : " + e.getMessage());
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
	
	response.sendRedirect("detail.jsp?no="+ no);
%>