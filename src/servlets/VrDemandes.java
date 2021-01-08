package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bdd.Everything;

/**
 * Servlet implementation class VrDemandes
 */
@WebServlet("/VrDemandes")
public class VrDemandes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VrDemandes() {
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
		String value = request.getParameter("judgment") ;
		String club_id1 = request.getParameter("club_id") ;
		int club_id = Integer.parseInt(club_id1) ;
		String eleve_id1 = request.getParameter("eleve_id") ;
		int eleve_id = Integer.parseInt(eleve_id1) ;
		Everything ev = new Everything() ;
		ev.VrDemande(eleve_id, club_id, value);
		int gerant_id = Integer.parseInt(request.getParameter("gerant_id")); 
		String nom = request.getParameter("nom") ; 
		response.sendRedirect("/ProjetS3/GestionClub?club_id=" + club_id + "&gerant_id=" + gerant_id + "&nom="+ nom);
	}

}
