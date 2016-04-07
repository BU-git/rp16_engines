package com.bionic.service;

import javax.inject.Inject;
import javax.inject.Named;

import com.bionic.dao.UserDao;
import com.bionic.domain.User;


@Named
public class UserServiceImpl implements UserService {
	@Inject
	UserDao userDao;
	
	public User getUser(String mail, String password) {
		return userDao.getUser(mail, password);
	}
}
