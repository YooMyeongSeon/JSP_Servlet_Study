package Unit01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HS")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int num = 1;
	
	@Override
	public void init() throws ServletException {
		//서블릿이 인스턴스화 될 경우 호출되는 생성자 메서드
		 System.out.println("서블릿 인스턴스화 완료");
	}

	@Override
	public void destroy() {
		//서블릿의 인스턴스가 메모리상에서 사라질 때 호출되는 메서드
		 System.out.println("서블릿 인스턴스화 삭제");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트에서 응답할 페이지 정보를 셋팅
		response.setContentType("text/html; charset=UTF-8"); //응답할 페이지의 기본 환경설정(응답방식, 인코딩방식)
		
		//호출이 발생할 때 마다 카운트되는 메서드
		System.out.println((num++)+"번째 호출");
		
		PrintWriter out = response.getWriter(); //출력 스트림
		out.println("<html><body>");
		out.println("<h1>Hello World!</h1>");
		out.println("</body></html>");
	}
}
