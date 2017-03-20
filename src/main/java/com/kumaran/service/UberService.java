package com.kumaran.service;

import com.kumaran.bean.login;

import java.util.List;


import com.kumaran.bean.User;
import com.kumaran.bean.User2;

public interface UberService {

	User registration(User user);
	
	User2 registration2(User2 user2);

String login(String email, String password);

public login getEmployeeById(Integer id, String password);

/*	int busbook(UserRide busbook);*/

List<User> getUser1();

List<User2> getUser2();

}
