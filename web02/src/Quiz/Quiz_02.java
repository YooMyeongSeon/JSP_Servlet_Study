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
		String dan = request.getParameter("dan");
		int dan_i = 0;
		
		if (dan.equals("dan2")) {
			dan_i = 2;
		} else if (dan.equals("dan3")) {
			dan_i = 3;
		} else if (dan.equals("dan4")) {
			dan_i = 4;
		} else if (dan.equals("dan5")) {
			dan_i = 5;
		} else if (dan.equals("dan6")) {
			dan_i = 6;
		} else if (dan.equals("dan7")) {
			dan_i = 7;
		} else if (dan.equals("dan8")) {
			dan_i = 8;
		} else {
			dan_i = 9;
		}
		
		PrintWriter out = response.getWriter();
		
		out.println("<html><head><style>table, tr, td {border: 1px solid black; border-collapse: collapse;</style></head><body>");
		out.println("<table>");
		for (int i=1; i<=9; i++) {
			out.println("<tr><td>" + dan_i + " x " + i + " = " + dan_i*i + "</td></tr>");
		}
		out.println("</table>");
		out.println("</body></html>");
	}
}