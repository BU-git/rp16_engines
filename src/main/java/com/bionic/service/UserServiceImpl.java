package com.bionic.service;

import javax.inject.Inject;
import javax.inject.Named;

import com.bionic.dao.UserDao;
import com.bionic.domain.User;

import java.util.List;


@Named
public class UserServiceImpl implements UserService {
	@Inject
	UserDao userDao;
	
	public List<User> getUser(String mail, String password) {
		return userDao.getUser(mail, password);
	}
}
