package com.bionic.service;

import com.bionic.domain.User;

import java.util.List;

public interface UserService {
	List<User> getUser(String mail, String password);
}
