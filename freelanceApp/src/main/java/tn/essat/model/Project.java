package tn.essat.model;

import javax.persistence.*;
import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private String titre; // Project title

    @Column(nullable = false, columnDefinition = "TEXT")
    private String description; // Project description

    @Column(nullable = false)
    private float budget; // Project budget

    @DateTimeFormat(pattern = "yyyy-MM-dd") // Specify the date format for LocalDate
    @Column(name = "date_limite", nullable = false)
    private LocalDate dateLimite; // Deadline for the project

    @Column(name = "nbre_heures", nullable = false)
    private int nbreHeures; // Number of hours required for the project

    private String technologies; // Technologies involved

    @Column(nullable = false)
    private String statut; // Project status (e.g., Open, Closed)

    @ManyToOne
    @JoinColumn(name = "client_id", nullable = false) // Links the project to a client
    private User client;

    // Constructors
    public Project() {}

    public Project(Integer id, String titre, String description, float budget, LocalDate dateLimite, int nbreHeures,
                   String technologies, String statut, User client) {
        this.id = id;
        this.titre = titre;
        this.description = description;
        this.budget = budget;
        this.dateLimite = dateLimite;
        this.nbreHeures = nbreHeures;
        this.technologies = technologies;
        this.statut = statut;
        this.client = client;
    }

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getBudget() {
        return budget;
    }

    public void setBudget(float budget) {
        this.budget = budget;
    }

    public LocalDate getDateLimite() {
        return dateLimite;
    }

    public void setDateLimite(LocalDate dateLimite) {
        this.dateLimite = dateLimite;
    }

    public int getNbreHeures() {
        return nbreHeures;
    }

    public void setNbreHeures(int nbreHeures) {
        this.nbreHeures = nbreHeures;
    }

    public String getTechnologies() {
        return technologies;
    }

    public void setTechnologies(String technologies) {
        this.technologies = technologies;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public User getClient() {
        return client;
    }

    public void setClient(User client) {
        this.client = client;
    }
}
