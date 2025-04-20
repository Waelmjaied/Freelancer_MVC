package tn.essat.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;
import tn.essat.model.User;

import tn.essat.model.User;

public interface IUserService extends UserDetailsService {
    User findByUsername(String username);
    User findById(Integer id);// No body here
    List<User> getAllUsers(); // Fetch all users

}
