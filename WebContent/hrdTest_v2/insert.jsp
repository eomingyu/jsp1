<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서버구현 코드는 html 태그 없이 작성할 수 있습니다.
	HrdMemberDao dao = HrdMemberDao.getInstance();
	int next = dao.getNextSeq();
	
	request.setAttribute("next", next);
	pageContext.forward("2_insertForm.jsp");
%>