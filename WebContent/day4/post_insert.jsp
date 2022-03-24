<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day4 post 요청 처리</title>
<style type="text/css">
td,th{
    border: 1px dotted gray;
}
td.col1_title {
    text-align: center;
    font-weight: bold;
    width: 40%;
    padding: 7px;
}
input[type=text]{
    padding: 5px;
    margin-left: 10px;
}
button {
    padding: 5px 15px;
    margin: 5px;
}
</style>
<!-- src 속성에 지정한 자바스크립트 소스가 그대로 삽입됩니다. -->
<script src="member_valid.js"></script>
<script type="text/javascript">
		function isSubmit(){			
			const frm = document.forms[0];
			if(valid_check()){				//유효성 검사 통과
				frm.submit();
		}

	}
</script>
</head>
<body>
<%
	HrdMemberDao dao = HrdMemberDao.getInstance();
	int next = dao.getNextSeq();	
	
	LocalDate today = LocalDate.now();	//현재 시간 가져오기
	String str_today = today.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
	//특정 패턴 문자열로 변환, reg_date input요소의 value
	
%>
	<h4 style="text-align: center;">홈쇼핑 회원 등록</h4>
       <form action="member_insert.jsp" method="post"> 
       		<input type ="hidden" name="num" value="<%=next %>"> 
           <table style="width:70%;margin:auto;">
               <tr>
                   <td class="col1_title">회원번호</td>
                   <td><input type="text" name="num" value="<%=next %>" disabled></td>  <!-- 입력요소 데이터 식별하는 속성은 name -->
               </tr>
               <tr>
                   <td class="col1_title">회원성명</td>
                   <td><input type="text" name="name" ></td>
               </tr>  
               <tr>
                   <td class="col1_title">회원전화</td>
                   <td><input type="text" name="tel" size="30" ></td>
               </tr> 
               <tr>
                   <td class="col1_title">회원주소</td>
                   <td><input type="text" name="addr" size="40" ></td>
               </tr>
			<tr>
                   <td class="col1_title">가입일자</td>
                   <td><input type="text" name="reg_date" disabled></td>
               </tr>  
               <tr>
                   <td class="col1_title">고객등급<br>[A:VIP,B:일반,C:직원]</td>
                   <td><input type="text" name="grade"></td>
               </tr>  
               <tr>
                   <td class="col1_title">도시코드</td>
                   <td><input type="text" name="city_code"></td>
               </tr>
               <tr>
                   <td colspan="2" style="text-align: center;">
                       <!-- <button >저장</button> -->
                       <button type="button" onclick="isSubmit()">등록</button>
                       <button type="button" onclick="init()">다시쓰기</button>
                       <!-- <button type="reset">다시쓰기</button> -->
                       <!-- button로 링크 또는 기능 설정하기
                       onclick 이벤트와 자바스크립트 명령을 이용합니다.
                       locatio.href 는 a태그의 href속성설정과 같은 내용입니다.
                       -->
                   </td>
               </tr>

           </table>
       </form>
	<script type="text/javascript">
		const reg = document.forms[0].reg_date;
		const today = new Date();
		const year = today.getFullYear();
		const month = (today.getMonth()+1).toString().padStart(2,0);
		const day = today.getDate().toString().padStart(2,0);
		reg.value=[year,month,day].join('');
		
		function init(){
			const frm = document.forms[0];
			frm.name.value="";
			frm.tel.value="";
			frm.addr.value="";
			frm.grade.value="";
			frm.city_code.value="";
		}

	</script>
</body>
</html>