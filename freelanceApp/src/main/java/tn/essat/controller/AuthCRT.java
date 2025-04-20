package tn.essat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tn.essat.model.Role;
import tn.essat.model.User;
import tn.essat.service.IUserService;
import tn.essat.dao.IRole;
import tn.essat.dao.IUser;

@Controller
public class AuthCRT {

    @Autowired
    private IUser daoUser;
    @Autowired
    private IRole daoRole;

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    //login
    @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
    public String preLogin(@RequestParam(value = "error", required = false) String error, Model model) {
        String msg = null;
        if (error != null) {
            msg = "Username or Password is incorrect !!";
        }
        model.addAttribute("errorMessge", msg);
        return "login";
    }
    
    //signup
    @GetMapping("/signup")
    public String showSignupPage(@RequestParam("newUser") String role, Model model) {
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("newUser",role);

        return "signup";
    }

    @PostMapping("/signup")
    public String handleSignup(User user, @RequestParam("newUser") String role, Model model) {
        // Fetch the Role entity based on the role name
        Role userRole = daoRole.findByRole("ROLE_"+role);
        if (userRole == null) {
            model.addAttribute("error", "Invalid role. Please try again.");
            return "signup"; // Redirect back to the signup page if the role is invalid
        }
        User u = daoUser.findByUsername(user.getUsername());
        if (u != null) {
        	model.addAttribute("error", "Username is used by someone else.\n please use an other username.");
            return "signup";
        }

        // Set the role and other properties for the user
        user.setRole(userRole);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(true); // Set default as enabled

        // Save the user
        daoUser.save(user);

        model.addAttribute("message", "Signup successful, please login.");
        return "login"; // Redirect to the login page after successful signup
    }

    
    // This ensures users can only access the following pages if they are logged in
    @GetMapping("/restricted")
    public String restrictedPage() {
        return "restricted";
    }
    
    // Logout Handler
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        // Invalidate the session
        request.getSession().invalidate();

        // Redirect to login.jsp
        return "redirect:/login.jsp";
    }
}
