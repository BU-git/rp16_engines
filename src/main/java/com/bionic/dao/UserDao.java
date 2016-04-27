package com.bionic.dao;

import com.bionic.domain.User;

import java.util.List;

public interface UserDao {
	List<User> getUser(String mail, String password);
	List<User> getAllUsers();
	void save(User u);
	List<User> findByEmail(String email);
	User getUserByEmail(String email);
}
