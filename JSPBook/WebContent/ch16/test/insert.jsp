<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="dbconn.jsp" %>
    
<%
	request.setCharacterEncoding("utf-8");	

	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	PreparedStatement pstmt = null;
	
	try{
		String sql = "insert into notice(bo_no, bo_title, bo_content, bo_writer, bo_date, bo_hit) values (" +
					"seq_member.nextval, ?,?,?,sysdate,0)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, writer);
		pstmt.executeUpdate();
		
	}catch(SQLException e){
		System.out.println("SQLException : " + e.getMessage());
	}finally{
		if(pstmt != null){
			pstmt.close();
		}
		if(conn != null){
			conn.close();
		}
	}
	
	response.sendRedirect("./list.jsp");
%>