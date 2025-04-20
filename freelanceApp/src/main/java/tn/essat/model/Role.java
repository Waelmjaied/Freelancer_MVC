package tn.essat.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Role {
	@Id@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id ;
	private String role ;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Role(Integer id, String role) {
		super();
		this.id = id;
		this.role = role;
	}
	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}	 

}
