<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting Tag</title>
</head>
<body>
	<h2>���� �±�</h2>
	<%!
		// ���� �޼ҵ� makeItLower()�� �����ϱ� ���� ���� �±׸� �ۼ�
		String makeItLower(String data){
			return data.toLowerCase();
	}
	%>
	<%
		// println() �޼ҵ带 makeItLower() �޼ҵ带 ȣ���Ͽ� ������ ����ϵ���
		// ��ũ��Ʋ�� �±׸� �ۼ���
		// println() �޼ҵ�� ���� �±׿� ����� ���� �޼ҵ��� makeItLower()�� ȣ����
		out.println(makeItLower("Hello World!"));
	%>
</body>
</html>