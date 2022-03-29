<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 화면</title>
<script src="0_member_valid.js"></script>
<script type="text/javascript">
		function isSubmit(){			
			const frm = document.forms[0];
			if(valid_check()){				//유효성 검사 통과
				frm.submit();
		}
	}
</script>
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
				HrdMember member = (HrdMember)request.getAttribute("member");
				/* if(member==null) {
					out.print("<script>alert('검색결과가 없습니다.');location.href='memberList.jsp';");
					out.print("</script>");
				}	//else 없으면 html 태그로 렌더링을 하고 out.print와 같은 자바코드 실행
 */

			%>

			<h3 style="text-align: center;">홈쇼핑 회원 수정</h3>
			<form action="6_updateSave.jsp" method="post">

				<!-- disabled 설정되어 있으면 파라미터로 값 전달 안됩니다. -->
				<input type="hidden" name="num" value="<%=member.getCustNo()%>">
				<!-- hidden 대신 다른 방법 readonly 속성
					입력불가를 표현하기 위한 css가 필요합니다.
				 -->
				<table style="width: 70%; margin: auto;">
					<tr>
						<td class="col1_title">회원번호</td>
						<td><input type="text" name="num"
							value="<%=member.getCustNo()%>" disabled></td>
						<!-- 입력요소 데이터 식별하는 속성은 name -->
					</tr>
					<tr>
						<td class="col1_title">회원성명</td>
						<td><input type="text" name="name"
							value="<%=member.getCustName()%>" disabled></td>
					</tr>
					<tr>
						<td class="col1_title">회원전화</td>
						<td><input type="text" name="tel" size="30"
							value="<%=member.getPhone()%>"></td>
					</tr>
					<tr>
						<td class="col1_title">회원주소</td>
						<td><input type="text" name="addr" size="40"
							value="<%=member.getAddress()%>"></td>
					</tr>
					<tr>
						<td class="col1_title">가입일자</td>
						<td><input type="text" name="reg_date"
							value="<%=member.getJoindate()%>" disabled></td>
					</tr>
					<tr>
						<td class="col1_title">고객등급<br>[A:VIP,B:일반,C:직원]
						</td>
						<td><input type="text" name="grade"
							value="<%=member.getGrade()%>" disabled></td>
					</tr>
					<tr>
						<td class="col1_title">도시코드</td>
						<td><input type="text" name="city_code"
							value="<%=member.getCity()%>"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<!-- <button >저장</button> -->
							<button type="button" onclick="isSubmit()">저장</button>
							<button type="reset">다시쓰기</button> <!-- button로 링크 또는 기능 설정하기
                       onclick 이벤트와 자바스크립트 명령을 이용합니다.
                       locatio.href 는 a태그의 href속성설정과 같은 내용입니다.
                       -->
						</td>
					</tr>

				</table>
			</form>

		</section>
		<footer> HRDKOREA Copyright&copy;2016 All rights reserved.
			Human Resources Development Service of Korea </footer>
	</div>
</body>
</html>