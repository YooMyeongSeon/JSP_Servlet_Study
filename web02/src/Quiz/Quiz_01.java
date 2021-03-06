package Quiz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Quiz_01")
public class Quiz_01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ko_score = Integer.parseInt(request.getParameter("ko_score"));
		int en_score = Integer.parseInt(request.getParameter("en_score"));
		int ma_score = Integer.parseInt(request.getParameter("ma_score"));
		
		int sum = ko_score + en_score + ma_score;
		int avg = sum / 3;
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("입력된 점수의 총점 : " + sum + "<br>");
		out.println("입력된 점수의 평균 : " + avg);
		out.println("</body></html>");
	}
}