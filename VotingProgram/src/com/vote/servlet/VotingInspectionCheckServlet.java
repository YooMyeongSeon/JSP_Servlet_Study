package com.vote.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vote.dao.VoteDao;
import com.vote.vo.VoteVo;

@WebServlet("/VICS")
public class VotingInspectionCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //투표검수조회 항목들을 받아와 이동
		String url = "/Web03_VotingInspactionCheckServlet.jsp";
		
		VoteDao dao = VoteDao.getInstance();
		List<VoteVo> list = dao.selectVote();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher(url).forward(request, response);
	}
}