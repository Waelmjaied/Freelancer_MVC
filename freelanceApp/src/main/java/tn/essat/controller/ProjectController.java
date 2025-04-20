package tn.essat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tn.essat.dao.IProject;
import tn.essat.dao.IUser;
import tn.essat.model.Project;
import tn.essat.model.User;

import java.util.List;

@Controller
public class ProjectController {

    @Autowired
    private IProject daoProj;

    @Autowired
    private IUser daoUser;

    // List all projects
    @GetMapping("/projects")
    public String listProjects(Model model) {
        List<Project> projects = daoProj.findAll();
        model.addAttribute("projects", projects);
        return "listProjects"; // Points to listProjects.jsp
    }

    @GetMapping("/projects/new")
    public String showCreateProjectForm(@RequestParam("username") String username, Model model) {
        System.out.println("Opening createProject.jsp for user: " + username);

        model.addAttribute("username", username);
        model.addAttribute("project", new Project());
        return "createProject";
    }
    @GetMapping("/projects/details")
    public String viewProjectDetails(@RequestParam("id") Integer id, Model model) {
        Project project = daoProj.findById(id).orElse(null);
        if (project == null) {
            model.addAttribute("error", "Project not found.");
            return "error"; // Redirect to an error page if the project doesn't exist
        }
        model.addAttribute("project", project);
        return "projectsDetails"; // Points to projectsDetails.jsp
    }


    // Handle form submission to create a project
    @PostMapping("/projects/new")
    public String createProject(@ModelAttribute("project") Project project, 
                                 @RequestParam("username") String username, 
                                 Model model) {
        User client = daoUser.findByUsername(username);
        if (client == null) {
            model.addAttribute("error", "Client not found.");
            return "error"; // Redirect to an error page if client not found
        }

        project.setClient(client);
        daoProj.save(project); // Save the project to the database
        model.addAttribute("message", "Project created successfully!");
        return "redirect:/projects"; // Redirect to the list of projects
    }
}
