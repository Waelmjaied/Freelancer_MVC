package tn.essat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tn.essat.dao.IUser;
import tn.essat.model.User;

import java.util.List;

@Service
public class UserServiceImp implements IUserService {

    @Autowired
    private IUser dao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = dao.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return user;
    }

    @Override
    public User findByUsername(String username) {
        return dao.findByUsername(username);
    }

    @Override
    public User findById(Integer id) {
        return dao.findById(id).orElse(null); // Fetch user by ID
    }

    @Override
    public List<User> getAllUsers() {
        return dao.findAll(); // Fetch all users
    }
}
