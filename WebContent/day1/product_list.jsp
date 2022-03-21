<%@page import="java.time.LocalDate"%>
<%@page import="day1.Product"%>
<%@page import="java.util.List"%>
<%@page import="day1.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width:70%;margin:auto;border-collapse: collapse;
	}
	caption {
		text-align: right;font-size: 0.8em;
	}
	td,th{
		border : 1px solid gray;
		text-align: center;
		padding: 7px 4px;
	}
	th{
		background-color: green;
		color:white;
	}
	h3{
		text-align: center;
	}	
</style>
</head>
<body>
	<%
		ProductDao dao = ProductDao.getProductDao();
		List<Product> list = dao.selectAll(); 
	%>
	<h3>TBL_Product# 테이블 데이터</h3>
	<table>
	<caption>현재시간 : <%= LocalDate.now() %></caption>
		<tr>
			<th>상품코드</th>
			<th>카테고리</th>
			<th>상품명</th>
			<th>가격</th>
		</tr>
	<% 
		for(Product p : list){
	%>
		<tr>
			<td><%= p.getPcode() %></td>
			<td><%= p.getCategory() %></td>
			<td><%= p.getPname() %></td>
			<td><%= p.getPrice() %></td>
		</tr>
	
	<%
		}
	%>
	</table>
</body>
</html>