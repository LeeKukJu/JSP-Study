<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="dbconn.jsp" %>    
<%
	request.setCharacterEncoding("utf-8");

	String no = request.getParameter("no");
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	try{
		String sql = "delete from notice where bo_no = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, no);
		pstmt.executeUpdate();
		
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
	
	response.sendRedirect("./list.jsp");
%>

