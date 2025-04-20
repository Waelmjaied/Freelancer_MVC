package tn.essat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tn.essat.model.Message;
import tn.essat.model.User;
import tn.essat.service.MessageService;
import tn.essat.service.UserServiceImp;

import java.util.List;

@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private UserServiceImp userService;

    @GetMapping("/messages")
    public String showMessages(@RequestParam("userId") Integer userId, Model model) {
        List<Message> messages = messageService.getMessagesByUser(userId); // Fetch user messages
        List<User> users = userService.getAllUsers(); // Fetch all users for dropdown
        model.addAttribute("messages", messages);
        model.addAttribute("users", users);
        model.addAttribute("userId", userId);
        return "messages"; // Points to messages.jsp
    }

    @PostMapping("/sendMessage")
    public String sendMessage(@RequestParam("expediteurId") Integer expediteurId,
                              @RequestParam("destinataireId") Integer destinataireId,
                              @RequestParam("contenu") String contenu,
                              RedirectAttributes redirectAttributes) {
        try {
            messageService.sendMessage(expediteurId, destinataireId, contenu);
            redirectAttributes.addFlashAttribute("successMessage", "Message sent successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to send the message: " + e.getMessage());
        }
        return "redirect:/messages?userId=" + expediteurId;
    }

    @PostMapping("/deleteMessage")
    public String deleteMessage(@RequestParam("messageId") Integer messageId, 
                                @RequestParam("userId") Integer userId, 
                                RedirectAttributes redirectAttributes) {
        try {
            messageService.deleteMessage(messageId, userId);
            redirectAttributes.addFlashAttribute("successMessage", "Message deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to delete the message: " + e.getMessage());
        }
        return "redirect:/messages?userId=" + userId;
    }
}
