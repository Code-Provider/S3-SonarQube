package bdd;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import beans.Ecole;



public class Ecoles {
	
	private Connection connexion ; 
	
	public List<Ecole> getEcoles(){
		
		List<Ecole> ecoles = new ArrayList<Ecole>() ; 
		
		loadDatabase() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT id, nom, description, image FROM ECOLE");
			
			while(result.next()) {
				int id = result.getInt("id") ; 
				String nom = result.getString("nom") ; 
				String description = result.getString("description") ; 
				String image = result.getString("image") ; 
				
				Ecole ecole = new Ecole() ;
				
				ecole.setId(id);
				
				ecole.setNom(nom) ; 
				ecole.setDescription(description);
				ecole.setImage(image);
				
				ecoles.add(ecole) ; 
				
			}
		}catch(SQLException e) {
			
		}finally {
			try {
			if (result != null) {
				result.close() ; 
			}
			if (statement != null) {
				statement.close(); 
			}
			if(connexion != null) {
				connexion.close(); 
			}
			}
			catch(SQLException ignore) {
				
			}
		
		} 
		return ecoles ;
	}
	
	
	public String test(){
		String nom = new String(); 
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver") ; 
		}
		catch (ClassNotFoundException e) {
			
		}
		
		Connection connexion = null ; 
		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/projets3?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root") ;
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT nom, description, image FROM ECOLE");
			
			while(result.next()) {
			nom = result.getString("nom") ;
			}
			
	}catch(SQLException e) {
		System.out.println(e) ; 
	}
		
	return nom ; 
	
}
	



	public void loadDatabase() {
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver") ; 
		}
		catch (ClassNotFoundException e) {
			
		}
		
		try {
			connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/projets3?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root") ;
		}
		catch(SQLException e) {
			System.out.println(e) ; 
		}
	
	}
	
	public void addEcole(Ecole ecole) {
		
		loadDatabase() ; 
		
		try {
			PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO ECOLE (nom, adresse, description, image) VALUES (?,?,?,?) ;");
			preparedStatement.setString(1, ecole.getNom());
			preparedStatement.setString(2, ecole.getAdresse());
			preparedStatement.setString(3, ecole.getDescription());
			preparedStatement.setString(4, ecole.getImage());
			
			preparedStatement.executeUpdate() ; 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e) ;
		}finally {
			
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
		}
		
	}
	
	public void DeleteById(int id) {
		
		loadDatabase() ; 
		
		
		try {
			PreparedStatement preparedStatement0 = connexion.prepareStatement("DELETE FROM CLUB WHERE ecole_id = " +  id + " ; ");
		    preparedStatement0 = connexion.prepareStatement("DELETE FROM ELEVE WHERE id != 1 and ecole_id = " +  id + " ; ");
		    preparedStatement0.executeUpdate() ; 
			PreparedStatement preparedStatement = connexion.prepareStatement("DELETE FROM CLUB WHERE ecole_id = " +  id + " ; ");
			preparedStatement.executeUpdate() ; 
			PreparedStatement preparedStatement2 = connexion.prepareStatement("DELETE FROM ECOLE WHERE id = " +  id + " ; ");
			preparedStatement2.executeUpdate() ; 

		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e) ;
		}finally {
			
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); //
			} 
			
			}
	}
	
	public Ecole getEcole(String ec){
		
		Ecole ecole = new Ecole(); 
		
		loadDatabase() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT id, nom, description, image FROM ECOLE where nom = '"+ ec + "' ;" );
			
			while(result.next()) {
				int id = result.getInt("id") ; 
				String nom = result.getString("nom") ; 
				String description = result.getString("description") ; 
				String image = result.getString("image") ; 
				
				ecole.setId(id);
				
				ecole.setNom(nom) ; 
				ecole.setDescription(description);
				ecole.setImage(image);
 
				
			}
		}catch(SQLException e) {
			
		}finally {
			try {
			if (result != null) {
				result.close() ; 
			}
			if (statement != null) {
				statement.close(); 
			}
			if(connexion != null) {
				connexion.close(); 
			}
			}
			catch(SQLException ignore) {
				
			}
		
		} 
		return ecole ;
	}
	
public Ecole getEcole(int id){
		
		Ecole ecole = new Ecole(); 
		
		loadDatabase() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT id, nom, description, image FROM ECOLE where id = "+ id + " ;" );
			
			while(result.next()) {
				String nom = result.getString("nom") ; 
				String description = result.getString("description") ; 
				String image = result.getString("image") ; 
				
				ecole.setId(id);
				
				ecole.setNom(nom) ; 
				ecole.setDescription(description);
				ecole.setImage(image);
 
				
			}
		}catch(SQLException e) {
			
		}finally {
			try {
			if (result != null) {
				result.close() ; 
			}
			if (statement != null) {
				statement.close(); 
			}
			if(connexion != null) {
				connexion.close(); 
			}
			}
			catch(SQLException ignore) {
				
			}
		
		} 
		return ecole ;
	}

	

}
