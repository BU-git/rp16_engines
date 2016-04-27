package com.bionic.service;

import java.util.List;

import com.bionic.domain.User;

public interface UserService {
	List<User> getUser(String mail, String password);
	List<User> getAllUsers();
	void save(User u);
	List<User> findByEmail(String email);
}
