package com.green.board.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.board.dao.Board_Dao;
import com.green.board.vo.Board_Vo;

public class BoardListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String url = "/Board/BoardList.jsp";
//		
//		Board_Dao dao = Board_Dao.getInstance();
//		List<Board_Vo> boardList = dao.selectAllBoards();
//		
//		request.setAttribute("boardList", boardList);
//		request.getRequestDispatcher(url).forward(request, response);
		String url = "/Board/BoardList.jsp";
		
		String _section = request.getParameter("section");
		String _page = request.getParameter("page");
		
		int section = Integer.parseInt((_section == null)?"1":_section);
		int page = Integer.parseInt((_page == null)?"1":_page);
		
		Board_Dao dao = Board_Dao.getInstance();
		List<Board_Vo> boardList = dao.selectTargetBoard(section, page);
		int totalCnt = dao.selectAllBoardNumber();
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("section", section);
		request.setAttribute("pageNum", page);
		request.getRequestDispatcher(url).forward(request, response);
	}	
}