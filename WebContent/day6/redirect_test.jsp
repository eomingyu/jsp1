<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서버 구현 부분에서 뭔가를 처리하고 난 후에 돌아갈 url은
	//1. 자바스크립트 location.href 실행하기
	//2. response 객체 메소드 사용
	
	response.sendRedirect("index.jsp");
	//response : 처리 결과를 사용자에게 전달하는 응답 객체
	//sendRedirect() 메소드 : 응답으로 새로운 요청(url)을 보냅니다.

%>