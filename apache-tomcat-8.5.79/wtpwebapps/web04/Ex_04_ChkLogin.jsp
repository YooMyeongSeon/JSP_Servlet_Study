<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<%! //저장된 아이디와 비밀번호
	String s_id = "hong";
	String s_pw = "1234";
	String s_name = "홍길동";
%>
<% //입력받은 아이디와 비밀번호를 확인
	String u_id = request.getParameter("userId");
	String u_pw = request.getParameter("userPw");
	
	if(s_id.equals(u_id) && s_pw.equals(u_pw)) { //로그인 성공
		//response.sendRedirect("Ex_04_Main.jsp?name="+URLEncoder.encode(s_name,"UTF-8")); //리다이렉트 방식으로 이동
		
		request.setAttribute("name", s_name);
		request.getRequestDispatcher("Ex_04_Main.jsp").forward(request, response); //포워드 방식으로 이동
	} else { //로그인 실패
		response.sendRedirect("Ex_04_LoginFail.jsp");
	}
%>