<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>요청 파라미터 이름 </th>
			<th>요청 파라미터 값 </th>
		</tr>
		<%
			request.setCharacterEncoding("utf-8");
			// getParameterNames();
			// 모든 입력 양식의 요청 파라미터 이름을 순서에 상관없이 Enumeration(열거형) 형태로 전달받음
			Enumeration paramNames = request.getParameterNames();
			// hasMoreElements() :
			// Enumeration(열거형) 요소가 있으면 true를 반환하고, 그렇지 않으면 false를 반환
			// 전송된 요청 파라미터가 없을 때까지 반복
			while(paramNames.hasMoreElements()){
				// nextElement() : Enumeration(열거형) 요소를 반환함
				// 폼 페이지에서 전송된 요청 파라미터의 이름을 가져옴
				String name = (String) paramNames.nextElement();
				out.println("<tr><td>" + name + "</td>\n");
				
				// 폼 페이지에서 전송된 요청 파라미터의 값을 얻어옴
				String paramValue = request.getParameter(name);
				out.println("<td>" + paramValue + "</td></tr>\n");
			}
		%>
	</table>
</body>
</html>