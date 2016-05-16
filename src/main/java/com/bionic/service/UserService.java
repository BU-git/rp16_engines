package com.bionic.service;

import java.util.List;

import com.bionic.domain.User;
import com.bionic.domain.user.UserWrapper;

public interface UserService {
	User adminLogin(String mail, String password);
	List<User> getAllUsers();
	User getUserByEmail(String email);
	void save(User u);
	void update(UserWrapper u);
	void removeById(long id);
	List<User> findByEmail(String email);
	User findById(long id);
	List<UserWrapper> findAllForDataTables();
	void restorePassword(User user, String newPassword);
}
