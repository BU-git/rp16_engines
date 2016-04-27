package com.bionic.dao;

import com.bionic.domain.User;

import java.util.List;

public interface UserDao {
	List<User> adminLogin(String mail, String password);
	List<User> getAllUsers();
	User getUserByEmail(String email);
}
