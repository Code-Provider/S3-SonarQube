package beans;

public class Ecole {
	private int id ; 
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String nom ; 
	private String description ; 
	private String Adresse ; 
	private String image ;
	
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
	public String getAdresse() {
		return Adresse;
	}
	public void setAdresse(String adresse) {
		Adresse = adresse;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	} 
	
	
	
}
