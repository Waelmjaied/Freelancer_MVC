package tn.essat.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Proposition {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "proj_id")
	private Project proj;
	@ManyToOne
	@JoinColumn(name = "freelancer_id")
	private User freelancer;
	private float montant;
	private int duree;
	private String description;
	public Proposition() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Proposition(Integer id, Project proj, User freelancer, float montant, int duree, String description) {
		super();
		this.id = id;
		this.proj = proj;
		this.freelancer = freelancer;
		this.montant = montant;
		this.duree = duree;
		this.description = description;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Project getProj() {
		return proj;
	}
	public void setProj(Project proj) {
		this.proj = proj;
	}
	public User getFreelancer() {
		return freelancer;
	}
	public void setFreelancer(User freelancer) {
		this.freelancer = freelancer;
	}
	public float getMontant() {
		return montant;
	}
	public void setMontant(float montant) {
		this.montant = montant;
	}
	public int getDuree() {
		return duree;
	}
	public void setDuree(int duree) {
		this.duree = duree;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}