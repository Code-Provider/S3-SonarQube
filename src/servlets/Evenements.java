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
import beans.Evenement;

/**
 * Servlet implementation class Evenements
 */
@WebServlet("/Evenements")
public class Evenements extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Evenements() {
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
	    List<Evenement> evenements = ev.getEvenements(ecole_id, id) ;
	    List<ArrayList<Evenement>> ListOList = new ArrayList<ArrayList<Evenement>>();
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
	    //System.out.println(ListOList.get(0).get(0).getTitre()) ;
	    this.getServletContext().getRequestDispatcher("/WEB-INF/Evenements.jsp").forward(request, response); 
	    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
