package com.kumaran.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kumaran.bean.login;

import com.kumaran.bean.User;
import com.kumaran.bean.User2;
import com.kumaran.dao.UberDao;

public class UberServiceImpl implements UberService{

	
	
	@Autowired
	 UberDao UberDao;
	
	
	@Override
	public User registration(User user) {
		try {
			UberDao.registration(user);
			} 
		catch (Exception e) 
			{
			
			e.printStackTrace();
			}
		
		return user;	
	}


	@Override
	public String login(String email, String password) {
		try 
		{
			String user = UberDao.login(email,password);
			if(user.equals("success"))
			{
			return "success";
			}
		} 
		catch (Exception e) 
		{
			
			e.printStackTrace();
		}
		return "failure";
		
	}


	

	@Override
	public User2 registration2(User2 user2) {
		try {
			UberDao.registration2(user2);
			} 
		catch (Exception e) 
			{
			
			e.printStackTrace();
			}
		
		return user2;
	}


	@Override
	public List<User> getUser1() {
		List<User> list=  UberDao.getUsers1();
		return list;
	}


	@Override
	public List<User2> getUser2() {
		List<User2> list2=  UberDao.getUsers2();
		return list2;
	}


	@Override
	public login getEmployeeById(Integer id, String password) {
		login emp;
		try
		{
			emp = UberDao.getEmployeeById(id,password);
			return emp;
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			System.out.println("Login Check");
	
		return null;
	}

}
