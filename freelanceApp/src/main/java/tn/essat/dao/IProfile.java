package tn.essat.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tn.essat.model.Profile;

@Repository
public interface IProfile extends JpaRepository<Profile, Integer> {
	
	@Query("SELECT p FROM Profile p WHERE p.user.role.role = 'ROLE_FREELANCER'")
	List<Profile> findFreelancerProfiles();
	
	@Query("SELECT p FROM Profile p WHERE p.user.id = :userId")
	public Profile findByUserId(@Param("userId") int userId);

}
