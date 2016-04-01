package com.bionic.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.bionic.domain.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public boolean isValidUser (String mail, String password) {
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE LOWER(u.mail) = :mail AND u.password = :pass", User.class);
		query.setParameter("mail", mail.toLowerCase());
		query.setParameter("pass", password);
		return !query.getResultList().isEmpty();
	}
}
