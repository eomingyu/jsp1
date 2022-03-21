<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	<!-- 1) page 지시자 : 스크립트릿 실행과 관련된 정보를 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day1_jsp start</title>
</head>
<body>
	<ul>
<%
	//2) 스크립트릿 : html 문서 안에서 자바코드가 작성되는 부분
	//				출력 내용을 제어(for,while,list,if...)하기 위한 자바 명령 작성
	String[] names = {"박세리","허재","김연경","안정환"};
	for(int i=0;i<names.length;i++){
			//태그를 출력하면 html 문서에는 렌더링 결과로 표시
%>
	<!-- HTML 태그를 작성할 수 있습니다. -->
	<!-- 3) 표현식 : 데이터를 html 문서에 출력(변수,수식결과,메소드리턴값..) -->
	<li><%= names[i] %></li>	<!-- li태그요소가 for 반복횟수 만큼 생성. -->
	
<%
	}	//for 종료
%>
	</ul>

<!-- JSP 파일에 사용되는 기호 : 지시자, 스크립트릿(scriptlet), 표현식(변수,계산식,메소드 등 결과값을 구하는 명령문)
							등 3가지를 기억합시다.
 -->
</body>
</html>