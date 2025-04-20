package tn.essat.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
@Entity
public class User implements UserDetails {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id ;
	private String nom;
	private String email;
	private String username;
	private String password;
	private boolean enabled;

	@ManyToOne @JoinColumn(name = "role_id" )
	private Role role;
	
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional = true)
    private Profile profile;

	

	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		List<GrantedAuthority> liste =new ArrayList<GrantedAuthority>();
		liste.add(new SimpleGrantedAuthority(role.getRole()));
		
		
		return liste;
	}
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public User(Integer id, String nom, String email, String username, String password, boolean enabled, Role role) {
		super();
		this.id = id;
		this.nom = nom;
		this.email = email;
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.role = role;
	}
	
    public User(String nom, String email, String username, String password, boolean enabled, Role role, Profile profile) {
		super();
    	this.nom = nom;
        this.email = email;
        this.username = username;
        this.password = password;
        this.enabled = enabled;
        this.role = role;
        this.profile = profile;
    }

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getPassword() {
		// TODO Auto-generated method stub
		return password;
	}

	public String getUsername() {
		// TODO Auto-generated method stub
		return username;
	}

	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return enabled;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

}
