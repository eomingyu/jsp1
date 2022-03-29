<%@page import="koreait.dao.HrdMemberDao"%>
<%@page import="koreait.vo.HrdMember"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회</title>
<link rel="stylesheet" href="0_hrdkorea.css">
</head>
<body>
	<div class="wrap_container">
	    <header>
	        <h3 class="header-item">쇼핑몰 회원관리 ver 1.0</h3>
	    </header>
	    <!-- top.jsp를 include -->
	    <%@include file="top.jsp"%>
	    <section>
<%
	Object temp2= request.getAttribute("list");
	List<HrdMember> list = (List<HrdMember>)temp2;
%>
			<h3 style="text-align: center;">회원 목록 조회/수정</h3>
			<table style="width:70%;margin:auto; text-align: center;">
				<tr>
					<th>회원번호</th>
					<th>이름</th>
					<th>연락처</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
				</tr>
			<% 
				for(HrdMember p : list){
			%>
				<tr>
					<td><a id="custno" href="update.jsp?num=<%= p.getCustNo() %>"><%= p.getCustNo() %></a></td>
					<td><%= p.getCustName() %></td>
					<td><%= p.getPhone() %></td>
					<td><%= p.getAddress() %></td>
					<td><%= p.getJoindate() %></td>
					<td><%
						String temp=p.getGrade();
						switch(temp){
						case "A":
							out.print("VIP");
							break;
						case "B":
							out.print("일반");
							break;
						case "C":
							out.print("직원");
							break;
						}
					%></td>
					<td><%= p.getCity() %></td>
				</tr>
			
			<%
				}
			%>
			</table>
		</section>
	    <footer>
	        HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea
	    </footer>
    </div>	
</body>
</html>