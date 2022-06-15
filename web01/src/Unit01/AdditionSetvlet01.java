package Unit01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdditionSetvlet01")
public class AdditionSetvlet01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num1 = 10;
		int num2 = 20;
		
		int add = num1+num2;
		
		PrintWriter out = response.getWriter(); //출력 장치
		
		out.println("<html><head><title>Addition</title></head>");
		out.println("<body>");
		out.println("<p>"+num1+" + "+num2+" = "+add+"</p>");
		out.println("</body>");
		out.println("</html>");
	}
}