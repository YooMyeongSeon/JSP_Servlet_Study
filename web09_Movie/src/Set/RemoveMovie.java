package Set;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RM")
public class RemoveMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int code = Integer.parseInt(request.getParameter("code"));
		
		Movie_DAO dao = Movie_DAO.getInstance();
		dao.ReMovie(code);
		
		response.sendRedirect("index.jsp");
	}
}
