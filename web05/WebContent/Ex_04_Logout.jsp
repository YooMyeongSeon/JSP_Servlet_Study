<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션의 정보를 삭제
	session.removeAttribute("name");
	session.removeAttribute("id");

	//세션의 정보를 한 번에 삭제
	session.invalidate();
%>
<script>
	alert('정상적으로 로그아웃 되었습니다.');
	location.href="Ex_04_LoginForm.jsp";
	

</script>