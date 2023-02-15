<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
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
	<!-- 
		공지사항 게시판을 만들어주세요
		JDBC를 이용하여 CRUD를 진행해주세요.
		
		NOTICE 테이블을 작서해주세요.
		CREATE TABLE NOTICE(
		BO_NO NUMBER(8) NOT NULL PK,
		BO_TITLE VARCHAR2(150) NOT NULL,
		BO_CONTENT VARCHAR2(2000) NOT NULL,
		BO_WRITER VARCHAR2(150) NOT NULL,
		BO_DATE DATE NOT NULL,
		BO_HIT NUMBER(8) NOT NULL
		);
		
		CREATE SEQUENCE SEQ_NOTICE START WITH 1 INCREMENT BY 1 nocache;
		
		공지사항 게시판 목록을 만들어주세요.
		
		번호	    | 	제목			|	작성자	|	작서일			|	조회수
		-----------------------------------------------------------------
		1			제목입니다1	|	a001	| 2023-02-08 14:15	|	1415
		-----------------------------------------------------------------
		[등록]	| <요녀석은 버튼
		
	 -->
	 
<%@include file="dbconn.jsp" %>	 
<div class="container">
	<div class="row" align="center">
		<table class="table table-hover" align="center">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<% 
					ResultSet rs = null;
					PreparedStatement pstmt = null;
					
					try{
						String sql = "select bo_no, bo_title, bo_content, bo_writer, bo_date, bo_hit from notice";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						while(rs.next()){
							String no = rs.getString("bo_no");
							String title = rs.getString("bo_title");
							String writer = rs.getString("bo_writer");
							Date date = rs.getDate("bo_date");
							String hit = rs.getString("bo_hit");
							
						%>
						<c:set var="no" value="<%=no %>"/>
						<c:set var="hit" value="<%=hit %>"/>
							<tr onClick="location.href='./detail.jsp?no=${no}&hit=${hit}'" style="cursor:pointer;">
								<td><%=no %></td>
								<td><%=title %></td>
								<td><%=writer %></td>
								<td><%=date %></td>
								<td><%=hit %></td>
							</tr>
						<%
						}
						
					}catch(SQLException e){
						out.println("NOTICE 테이블 호출이 실패했습니다! <br>");
						out.println("SQLException : " + e.getMessage());
					}finally{
						if(rs != null)
							rs.close();
						
						if(pstmt != null)
							pstmt.close();
						
						if(conn != null)
							conn.close();
					}
				%>
			</tbody>	
		</table>
	
	</div>
	<div class="row" align="left">
		<a class="btn btn-primary" href="./form.jsp" role="button">등록</a>
	</div>
</div>


</body>
</html>