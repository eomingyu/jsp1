<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//phone, address,city 입력값 가져오기 와 update 조건값 custno 가져오기
	
		request.setCharacterEncoding("UTF-8");
		int custno = Integer.parseInt(request.getParameter("num"));


		String phone = request.getParameter("tel");
		String address = request.getParameter("addr");
		String city = request.getParameter("city_code");
		/* out.print(custno);
		out.print("<br>");
		out.print(address);
		out.print("<br>"); */
			
		HrdMember member = new HrdMember();
		member.setPhone(phone);
		member.setAddress(address);
		member.setCity(city);
		member.setCustNo(custno);
		//out.print(member);
		
		HrdMemberDao dao = HrdMemberDao.getInstance();
		dao.update(member);
		out.print(dao.selectOne(custno));
		
/* 		HrdMemberDao dao = HrdMemberDao.getInstance();
		HrdMember member = dao.selectOne(custno);
		
		member.setPhone(phone);
		member.setAddress(address);
		member.setCity(city);
		dao.update(member);  */
		
	%>
 	
</body>
</html>