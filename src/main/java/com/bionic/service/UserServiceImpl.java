package com.bionic.service;

import com.bionic.dao.UserDao;
import com.bionic.domain.Order;
import com.bionic.domain.User;
import com.bionic.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


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
}
