package Set;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AM")
public class AddMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Movie movie = new Movie();
		movie.setCode(Integer.parseInt(request.getParameter("code")));
		movie.setMname(request.getParameter("mname"));
		movie.setDirector(request.getParameter("director"));
		movie.setMain(request.getParameter("main"));
		movie.setPrice(Integer.parseInt(request.getParameter("price")));
		
		Movie_DAO dao = Movie_DAO.getInstance();
		dao.AddMovie(movie);
		
		response.sendRedirect("index.jsp");
	}
}
