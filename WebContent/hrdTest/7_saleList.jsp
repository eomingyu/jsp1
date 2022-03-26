<%@page import="koreait.dao.HrdSaleDao"%>
<%@page import="java.util.List"%>
<%@page import="koreait.vo.SaleSum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출조회</title>
<link rel="stylesheet" href="0_hrdkorea.css">
</head>
<body>
	<div class="wrap_container">
		<header>
			<h3 class="header-item">쇼핑몰 회원관리 ver 1.0</h3>
		</header>
		<nav>
			<ul class="container">
				<li><a href="2_insertForm.jsp">회원등록</a></li>
				<li><a href="4_memberList.jsp">회원목록조회/수정</a></li>
				<li><a href="7_saleList.jsp">회원매출조회</a></li>
				<li><a href="1_index.jsp">홈으로</a></li>
			</ul>
		</nav>
		<section>
			<%
			HrdSaleDao dao = HrdSaleDao.getInstance();
			List<SaleSum> list = dao.selectSale();
			%>
			<h3 style="text-align:center;">회원 매출 조회</h3>
			<table style="width: 50%; margin: auto; text-align: center;">
				<tr>
					<th>회원번호</th>
					<th>이름</th>
					<th>등급</th>
					<th>총액</th>
				</tr>
				<%
					for (SaleSum p : list) {
				%>
				<tr>
					<td><%=p.getCustNo()%></td>
					<td><%=p.getCustName()%></td>
					<td><%=p.getGrade()%></td>
					<td><%=p.getSum()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</section>
		<footer> HRDKOREA Copyright&copy;2016 All rights reserved.
			Human Resources Development Service of Korea </footer>
	</div>
</body>
</html>
