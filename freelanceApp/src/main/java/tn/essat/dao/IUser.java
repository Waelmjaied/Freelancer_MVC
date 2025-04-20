package tn.essat.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tn.essat.model.User;


@Repository
public interface IUser extends JpaRepository<User, Integer> {
	
	
	public User findByUsername(String username);
	

}
