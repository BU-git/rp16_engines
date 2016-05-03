package com.bionic.service;

<<<<<<< Temporary merge branch 1
import java.util.LinkedList;
import java.util.List;

=======
import com.bionic.dao.UserDao;
import com.bionic.domain.Order;
import com.bionic.domain.User;
import com.bionic.util.Util;
>>>>>>> Temporary merge branch 2
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bionic.dao.UserDao;
import com.bionic.domain.User;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
<<<<<<< Temporary merge branch 1
	
	public List<User> adminLogin(String mail, String password) {
		return userDao.adminLogin(mail, password);
=======
	public List<User> adminLogin(String email, String password) {
		return userDao.adminLogin(email, password);
>>>>>>> Temporary merge branch 2
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
	public void save(User u) {
		if(u != null) userDao.save(u);
	}

	@Override
	public List<User> findByEmail(String email) {
		return email != null ? userDao.findByEmail(email.toLowerCase()) : new LinkedList<>();
	}
}