package com.green.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.DAO.Member_DAO;

@WebServlet("/ICS")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		Member_DAO dao = Member_DAO.getInstance();
		int result = dao.confirmId(userId);
		
		request.setAttribute("userId", userId);
		request.setAttribute("result", result);
		
		request.getRequestDispatcher("member/IdCheck.jsp").forward(request, response);
	}
}