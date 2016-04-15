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
	
	public List<User> getUser (String email, String password) {
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE LOWER(u.email) = :email AND u.password = :pass", User.class);
		query.setParameter("email", email.toLowerCase());
		query.setParameter("pass", password);
		return query.getResultList();
	}

	@Override
	public List<User> getAllUsers() {
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u", User.class);
		return query.getResultList();
	}
}
