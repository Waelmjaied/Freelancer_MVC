package tn.essat.dao;


import org.springframework.data.jpa.repository.JpaRepository;
	import tn.essat.model.Proposition;

	public interface IProposition extends JpaRepository<Proposition, Integer> {
	}