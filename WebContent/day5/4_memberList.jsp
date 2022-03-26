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
	String find = request.getParameter("search");

	HrdMemberDao dao = HrdMemberDao.getInstance();
	List<HrdMember> list = null;
	if(find ==null || find.length() ==0)
		list = dao.selectAll();			//전체 리스트
	else	//파라미터 있을 때
		list = dao.searchName(find);	//이름으로 조회한 리스트
	String col = request.getParameter("column");
	
			
%>
			<h3 style="text-align: center;">회원 목록 조회/수정</h3>
			<div>
				<form action="4_memberList.jsp">
					<select name="column">
						<option value="a">이름</option>
						<option value="b">주소</option>
						<option value="c">고객등급</option>
						<option value="d">거주지역</option>
					</select>
					<input name="search" placeholder="검색할 이름 입력">
					<button>검색</button>
					<button type="button" onclick="location.href='4_memberList.jsp'">전체보기</button>
				</form>
			</div>

		
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
				if(list.size()!=0){
				  for(HrdMember p : list){
			%>
				<tr>
					<td><a id="custno" href="5_updateForm.jsp?num=<%= p.getCustNo() %>"><%= p.getCustNo() %></a></td>
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
				}else{
			%>
				<tr>
					<td colspan="7">조회 결과가 없습니다.</td>
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