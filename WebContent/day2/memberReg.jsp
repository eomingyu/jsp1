<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- memberReg.html 에서 입력한 7개의 사용자 입력값을 전달 받아서 table 태그에 출력해보세요. -->
<%
String name = request.getParameter("name");
int password = Integer.parseInt(request.getParameter("password"));
String email = request.getParameter("email");
int age = Integer.parseInt(request.getParameter("age"));
String addr = request.getParameter("addr");
String gender = request.getParameter("gender");
String hobby[] = request.getParameterValues("hobby");

%>
<table>
	<tr>
		<th>이름</th>
		<td><%= name%></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><%= password%></td>
	</tr><tr>
		<th>이메일</th>
		<td><%= email%></td>
	</tr><tr>
		<th>나이</th>
		<td><%= age%></td>
	</tr><tr>
		<th>주소</th>
		<td><%= addr%></td>
	</tr><tr>
		<th>성별</th>
		<td><%= gender%></td>
	</tr>
	<tr>
		<th>취미</th>
		<td><%= Arrays.toString(hobby)%></td>
	</tr>
	
</table>

</body>
</html>