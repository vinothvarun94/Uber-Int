package com.kumaran.dao;

import com.kumaran.bean.login;

import java.util.List;


import com.kumaran.bean.User;
import com.kumaran.bean.User2;

public interface UberDao {

	User registration(User user);

	String login(String email, String password);

	/*int busbook(UserRide busbook);*/
	
	public login getEmployeeById(Integer id,String password)throws Exception;
	
	List<User> getUsers1();
	
	List<User2> getUsers2();

	User2 registration2(User2 user2);

}
