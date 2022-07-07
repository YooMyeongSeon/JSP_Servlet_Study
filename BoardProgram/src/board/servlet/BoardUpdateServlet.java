package board.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.vo.BoardVo;

@WebServlet("/BUS")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		BoardDao dao = BoardDao.getInstance();
		BoardVo bVo = dao.boardByIdx(idx);
		
		request.setAttribute("bVo", bVo);
		request.getRequestDispatcher("/Board/BoardUpdateForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BoardVo bVo = new BoardVo();
		
		bVo.setIdx(Integer.parseInt(request.getParameter("idx")));
		bVo.setWriter(request.getParameter("writer"));
		bVo.setSubject(request.getParameter("subject"));
		bVo.setContent(request.getParameter("content"));
		
		BoardDao dao = BoardDao.getInstance();
		dao.boardUpdate(bVo);
		
		response.sendRedirect("BVS?idx="+request.getParameter("idx"));
	}
}