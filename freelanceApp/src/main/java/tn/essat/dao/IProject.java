package tn.essat.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.essat.model.Project;

@Repository
public interface IProject extends JpaRepository<Project, Integer> {
    // Additional query methods can be defined here
}