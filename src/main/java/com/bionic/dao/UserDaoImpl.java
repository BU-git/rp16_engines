package com.bionic.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import com.bionic.domain.user.Role;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.bionic.domain.user.User;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<User> getAllUsers() {
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.role = :role", User.class);
		query.setParameter("role", Role.USER);
		return query.getResultList();
	}

	@Override
	public List<User> findAllRoleUsers(){
		return em.createQuery("SELECT u FROM User u", User.class).getResultList();
	}

	@Override
	public User getUserByEmail(String email) {
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE LOWER(u.email) = :email", User.class);
		String emailTemp = email.toLowerCase().trim();
		query.setParameter("email", emailTemp);
		List<User> users = query.getResultList();
		if (!users.isEmpty()) {
			return users.get(0);
		}
		return new User(null, null, null, null, Role.USER);
	}

	@Override
	public List<User> findByEmail(String email){
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.email =:email", User.class);
		query.setParameter("email", email.toLowerCase());
		return query.getResultList();
	}

	@Override
	public User findById(long id) {
		return em.find(User.class, id);
	}

	@Override
	public void save(User u) {
		if (u.getId() == 0) em.persist(u);
		em.merge(u);
	}

	@Override
	public void update(User u) {
		em.persist(u);
	}

	@Override
	@Transactional
	public void remove(User u) {
		em.remove(u);
	}
}