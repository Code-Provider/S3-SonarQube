package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bdd.Ecoles;
import beans.Ecole;

/**
 * Servlet implementation class EcolesConcernes
 */
@WebServlet("/EcolesConcernes")
public class EcolesConcernes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EcolesConcernes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Ecoles ecoles = new Ecoles() ; 
		List<ArrayList<Ecole>> ListOList = new ArrayList<ArrayList<Ecole>>();
		List<Ecole> BigList = ecoles.getEcoles();
		int count = (int) Math.ceil(BigList.size()/3.0) ;
		int size = BigList.size() ; 
		int k = 0 ; 
		for (int i = 0 ; i < count ; i++) {
			ArrayList<Ecole> SmallList = new ArrayList<Ecole>() ;  
			for (int j = k + 0 ; j < k + Math.min(Math.max(size,0), 3) ; j++) {

				SmallList.add(BigList.get(j)) ;
			}
			
			k = k + 3 ;
			size = size - 3 ; 
			ListOList.add(SmallList) ; 
		}
		
		request.setAttribute("ecoles", ListOList);
		this.getServletContext().getRequestDispatcher("/WEB-INF/Acceuil.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
