package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bdd.Ecoles;
import bdd.Everything;

/**
 * Servlet implementation class DeleteEcole
 */
@WebServlet("/DeleteEcole")
public class DeleteEcole extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEcole() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Ecoles ec = new Ecoles() ; 
		String ecole_id1 = request.getParameter("ecole_id") ; 
		int ecole_id = Integer.parseInt(ecole_id1) ;
		ec.DeleteById(ecole_id);
		response.sendRedirect("/ProjetS3/Ecoles");
		
		
	}

}
