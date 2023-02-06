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
	<h3>------------ 세션 삭제 전 -------------</h3>
	<%
		String name;
		String value;
		
		Enumeration en = session.getAttributeNames();
		int i = 0;
		
		while(en.hasMoreElements()){
			i++;
			name = en.nextElement().toString();
			value = session.getAttribute(name).toString();
			
			out.println("설정된 세션의 속성 이름 ["+i+"]" + name + "<br/>");
			out.println("설정된 세션의 속성 값 ["+i+"]" + value + "<br/>");
		}
		
		session.removeAttribute("userId");
	%>
	<h3>------------ 세션 삭제 후 -------------</h3>
	<%
		
		en = session.getAttributeNames();
		i = 0;
		
		while(en.hasMoreElements()){
			i++;
			name = en.nextElement().toString();
			value = session.getAttribute(name).toString();
			
			out.println("설정된 세션의 속성 이름 ["+i+"]" + name + "<br/>");
			out.println("설정된 세션의 속성 값 ["+i+"]" + value + "<br/>");
		}
		
	%>
</body>
</html>