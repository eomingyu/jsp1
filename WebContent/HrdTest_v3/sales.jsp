<%@page import="koreait.vo.SaleSum"%>
<%@page import="java.util.List"%>
<%@page import="koreait.dao.HrdSaleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HrdSaleDao dao = HrdSaleDao.getInstance();
	List<SaleSum> list = dao.selectSale();
	
	request.setAttribute("list", list);
	pageContext.forward("7_saleList.jsp");
%>