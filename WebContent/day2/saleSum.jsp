<%@page import="day2.vo.SaleSum"%>
<%@page import="day2.vo.Member"%>
<%@page import="day2.dao.HrdProblemDao"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
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
		HrdProblemDao dao = HrdProblemDao.getHrdProblemDao();
		List<SaleSum> list = dao.selectSale(); 
	%>
	<h3>SaleSum 데이터</h3>
	<table>
	<caption>현재시간 : <%= LocalDate.now() %></caption>
		<tr>
			<th>회원번호</th>
			<th>이름</th>
			<th>등급</th>
			<th>총액</th>
		</tr>
	<% 
		for(SaleSum p : list){
	%>
		<tr>
			<td><%= p.getCustNo() %></td>
			<td><%= p.getCustName() %></td>
			<td><%= p.getGrade() %></td>
			<td><%= p.getSum() %></td>
		</tr>
	
	<%
		}
	%>
	</table>
</body>
</html>