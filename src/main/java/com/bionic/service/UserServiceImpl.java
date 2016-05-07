package com.bionic.service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bionic.dao.UserDao;
import com.bionic.domain.Role;
import com.bionic.domain.User;
import com.bionic.domain.user.UserWrapper;
import com.bionic.util.PasswordEncoder;

@Service
@Transactional(readOnly = true)
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
	@Transactional
	public void update(UserWrapper u) {
		if(u == null) throw  new IllegalStateException("user == null");
		List<User> list = findByEmail(u.getEmail());
		if(list.size() > 0 && list.get(0).getId() != u.getId())throw  new IllegalArgumentException("user with this email already exist");
		User user;
		if(list.size() > 0) user = list.get(0);
		else user = findById(u.getId());
		user.setNumber(u.getNumber());
		user.setEmail(u.getEmail());
		user.setName(u.getName());
		user.setRole(u.getRole().equals("admin") ? Role.ADMIN : Role.USER);
		userDao.update(user);
	}

	@Override
	@Transactional
	public void removeById(long id) {
		User u = findById(id);
		if(u == null) throw new IllegalStateException();
		userDao.remove(u);
	}

	@Override
	public List<User> findByEmail(String email) {
		return email != null ? userDao.findByEmail(email.toLowerCase()) : new LinkedList<>();
	}

	@Override
	public User findById(long id) {
		return userDao.findById(id);
	}

	@Override
	public List<UserWrapper> findAllForDataTables(){
		List<UserWrapper> result = new ArrayList<>();
		List<User> users = userDao.findAllRoleUsers();
		if(users.size() < 1) return result;
		result.addAll(users.stream().map(this::wrapMe).collect(Collectors.toList()));
		return result;
	}

	private UserWrapper wrapMe(User u){
		UserWrapper wrapper = new UserWrapper();
		if(u == null) return wrapper;
		wrapper.setName(u.getName());
		wrapper.setEmail(u.getEmail());
		wrapper.setId(u.getId());
		wrapper.setRole(u.getRole() == Role.ADMIN ? "admin" : "user");
		wrapper.setNumber(u.getNumber());
		return wrapper;
	}
}