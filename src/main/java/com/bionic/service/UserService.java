package com.bionic.service;

import com.bionic.domain.User;
import java.util.List;

public interface UserService {
	List<User> adminLogin(String mail, String password);
	List<User> getAllUsers();
	User getUserByEmail(String email);
}
