package board.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.vo.BoardVo;
import board.vo.commentVo;

@WebServlet("/BVS")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		BoardDao dao = BoardDao.getInstance();
		BoardVo bVo = dao.boardByIdx(idx);
		List<commentVo> list = dao.commentList(idx);
		
		request.setAttribute("bVo", bVo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/Board/BoardView.jsp").forward(request, response);
	}
}