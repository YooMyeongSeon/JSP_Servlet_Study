<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%! //이미 저장된 아이디와 비밀번호
	String s_id = "green";
	String s_pwd = "1234";
	String s_name = "유명선";
%>
<% //입력받은 아이디와 비밀번호를 확인
	String u_id = request.getParameter("userId");
	String u_pwd = request.getParameter("userPassword");
	
	if(s_id.equals(u_id) && s_pwd.equals(u_pwd)) { //로그인 성공
		//response.sendRedirect("Ex_04_Main.jsp?name="+URLEncoder.encode(s_name,"UTF-8")); //변수를 main으로 이동
		
		request.setAttribute("name", s_name);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Ex_04_Main.jsp");
		dispatcher.forward(request, response);
		
	} else { //로그인 실패
		response.sendRedirect("Ex_04_LoginFail.jsp");
	}
%>