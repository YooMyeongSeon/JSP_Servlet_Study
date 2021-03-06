package Quiz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Quiz_03")
public class Quiz_03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		double result = Double.parseDouble(request.getParameter("result"));
		String corona;
		
		if (result < 37.5) {
			corona = "음성";
		} else {
			int random = (int)(Math.random()*100);
			if (random < 19) {
				corona = "음성";
			} else {
				corona = "양성";
			}
		}
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println(name + "님, 코로나 '" + corona + "' 입니다.<br>");
		out.println("</body></html>");
	}
}