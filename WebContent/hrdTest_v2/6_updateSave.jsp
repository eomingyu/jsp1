<%@page import="koreait.dao.HrdMemberDao"%>
<%@page import="koreait.vo.HrdMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 처리</title>
<link rel="stylesheet" href="0_hrdkorea.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	int custno = Integer.parseInt(request.getParameter("num"));
	String phone = request.getParameter("tel");
	String address = request.getParameter("addr");
	String city = request.getParameter("city_code");
		
	HrdMember vo = new HrdMember();
	vo.setPhone(phone);
	vo.setAddress(address);
	vo.setCity(city);
	vo.setCustNo(custno);
	
	HrdMemberDao dao = HrdMemberDao.getInstance();
	dao.update(vo);
	
	out.print("<script>alert('회원 수정 완료했습니다!');location.href='1_index.jsp'");
	out.print("</script>");

%>

<!-- 회원수정이 완료되면 1_index.jsp url로 이동하도록 해보세요 -->
</body>
</html>