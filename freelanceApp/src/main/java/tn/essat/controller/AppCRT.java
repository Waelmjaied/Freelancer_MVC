package tn.essat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import tn.essat.dao.IProfile;
import tn.essat.dao.IProject;
import tn.essat.dao.IUser;
import tn.essat.model.Profile;
import tn.essat.model.Project;
import tn.essat.model.User;

@Controller
public class AppCRT {

    @Autowired
    private IProject daoProj;
    @Autowired
    private IUser daoUser;
    @Autowired
    private IProfile daoProfile; 

    //profile Freelancer
    @GetMapping("/profile")
    public String showCreateProfileForm(@RequestParam("username") String username, Model model) {
        User user = daoUser.findByUsername(username);
       
        Profile profile = new Profile();
        model.addAttribute("profile", profile);
        model.addAttribute("user", user);
        return "addProfile";
    }
    @PostMapping("/profile")
    public String createOrUpdateProfile(@RequestParam("username") String username,
                                        Profile profile, Model model) {
        try {
            // Retrieve the user by username
            User user = daoUser.findByUsername(username);

         

            // Check if the user already has a profile
            Profile existingProfile = user.getProfile();

            if (existingProfile != null) {
                // Update existing profile fields
                existingProfile.setBiblio(profile.getBiblio());
                existingProfile.setSkills(profile.getSkills());
                existingProfile.setAnneeExperience(profile.getAnneeExperience());
                existingProfile.setDisponibilite(profile.getDisponibilite());
                existingProfile.setRating(profile.getRating());

                // Save the updated profile
                daoProfile.save(existingProfile);
                model.addAttribute("message", "Profile updated successfully!");
            } else {
                // Create a new profile if none exists

                profile.setUser(user);
                user.setProfile(profile);

                // Save the user and profile
                daoUser.save(user); // Cascade ensures the profile is saved
                model.addAttribute("message", "Profile created successfully!");
                model.addAttribute("profile",profile);
                model.addAttribute("username",username);
            }

        } catch (Exception e) {
            model.addAttribute("error", "Failed to create or update profile: " + e.getMessage());
            return "addProfile"; // Return to the form in case of an error
        }

        // Redirect to the freelancer page after success
        return "freelancer";
    }
    
    @GetMapping("/profileFreelancer")
    public String getFreelancerProfile(@RequestParam("username") String username, Model model) {
        // Fetch the User object based on the username
        User user = daoUser.findByUsername(username);
        
        // If the user is found, retrieve their profile
        if (user != null) {
            // Fetch the Profile associated with the User (ensure user_id is valid)
            Profile profile = daoProfile.findByUserId(user.getId());
            
            // Add both the username and profile to the model
            model.addAttribute("username", username);
            model.addAttribute("profile", profile);
            
            return "freelancer";  // Return the JSP view to display the freelancer profile
        } else {
            // If the user is not found, you can handle the error gracefully
            model.addAttribute("error", "User not found");
            return "errorPage";  // You can redirect to an error page or show an error message
        }
    }
    
    


    //Projects
    
    @GetMapping("/ShowAllProjects")
    public String getAllProjects(Model m) {
        List<Project> projs = daoProj.findAll();
        m.addAttribute("projs", projs);
        return "listProjects";
    }
    
    

}
