package com.bionic.dao;

import com.bionic.domain.User;

public interface UserDao {
	public User getUser(String mail, String password);
}
