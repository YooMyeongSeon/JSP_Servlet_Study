package com.green.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.green.DAO.Member_DAO;
import com.green.VO.Member_Vo;

@WebServlet("/LS")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//폼 페이지로 연결할 때 사용
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/Login.jsp";
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("loginUser") != null) {
			url = "Main.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	//입력받은 데이터를 처리할 때 사용
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String url = "member/Login.jsp";
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		//로그인 인증처리
		Member_DAO dao = Member_DAO.getInstance();
		
		int result = dao.userCheck(userId, userPw);
		
		if (result == 1) { //로그인 성공
			Member_Vo mVo = dao.getMember(userId);
			 
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mVo);
			
			request.setAttribute("msg", "로그인 성공");
			url = "Main.jsp";
		} else if (result == 0) { //비밀번호가 틀린 경우
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
		} else if (result == -1) { //아이디가 없는 경우
			request.setAttribute("msg", "존재하지 않는 회원입니다.");
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}