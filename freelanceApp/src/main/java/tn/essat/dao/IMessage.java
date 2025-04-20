package tn.essat.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import tn.essat.model.Message;

import java.util.List;

public interface IMessage extends JpaRepository<Message, Integer> {
    List<Message> findByExpediteurIdOrDestinataireId(Integer expediteurId, Integer destinataireId);
}
