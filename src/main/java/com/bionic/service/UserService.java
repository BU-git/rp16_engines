package com.bionic.service;

import com.bionic.domain.User;

public interface UserService {
	public User getUser(String mail, String password);
}
