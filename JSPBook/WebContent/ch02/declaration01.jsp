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
		// ���� �±״� ������ �޼ҵ� ���� �����ϴ� �±�
		// ���� �±׷� ����� ������ ���� �ñ׷����� ������ �� Ŭ���� ������ ��� ������
		// �ǹǷ� ���������� ���ȴ�.
		
		// ���� data�� 50�� �����ϵ��� ���� �±׸� �ۼ�
		int data = 50;
	%>
	<%
		// out ���� ��ü�� println() �޼ҵ带 �̿��Ͽ� ������ ����ϵ���
		// ��ũ��Ʋ�� �±׸� �ۼ�
		// ���� data�� ���� �±׿� ����� �������� �� 50�� �ش���
		out.println("Value of the variable is : " + data);
	%>
</body>
</html>