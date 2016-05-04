package com.bionic.service;

import java.util.LinkedList;
import java.util.List;
import com.bionic.dao.UserDao;
import com.bionic.domain.Role;
import com.bionic.domain.User;
import com.bionic.util.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	public User adminLogin(String email, String password) {
		User user = userDao.getUserByEmail(email);
		if (user == null) return null;
		if (user.getRole() != Role.ADMIN) return null;
		String salt = user.getSalt();
		String passwordHash = user.getPasswordHash();
		String passwordHashFromPage = PasswordEncoder.getInstance().encode(password, salt);
		return (passwordHash.equals(passwordHashFromPage)) ? user : null;
	}

	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Override
	public User getUserByEmail(String email) {
		String emailTemp = email.toLowerCase().trim();
		return userDao.getUserByEmail(emailTemp);
	}

	@Override
	@Transactional
	public void save(User user) {
		PasswordEncoder passwordEncoder = PasswordEncoder.getInstance();
		if(user != null) {
			String password = user.getPasswordHash();
			String salt = PasswordEncoder.nextSALT();
			String passwordHash = passwordEncoder.encode(password, salt);
			user.setPasswordHash(passwordHash);
			user.setSalt(salt);
			userDao.save(user);
		}
	}

	@Override
	public List<User> findByEmail(String email) {
		return email != null ? userDao.findByEmail(email.toLowerCase()) : new LinkedList<>();
	}
}