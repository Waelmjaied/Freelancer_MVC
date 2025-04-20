package tn.essat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import tn.essat.model.Project;
import tn.essat.model.Proposition;
import tn.essat.service.ProjectService;
import tn.essat.service.PropositionService;

import java.util.List;

@Controller
public class PropositionController {

    @Autowired
    private PropositionService propositionService;
    @Autowired
    private ProjectService projServ;
    // Display the list of propositions
    @GetMapping("/listProposition")
    public String showPropositions(Model model) {
        // Fetch all propositions
        List<Proposition> propositions = propositionService.findAll();
        model.addAttribute("propositions", propositions);
        return "proposition-list"; // Redirects to proposition-list.jsp
    }

    // Navigate to the Add Proposition form
    @GetMapping("/addPropositionForm/{id}")
    public String showAddPropositionForm(@PathVariable("id") int id,Model m) {
    	Project proj = projServ.getProjectById(id);
    	m.addAttribute("proj", proj);
    	m.addAttribute("proposition", new Proposition());
        return "proposition"; // Redirects to proposition.jsp
    }

    // Create a new proposition
    @PostMapping("/addPropositionForm/{id}")
    public String createProposition(@PathVariable("id") int id,@ModelAttribute Proposition proposition, Model model) {
        try {
        	// get the project by his id
        	Project p = projServ.getProjectById(id);
        	// add project to proposition
        	proposition.setProj(p);
            // Save the new proposition
            propositionService.save(proposition);

            // Fetch the updated list of propositions
            List<Proposition> propositions = propositionService.findAll();
            model.addAttribute("propositions", propositions);

            // Add a success message
            model.addAttribute("message", "Proposition submitted successfully!");

            // Return the proposition-list.jsp view
            return "proposition-list"; // Matches the JSP file for displaying the list
        } catch (Exception e) {
            // Log the error and redirect to an error page or show a message
            e.printStackTrace();
            model.addAttribute("error", "An error occurred while saving the proposition.");
            return "error";
        }
    }
}
