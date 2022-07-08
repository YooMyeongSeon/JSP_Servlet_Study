package board.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import board.dao.BoardDao;

@WebServlet("/CDS")
public class CommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String getIdx = request.getParameter("idx");
		
		JsonParser parser = new JsonParser();
		JsonElement data = parser.parse(getIdx);
		
		int idx = data.getAsJsonObject().get("idx").getAsInt();
		
		BoardDao dao = BoardDao.getInstance();
		dao.commentDelete(idx);
	}
}