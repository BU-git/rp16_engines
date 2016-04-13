package com.bionic.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.bionic.domain.User;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public List<User> getUser (String mail, String password) {
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE LOWER(u.email) = :mail AND u.password = :pass", User.class);
		query.setParameter("mail", mail.toLowerCase());
		query.setParameter("pass", password);
		return query.getResultList();
	}

	@Override
	public List<User> getAllUsers() {
		TypedQuery<User> query = em.createQuery("SELECT u FROM Employee u", User.class);
		return query.getResultList();
	}
}
