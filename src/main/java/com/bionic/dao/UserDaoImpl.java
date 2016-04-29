package com.bionic.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import com.bionic.domain.Role;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bionic.domain.User;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public List<User> adminLogin (String email, String password) {
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u " +
				"WHERE LOWER(u.email) = :email " +
					"AND u.passwordHash = :pass " +
					"AND u.role = :role", User.class);
		query.setParameter("email", email.toLowerCase().trim());
		query.setParameter("pass", password);
		query.setParameter("role", Role.ADMIN);
		return query.getResultList();
	}

	@Override
	public List<User> getAllUsers() {
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.role = :role", User.class);
		query.setParameter("role", Role.USER);
		return query.getResultList();
	}

	@Override
	public User getUserByEmail(String email) {
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE LOWER(u.email) = :email", User.class);
		query.setParameter("email", email);
		List<User> users = query.getResultList();
		if (!users.isEmpty()) {
			return users.get(0);
		}
		return new User(null, null, null, null, Role.USER);
	}

	private String emailTransformation(String email) {
		char[] chars = email.toCharArray();
		for (int i = chars.length-1; i >= 0; i--) {
			if (chars[i] == '_') {
				chars[i] = '.';
				break;
			}
		}
		return new String(chars);
	}

	@Override
	public List<User> findByEmail(String email){
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.email =:email", User.class);
		query.setParameter("email", email.toLowerCase());
		return query.getResultList();
	}

	@Override
	@Transactional
	public void save(User u) {
		em.persist(u);
	}
}
