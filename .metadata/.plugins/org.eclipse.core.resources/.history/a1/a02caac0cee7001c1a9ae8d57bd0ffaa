package Quiz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Quiz_02")
public class Quiz_02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String s_id = "green";
		String s_pw = "1234";
		
		String u_id = request.getParameter("u_id");
		String u_pw = request.getParameter("u_pw");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		
		if(s_id.equals(u_id) && s_pw.equals(u_pw)) {			
			out.println("로그인 성공");
		} else {
			out.println("로그인 실패");
		}
		
		out.println("</body></html>");
	}

}
