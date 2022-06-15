<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.green.beans.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈과 액션 태그</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%-- 1. 자바빈 생성 ----------------------------------------------------%>
		<%-- 1)스크립트릿으로 자바빈 생성 --%>
			<%
				Member m1 = new Member();
				session.setAttribute("m1", m1);
			%>
		<%-- 2)액션 태그로 자바빈 생성 --%>
			<jsp:useBean id="m2" class="com.green.beans.Member" scope="session"/>
			
	<%-- 2. 데이터 입력 ----------------------------------------------------%>
		<%-- 1)스크립트릿으로 데이터 입력(변수 활용) --%>
			<%
				String name = request.getParameter("name");
				String userId = request.getParameter("userId");
				String nickname = request.getParameter("nickname");
				String userPw = request.getParameter("userPw");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				m1.setName(name);
				m1.setUserId(userId);
				m1.setNickname(nickname);
				m1.setUserPw(userPw);
				m1.setEmail(email);
				m1.setPhone(phone);
			%>
		<%-- 2)스크립트릿으로 데이터 입력(직접 입력) --%>
			<%
				m2.setName(request.getParameter("name"));
				m2.setUserId(request.getParameter("userId"));
				m2.setNickname(request.getParameter("nickname"));
				m2.setUserPw(request.getParameter("userPw"));
				m2.setEmail(request.getParameter("email"));
				m2.setPhone(request.getParameter("phone"));
			%>
		<%-- 3)액션 태그로 데이터 입력(리퀘스트 객체를 통해 데이터 입력) --%>
			<jsp:setProperty name="m1" property="name" value='<%=request.getParameter("name")%>'/>
			<jsp:setProperty name="m1" property="userId" value='<%=request.getParameter("userId")%>'/>
			<jsp:setProperty name="m1" property="nickname" value='<%=request.getParameter("nickname")%>'/>
			<jsp:setProperty name="m1" property="userPw" value='<%=request.getParameter("userPw")%>'/>
			<jsp:setProperty name="m1" property="email" value='<%=request.getParameter("email")%>'/>
			<jsp:setProperty name="m1" property="phone" value='<%=request.getParameter("phone")%>'/>
		<%-- 4)액션 태그로 데이터 입력(리퀘스트 객체 없이 데이터 입력) --%>
			<jsp:setProperty name="m2" property="name"/>
			<jsp:setProperty name="m2" property="userId"/>
			<jsp:setProperty name="m2" property="nickname"/>
			<jsp:setProperty name="m2" property="userPw"/>
			<jsp:setProperty name="m2" property="email"/>
			<jsp:setProperty name="m2" property="phone"/>
		<%-- 5)액션 태그로 데이터 입력(한 번에 입력) --%>
			<jsp:setProperty name="m2" property="*"/>
			
	<%-- 3. 데이터 출력 ----------------------------------------------------%>
		<h1>입력된 회원 정보 출력</h1>
		<%-- 1)스크립트릿으로 데이터 출력 --%>
			이름 : <%=m1.getName()%><br>
			닉네임 : <%=m1.getNickname()%><br>
			아이디 : <%=m1.getUserId()%><br>
			비밀번호 : <%=m1.getUserPw()%><br>
			이메일 : <%=m1.getEmail()%><br>
			전화번호 : <%=m1.getPhone()%><hr>
		<%-- 2)액션 태그로 데이터 입력(리퀘스트 객체를 통해 데이터 입력) --%>
			이름 : <jsp:getProperty name="m2" property="name"/><br>
			닉네임 : <jsp:getProperty name="m2" property="nickname"/><br>
			아이디 : <jsp:getProperty name="m2" property="userId"/><br>
			비밀번호 : <jsp:getProperty name="m2" property="userPw"/><br>
			이메일 : <jsp:getProperty name="m2" property="email"/><br>
			전화번호 : <jsp:getProperty name="m2" property="phone"/>
</body>
</html>