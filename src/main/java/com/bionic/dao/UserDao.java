package com.bionic.dao;

import java.util.List;

import com.bionic.domain.User;

public interface UserDao {
	List<User> getUser(String mail, String password);
	List<User> getAllUsers();
	void save(User u);
	List<User> findByEmail(String email);
}
