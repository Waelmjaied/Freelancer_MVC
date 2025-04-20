package tn.essat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.essat.model.Project;
import tn.essat.model.Proposition;
import tn.essat.dao.IProject;

import java.util.List;

@Service
public class ProjectService {

    @Autowired
    private IProject projectRepository;

    public Project createProject(Project project) {
        return projectRepository.save(project);
    }

    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }
    public Project getProjectById(int id) {
    	return projectRepository.findById(id).get();
    }
}