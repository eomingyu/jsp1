<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- post_test.html 에서 사용자가 데이터 입력 후 sybmit 실행하면 url:
		 http://localhost:8081/jsp1/day3/request_test.jsp
		 query string이 없습니다.(개발자도구 F12 - 네트워크 탭 - ctrl+r - url 선택 - payload - form data)
		
		form 태그에서 method 설정 없으면 기본이 'get' : 쿼리 스트링으로 입력값 전달(데이터 조회할 때 사용)
											사용자 요청의 url 인코딩은 기본이 UTF-8
											url에 사용자 입력값이 보입니다.
											form 태그 사용 외에도 a태그 href 속성값에 url로 작성 가능
					method='post'로 하면 : form data로 입력값 전달(데이터 저장)
										이때 form data 인코딩은 직접 설정이 필요합니다.
										request.setCharacterEncoding("UTF-8");
										url에 사용자 입력값이 없습니다.
				day2의 memberReg.html의 method는 'post'로 합니다.
				
				*get과 post 방식의 주요한 차이는
				-보낼 수 있는 데이터의 크기 제한이 다릅니다. get은 글자수 2000자 정도(브라우저 마다 다름)
				  post는 2mb 정도
				-get으로 보낸 요청은 캐시됩니다.
		-->
	<%
		request.setCharacterEncoding("UTF-8");		//method="post"는 꼭 필요
	
		String data1 = request.getParameter("data1");
		String data2 = request.getParameter("data2");
		String data3 = request.getParameter("data3");	//null
		
		out.print("사용자 입력값 출력 테스트");
		out.print("<br>data1=");
		out.print(data1);
		out.print("<br>data2=");
		out.print(data2);
		out.print("<br>data3=");
		out.print(data3);	/* post_test.html 입력 요소 중에 name이 'data3'이 없습니다. null */
		
		
		%>
</body>
</html>