package tn.essat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tn.essat.dao.IMessage;
import tn.essat.model.Message;
import tn.essat.model.User;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class MessageService {

    @Autowired
    private IMessage messageRepository;

    @Autowired
    private UserServiceImp userService;

    public List<Message> getMessagesByUser(Integer userId) {
        return messageRepository.findByExpediteurIdOrDestinataireId(userId, userId);
    }

    public Message saveMessage(Message message) {
        return messageRepository.save(message);
    }

    public void sendMessage(Integer expediteurId, Integer destinataireId, String contenu) {
        User expediteur = userService.findById(expediteurId); // Fetch expediteur as User object
        User destinataire = userService.findById(destinataireId); // Fetch destinataire as User object

        if (expediteur == null || destinataire == null) {
            throw new IllegalArgumentException("Expediteur or Destinataire not found");
        }

        Message message = new Message();
        message.setExpediteur(expediteur); // Set User object
        message.setDestinataire(destinataire); // Set User object
        message.setContenu(contenu);
        message.setDate(LocalDateTime.now());
        messageRepository.save(message);
    }

    public void deleteMessage(Integer messageId, Integer userId) {
        Message message = messageRepository.findById(messageId).orElse(null);
        if (message == null) {
            throw new IllegalArgumentException("Message not found");
        }

        // Allow deletion only if the user is the sender or receiver
        if (message.getExpediteur().getId().equals(userId) || message.getDestinataire().getId().equals(userId)) {
            messageRepository.deleteById(messageId);
        } else {
            throw new IllegalArgumentException("Unauthorized to delete this message");
        }
    }
}
