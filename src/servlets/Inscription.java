package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bdd.Everything;
import beans.Evenement;

/**
 * Servlet implementation class Inscription
 */
@WebServlet("/Inscription")
public class Inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inscription() {
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
		HttpSession session = request.getSession() ; 
	    Everything ev = new Everything() ; 
	    int id = (int)session.getAttribute("id") ; 
	    int evenement_id = Integer.parseInt(request.getParameter("evenement_id")) ;
	    Evenement evenement = ev.getEvenement(evenement_id, id) ; 
	    if (request.getParameter("act").equals("add")) {
	    	ev.addIncription(id, evenement_id);
	    }
	    else if(request.getParameter("act").equals("remove")) {
	    	ev.RemoveInscription(id, evenement_id);
	    }
	    
	    if (request.getParameter("loc").equals("evenements")) {
	    	response.sendRedirect("/ProjetS3/Evenements");
	
	    }else if (request.getParameter("loc").equals("interface")){
	    	response.sendRedirect("/ProjetS3/Homepage") ; 
	    }else if (request.getParameter("loc").equals("club")) {
	    	response.sendRedirect("/ProjetS3/GestionClub?club_id=" + evenement.getClub().getId() + "&gerant_id=" + evenement.getClub() + "&nom="+ evenement.getClub().getNom()) ;
	    }else if(request.getParameter("loc").equals("evenement")) {
	    	response.sendRedirect("/ProjetS3/OneEvenement?evenement_id=" + evenement.getId());
	    }
	    
	}

}
