<%@page import="day2.vo.SaleSum"%>
<%@page import="java.util.List"%>
<%@page import="day2.dao.HrdProblemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hrdSale</title>
</head>
<body>
<ul>
<%
	HrdProblemDao dao =HrdProblemDao.getHrdProblemDao();
	List<SaleSum> list = dao.selectSale();
	for(int i=0;i<list.size();i++){
%>
	<li><%= list.get(i).getCustNo() %></li>
	<li><%=list.get(i).getCustName() %></li>
	<li><%=list.get(i).getGrade() %></li>
	<li style="padding-bottom: 20px"><%=list.get(i).getSum() %></li>
<%
	}
%>
</ul>
</body>
</html>