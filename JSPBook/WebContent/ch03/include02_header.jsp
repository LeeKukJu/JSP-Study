<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%!
		int pageCount = 0;
	
		void addCount(){
			pageCount++;
		}
	%>
	<%	
		// 스크립틀릿 - 함수 addCount()호출
		addCount();
	%>
	<p>이 사이트 방문은 <%=pageCount %>번째 입니다.</p>
