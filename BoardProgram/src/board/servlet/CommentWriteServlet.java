package board.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import board.vo.commentVo;

@WebServlet("/CWS")
public class CommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String getComment = request.getParameter("comment");
		
		JsonParser parser = new JsonParser();
		JsonElement data = parser.parse(getComment);
		
		commentVo cVo = new commentVo();
		
		cVo.setBidx(10);
		cVo.setWriter(data.getAsJsonObject().get("writer").getAsString());
		cVo.setContent(data.getAsJsonObject().get("content").getAsString());
		
		Gson gson = new Gson();
		
		String commentJson = gson.toJson(cVo);
		PrintWriter out = response.getWriter();
		out.print(commentJson);
	}
}