<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//저장된 데이터
	String s_id = "pink";
	String s_pw = "pong";
	String s_name = "아기상어";
%>
<%
	//입력된 데이터
	String u_id = request.getParameter("userId");
	String u_pw = request.getParameter("userPw");
	
	if (s_id.equals(u_id) && s_pw.equals(u_pw)) { //로그인 성공 : 로그인 정보를 세션에 저장
		session.setAttribute("name", s_name);
		session.setAttribute("id", s_id);
		response.sendRedirect("Ex_04_Main.jsp");
	} else { //로그인 실패 : 로그인폼으로 돌아감
		response.sendRedirect("Ex_04_LoginForm.jsp");
	}
%>