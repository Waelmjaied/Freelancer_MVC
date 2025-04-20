package tn.essat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tn.essat.dao.IProposition;
import tn.essat.model.Proposition;
import java.util.List;

@Service
public class PropositionService {

    @Autowired
    private IProposition propositionRepository;

    public List<Proposition> findAll() {
        return propositionRepository.findAll();
    }

    public Proposition save(Proposition proposition) {
        return propositionRepository.save(proposition);
    }
    

}