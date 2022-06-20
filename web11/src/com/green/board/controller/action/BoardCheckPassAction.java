package com.green.board.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.board.dao.Board_Dao;

public class BoardCheckPassAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ddd");
		System.out.println(request.getParameter("num"));
		System.out.println(request.getParameter("pw"));
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pw = request.getParameter("pw");
		String url = null;
		
		System.out.println("ddd222");
		
		Board_Dao dao = Board_Dao.getInstance();
		
		if (dao.chekPassword(num, pw)) {
			System.out.println("암호 일치");
			url = "/Board/BoardCheckSuccess.jsp";
		} else {
			System.out.println("암호 불일치");
			url = "/Board/BoardCheckPass.jsp";
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}