package servlets;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bdd.Everything;
import beans.Evenement;

/**
 * Servlet implementation class AddEvenement
 */
@WebServlet("/AddEvenement")
public class AddEvenement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEvenement() {
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
		String lol = request.getParameter("datedebut") ; 
		String lol1 = request.getParameter("datefin") ;
		String lol2 = lol.replace("T", " ") ; 
		String lol3 = lol1.replace("T", " ") ; 
		System.out.println(lol2) ; 
		System.out.println(lol3) ; 
		String image = request.getParameter("image") ; 
		//String image2 = image.substring(image.lastIndexOf("\\"));  
		//image2.trim(); 
		Evenement evenement = new Evenement(); 
		evenement.setTitre(request.getParameter("titre")) ; 
		evenement.setDescription(request.getParameter("description"));
		evenement.setType(request.getParameter("type"));
		evenement.setActivites(request.getParameter("activites"));
		evenement.setDateDebut(lol2);
		evenement.setDateFin(lol3);
		evenement.setImage(image);
		Everything sheep = new Everything() ;
		int club_id = Integer.parseInt(request.getParameter("club_id")) ; 
		int gerant_id = Integer.parseInt(request.getParameter("gerant_id")) ; 
		String nom = (String)request.getParameter("nom"); 
		
		HttpSession session = request.getSession() ;
		String ecole_nom = (String)session.getAttribute("ecole") ;
		int ecole_id = (int)session.getAttribute("ecole_id") ; 
		if (request.getParameter("act").equals("add")) {
			sheep.addEvenement(evenement, club_id, ecole_nom, ecole_id) ;
			response.sendRedirect("/ProjetS3/GestionClub?club_id=" + club_id + "&gerant_id=" + gerant_id + "&nom="+ nom);


		}
		else if(request.getParameter("act").equals("mod")) {
			int evenement_id = Integer.parseInt(request.getParameter("evenement_id")) ; 
			sheep.modEvenement(evenement, club_id, ecole_nom, ecole_id, evenement_id) ;
			System.out.println(evenement.getDescription()) ; 
			response.sendRedirect("/ProjetS3/GestionClub?club_id=" + club_id + "&gerant_id=" + gerant_id + "&nom="+ nom);
		}
			
	}

}
