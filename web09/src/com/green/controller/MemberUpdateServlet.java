package com.green.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.DAO.Member_DAO;
import com.green.VO.Member_Vo;

@WebServlet("/MUS")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		//세션에 저장된 정보를 활용
		Member_DAO dao = Member_DAO.getInstance();
		Member_Vo mVo = dao.getMember(userId);
		
		request.setAttribute("mVo", mVo);
		
		request.getRequestDispatcher("member/memberUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int admin = Integer.parseInt(request.getParameter("admin"));
		
		Member_Vo mVo = new Member_Vo();
		mVo.setUserId(userId);
		mVo.setUserPw(userPw);
		mVo.setEmail(email);
		mVo.setPhone(phone);
		mVo.setAdmin(admin);
		
		Member_DAO dao = Member_DAO.getInstance();
		dao.updateMember(mVo);
		
		response.sendRedirect("LS");
	}
}