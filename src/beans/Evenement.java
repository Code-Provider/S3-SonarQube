package beans;

public class Evenement {
	
	private String titre ; 
	private String description ; 
	private String type ; 
	private String activites ;
	private String dateDebut ; 
	private String dateFin ;
	private String image ; 
	private int id ;
	private Ecole ecole ; 
	private Club club ; 
	private String dateDebut1 ;
	private String dateFin1 ;
	private Boolean value ; 
	private boolean ivalue ; 
	
	
	
	
	
	public boolean isIvalue() {
		return ivalue;
	}
	public void setIvalue(boolean ivalue) {
		this.ivalue = ivalue;
	}
	public Boolean getValue() {
		return value;
	}
	public void setValue(Boolean value) {
		this.value = value;
	}
	public String getDateDebut1() {
		return dateDebut1;
	}
	public void setDateDebut1(String dateDebut1) {
		this.dateDebut1 = dateDebut1;
	}
	public String getDateFin1() {
		return dateFin1;
	}
	public void setDateFin1(String dateFin1) {
		this.dateFin1 = dateFin1;
	}
	public Club getClub() {
		return club;
	}
	public void setClub(Club club) {
		this.club = club;
	}
	public Ecole getEcole() {
		return ecole;
	}
	public void setEcole(Ecole ecole) {
		this.ecole = ecole;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	
	public String getActivites() {
		return activites;
	}
	public void setActivites(String activites) {
		this.activites = activites;
	}
	public String getDateDebut() {
		return dateDebut;
	}
	public void setDateDebut(String dateDebut) {
		this.dateDebut = dateDebut;
	}
	public String getDateFin() {
		return dateFin;
	}
	public void setDateFin(String dateFin) {
		this.dateFin = dateFin;
	} 
	
	
	

}
