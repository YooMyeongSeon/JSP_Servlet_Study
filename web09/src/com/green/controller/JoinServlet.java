package com.green.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.DAO.Member_DAO;
import com.green.VO.Member_Vo;

@WebServlet("/JS")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("member/Join.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//입력된 정보를 통해서 회원가입 진행
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int admin = Integer.parseInt(request.getParameter("admin"));
		
		Member_DAO dao = Member_DAO.getInstance();
		
		Member_Vo mVo = new Member_Vo();
		mVo.setName(name);
		mVo.setUserId(userId);
		mVo.setUserPw(userPw);
		mVo.setEmail(email);
		mVo.setPhone(phone);
		mVo.setAdmin(admin);
		
		int result = dao.insertMember(mVo);
		
		if (result == 1) {
			request.setAttribute("userId", userId);
			request.setAttribute("msg", "회원 가입에 성공했습니다.");
		} else {
			request.setAttribute("msg", "회원 가입에 실패했습니다.");
		}
		request.getRequestDispatcher("member/Login.jsp").forward(request, response);
	}
}