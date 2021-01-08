package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bdd.Everything;
import beans.Ecole;
import beans.Eleve;
import beans.Evenement;
import beans.Message;

/**
 * Servlet implementation class GestionClub
 */
@WebServlet("/GestionClub")
public class GestionClub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionClub() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Boolean value = false ; 
		HttpSession session = request.getSession() ; 
	    Everything sheep = new Everything() ; 
	    int id = (int)session.getAttribute("id") ; 
	    if (id == Integer.parseInt(request.getParameter("gerant_id"))) {
	    	value = true ; 
	    }
	    List<Eleve> demandes = new ArrayList<Eleve>() ; 
	    List<Eleve> membres = new ArrayList<Eleve>() ;
	    List<Message> messages = new ArrayList<Message>() ; 
	    messages = sheep.getMessages(Integer.parseInt(request.getParameter("club_id"))) ; 
	    List<ArrayList<Message>> reponses = sheep.getReponses(messages) ; 
	    Eleve gerant = sheep.getEleveById(Integer.parseInt(request.getParameter("gerant_id"))) ; 
	    demandes = sheep.getDemandesEleve(Integer.parseInt(request.getParameter("club_id"))) ;
	    membres = sheep.getMembres(Integer.parseInt(request.getParameter("club_id"))) ;
	    List<ArrayList<Evenement>> ListOList = new ArrayList<ArrayList<Evenement>>();
		List<Evenement> evenements = sheep.getEvenements(Integer.parseInt(request.getParameter("club_id"))) ;
		int count = (int) Math.ceil(evenements.size()/2.0) ;
		int size = evenements.size() ; 
		int k = 0 ; 
		for (int i = 0 ; i < count ; i++) {
			ArrayList<Evenement> SmallList = new ArrayList<Evenement>() ;  
			for (int j = k + 0 ; j < k + Math.min(Math.max(size,0), 2) ; j++) {

				SmallList.add(evenements.get(j)) ;
			}
			
			k = k + 2 ;
			size = size - 2 ; 
			ListOList.add(SmallList) ; 
		}
			
		request.setAttribute("evenements", ListOList);
	    request.setAttribute("value", value);
	    request.setAttribute("demandes", demandes);
	    request.setAttribute("club", request.getParameter("nom")) ; 
	    request.setAttribute("club_id", request.getParameter("club_id"));
	    request.setAttribute("gerant", gerant) ; 
	    request.setAttribute("membres", membres) ; 
	    request.setAttribute("messages", messages);
	    request.setAttribute("reponses", reponses);
	    /*for (ArrayList<Message> reponse : reponses) {
	    	for (Message rep : reponse) {
	    		System.out.println(rep.getContent()) ; 
	    	}
	    }*/
	    
	    
		this.getServletContext().getRequestDispatcher("/WEB-INF/GestionClub.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
