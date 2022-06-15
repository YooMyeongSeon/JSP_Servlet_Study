<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.green.beans.Member"%> <%-- 자바빈 사용(패키지명을 앞에 입력) --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈</title>
</head>
<body>
	<%
		//자바빈 객체를 생성(패키지를 임포트 하지 않았을 경우)
		com.green.beans.Member m1 = new com.green.beans.Member();
	
		//자바빈 객체에 데이터 저장
		m1.setName("홍길동");
		m1.setUserId("hong");
		
		request.setAttribute("member1", m1); //데이터의 덩어리를 자바빈에 담아서 한번에 전송
		request.getRequestDispatcher("Ex_01_result.jsp").forward(request, response);
		
		//패키지를 임포트해서 처리
		Member m2 = new Member();
	%>
	<jsp:useBean id="m3" class="com.green.beans.Member" scope="request"/> <%--액션 태그로 자바빈 생성--%>
	<%--
		com.green.beans.Member m3 = new com.green.beans.Member();
		request.setAttribute("m3", m3); 의 내용과 같은 기능
	--%>
</body>
</html>