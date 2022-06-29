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
import com.vote.vo.VoteVo;

@WebServlet("/VS")
public class VotingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //후보자 목록을 받아와 투표하기 폼으로 이동
		String url = "/Web02_Voting.jsp";
		
		VoteDao dao = VoteDao.getInstance();
		List<MemberVO> list = dao.selectMember();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //받아온 투표 항목을 데이터베이스에 저장
		request.setCharacterEncoding("UTF-8");
		VoteVo vVo = new VoteVo();
		
		vVo.setV_Jumin(request.getParameter("v_Jumin"));
		vVo.setV_Name(request.getParameter("v_Name"));
		vVo.setM_No(Integer.parseInt(request.getParameter("m_No")));
		vVo.setV_Time(request.getParameter("v_Time"));
		vVo.setV_Area(request.getParameter("v_Area"));
		vVo.setV_Confirm(request.getParameter("v_Confirm"));
		
		VoteDao dao = VoteDao.getInstance();
		dao.addVote(vVo);
		
		System.out.println(vVo.getV_Name());
		response.sendRedirect("index.jsp");
	}
}