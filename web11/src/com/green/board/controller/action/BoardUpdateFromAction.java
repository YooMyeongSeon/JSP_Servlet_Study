package com.green.board.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.board.dao.Board_Dao;
import com.green.board.vo.Board_Vo;

public class BoardUpdateFromAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/Board/BoardUpdateForm.jsp";
		int num = Integer.parseInt(request.getParameter("num"));
		
		Board_Dao dao = Board_Dao.getInstance();
		Board_Vo bVo = dao.selectBoardByNum(num);
		
		request.setAttribute("bVo", bVo);
		request.getRequestDispatcher(url).forward(request, response);
	}
}