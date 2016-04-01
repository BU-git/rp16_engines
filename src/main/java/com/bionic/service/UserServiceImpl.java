package com.bionic.service;

import javax.inject.Inject;
import javax.inject.Named;

import com.bionic.dao.UserDao;


@Named
public class UserServiceImpl implements UserService {
	@Inject
	UserDao userDao;
	
	public boolean isValidUser(String mail, String password) {
		return userDao.isValidUser(mail, password);
	}
}
