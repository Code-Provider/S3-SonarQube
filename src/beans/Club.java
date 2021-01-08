package beans;
import beans.Eleve; 

import java.util.List;

public class Club {
	private int id ; 
	private String ecole ; 
	
	public String getEcole() {
		return ecole;
	}
	public void setEcole(String ecole) {
		this.ecole = ecole;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String nom ; 
	private String description ; 
	private String validite ; 
	private String logo ; 
	private List<String> messages ;
	private Eleve gerant ; 
	private List<Eleve> membres ;
	
	public Eleve getGerant() {
		return gerant;
	}
	public void setGerant(Eleve gerant) {
		this.gerant = gerant;
	}
	public List<Eleve> getMembres() {
		return membres;
	}
	public void setMembres(List<Eleve> membres) {
		this.membres = membres;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getValidite() {
		return validite;
	}
	public void setValidite(String validite) {
		this.validite = validite;
	}
	
	public List<String> getMessages() {
		return messages;
	}
	public void setMessages(List<String> messages) {
		this.messages = messages;
	}
	
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	} 
	

}
