package com.vote.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vote.dao.VoteDao;
import com.vote.vo.MemberVO;

@WebServlet("/MLS")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //투표검수조회 기능
		VoteDao dao = VoteDao.getInstance();
		List<MemberVO> list = dao.selectMember();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/Web01_MemberList.jsp").forward(request, response);
	}
}