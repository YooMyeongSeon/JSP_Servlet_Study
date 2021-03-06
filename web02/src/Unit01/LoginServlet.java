package Unit01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LS")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>GET 방식으로 호출</h1>");
		
		String userid = request.getParameter("userid"); //모든 데이터는 예외없이 문자열로 전송됨
		String name = request.getParameter("name");
		
		//체크박스등의 다수의 데이터가 하나의 이름으로 넘어올때는 배열로 처리한다.
		String[] hobbys = request.getParameterValues("hobby");
		
		System.out.println("입력된 아이디 : " + userid);
		System.out.println("입력된 이름 : " + name);
		System.out.print("입력된 취미 : ");
		for(String hobby:hobbys) {
			System.out.print(hobby + ", ");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>POST 방식으로 호출</h1>");

		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String name = request.getParameter("name");
		
		String[] hobbys = request.getParameterValues("hobby");
		
		System.out.println("입력된 아이디 : " + userid);
		System.out.println("입력된 이름 : " + name);
		System.out.print("입력된 취미 : ");
		for(String hobby:hobbys) {
			System.out.print(hobby + ", ");
		}
	}
}