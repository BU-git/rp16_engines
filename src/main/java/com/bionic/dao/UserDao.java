package com.bionic.dao;

import java.util.List;

import com.bionic.domain.User;

public interface UserDao {
	List<User> getAllUsers();
	void save(User u);
    void update(User u);
	void remove(User u);
	List<User> findByEmail(String email);
	User findById(long id);
	User getUserByEmail(String email);
	List<User> findAllRoleUsers();
}
