package com.vote.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vote.dao.VoteDao;
import com.vote.vo.RankVo;

@WebServlet("/MRS")
public class MemberRankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VoteDao dao = VoteDao.getInstance();
		List<RankVo> list = dao.getVoteRanking();
		
		request.setAttribute("rankList", list);
		
		request.getRequestDispatcher("/Web04_MemberRanking.jsp").forward(request, response);
	}
}