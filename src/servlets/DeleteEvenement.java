package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bdd.Everything;

/**
 * Servlet implementation class DeleteEvenement
 */
@WebServlet("/DeleteEvenement")
public class DeleteEvenement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEvenement() {
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
		Everything ev = new Everything() ; 
		int club_id = Integer.parseInt(request.getParameter("club_id")) ; 
		int gerant_id = Integer.parseInt(request.getParameter("gerant_id")) ; 
		String nom = (String)request.getParameter("nom"); 
		ev.deleteEvenement(Integer.parseInt(request.getParameter("evenement_id"))) ; 
		response.sendRedirect("/ProjetS3/GestionClub?club_id=" + club_id + "&gerant_id=" + gerant_id + "&nom="+ nom);
		
	}

}
