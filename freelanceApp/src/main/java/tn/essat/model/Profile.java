package tn.essat.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;


@Entity
public class Profile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String biblio;
    private String skills;
    private Integer anneeExperience;
    private String disponibilite;
    private Double rating;

    @OneToOne
    @JoinColumn(name = "user_id", unique = true)
    private User user;

    public Profile() {
    }

    public Profile(String biblio, String skills, Integer anneeExperience, String disponibilite, Double rating, User user) {
        this.biblio = biblio;
        this.skills = skills;
        this.anneeExperience = anneeExperience;
        this.disponibilite = disponibilite;
        this.rating = rating;
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBiblio() {
        return biblio;
    }

    public void setBiblio(String biblio) {
        this.biblio = biblio;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public Integer getAnneeExperience() {
        return anneeExperience;
    }

    public void setAnneeExperience(Integer anneeExperience) {
        this.anneeExperience = anneeExperience;
    }

    public String getDisponibilite() {
        return disponibilite;
    }

    public void setDisponibilite(String disponibilite) {
        this.disponibilite = disponibilite;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

}
