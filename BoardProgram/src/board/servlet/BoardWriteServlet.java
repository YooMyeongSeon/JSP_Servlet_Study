package board.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.vo.BoardVo;

@WebServlet("/BWS")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/Board/BoardWriteForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BoardVo bVo = new BoardVo();
		
		bVo.setWriter(request.getParameter("writer"));
		bVo.setSubject(request.getParameter("subject"));
		bVo.setContent(request.getParameter("content"));
		
		BoardDao dao = BoardDao.getInstance();
		dao.boardWrite(bVo);
		
		response.sendRedirect("BLS");
	}
}