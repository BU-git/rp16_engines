package com.bionic.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bionic.dao.UserDao;
import com.bionic.domain.User;
import com.bionic.util.Util;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	public List<User> adminLogin(String email, String password) {
		return userDao.adminLogin(email, password);
	}

	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Override
	public User getUserByEmail(String email) {
		String emailTemp = email.toLowerCase().trim();
		return userDao.getUserByEmail(Util.emailTransformation(emailTemp));
	}

	@Override
	@Transactional
	public void save(User u) {
		if(u != null) userDao.save(u);
	}

	@Override
	public List<User> findByEmail(String email) {
		return email != null ? userDao.findByEmail(email.toLowerCase()) : new LinkedList<>();
	}
}