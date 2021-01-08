package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bdd.Everything;
import beans.Eleve;

/**
 * Servlet implementation class GestionEleve
 */
@WebServlet("/GestionEleve")
public class GestionEleve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionEleve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession() ; 
	    Everything ev = new Everything() ; 
	    int id = (int)session.getAttribute("id") ; 
	    int ecole_id = (int)session.getAttribute("ecole_id") ; 
	    
	    if(id != 1) {
	    	response.sendRedirect("/ProjetS3/Acceuil");
	    }
	    
	    else {
	    	List<Eleve> eleves = ev.getAllEleves() ; 
	    	request.setAttribute("eleves", eleves) ; 
	    	this.getServletContext().getRequestDispatcher("/WEB-INF/GestionEleves.jsp").forward(request, response); ; 
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Everything ev = new Everything() ;
		int id = Integer.parseInt(request.getParameter("eleve_id")) ;
		if(request.getParameter("act").equals("ban")) {
			ev.ban(id);
		}
		else if(request.getParameter("act").equals("deban")) {
			ev.unban(id);
		}
		
		response.sendRedirect("/ProjetS3/GestionEleve");
	}

}
