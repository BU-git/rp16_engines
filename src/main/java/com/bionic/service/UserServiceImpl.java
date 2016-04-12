package com.bionic.service;

import com.bionic.dao.UserDao;
import com.bionic.domain.Order;
import com.bionic.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	public List<User> getUser(String mail, String password) {
		return userDao.getUser(mail, password);
	}

	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}
}
