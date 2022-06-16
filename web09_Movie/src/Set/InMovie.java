package Set;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/IM")
public class InMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Movie movie = new Movie();
		
		String mname = request.getParameter("mname");
		
		Movie_DAO dao = Movie_DAO.getInstance();
		movie = dao.getInMovie(mname);

		request.setAttribute("movie", movie);
		request.getRequestDispatcher("InMovie.jsp").forward(request, response);
	}
}
