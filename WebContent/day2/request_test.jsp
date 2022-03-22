<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form_test.html에서 사용자가 데이터 입력 후 submit 실행하면 url : 
		form_test.html?data1=123&data2=abcd 
		?data1=123&data2=abcd 은 query string이라고 합니다.
		data1, data2는 사용자 입력 파라미터
		request_test.jsp 에서는 위의 데이터를 전달 받습니다.
		-->
	<%
		//request는 jsp의 객체입니다.(내장객체:선언하지 않고 자동으로 쓸 수 있는 객체)	
		//request 객체의 타입은? HttpServletRequest 클래스
	
		String data1 = request.getParameter("data1");
		String data2 = request.getParameter("data2");
		String data3 = request.getParameter("data3");	//null
		
		out.print("사용자 입력값 출력 테스트");
		out.print("<br>data1=");
		out.print(data1);
		out.print("<br>data2=");
		out.print(data2);
		out.print("<br>data3=");
		out.print(data3);	/* form_test.html 입력 요소 중에 name이 'data3'이 없습니다. null */
		
		//만약에 data1, data2를 덧셈 등 연산을 해야한다면 -> 정수로 변환
		int num1 = Integer.parseInt(data1);
		int num2 = Integer.parseInt(data2); //사용자 입력이 숫자가 아닌 문자가 포함되면 오류
		int num3 = Integer.parseInt(data3); //java.lang.NumberFormatException : null
		out.print("<br>data1+data2=");
		out.print(num1+num2);
		/* 결론 : 사용자 입력 오류를 제거하기 위해
					1) 프론트단에서 자바스크립트로 유효성 검사하기
					2) 서버단에서 try~catch로 처리하기 */
		%>
</body>
</html>