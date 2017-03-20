package com.kumaran.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;

import com.kumaran.bean.login;

import com.kumaran.bean.User;
import com.kumaran.bean.User2;

public class UberDaoImpl implements UberDao{

	
	
	
	@Autowired
	 SessionFactory sessionFactory;
	
	 Session session = null;
	 Transaction tx = null;
	 
	 
	@Override
	public User registration(User user) {
		session = sessionFactory.openSession();
		  tx = session.beginTransaction();
		  session.save(user);
		  tx.commit();
		  session.close();
		  System.out.println("added successfully");
		return user;
		
	}


	@Override
	public String login(String email, String password) {
		session = sessionFactory.openSession();
		
		  login a = (login) session.load(login.class, new String(email));
		  tx = session.getTransaction();
		  
		  session.beginTransaction();
		  
		  tx.commit();
		  System.out.println("get employee detail successfully");
		  System.out.println(password);
		  String pass=a.getPassword();
		  System.out.println(pass);
		  if(pass.equals(password))
		  {
			  System.out.println("validation is successs");		
			  return "success";
			  
		  }
		  
		return "failure";
	}


	

	@Override
	public User2 registration2(User2 user2) {
		session = sessionFactory.openSession();
		  tx = session.beginTransaction();
		  session.save(user2);
		  tx.commit();
		  session.close();
		  System.out.println("user2 added successfully");
		return user2;
	}


	@SuppressWarnings("unchecked")
	 @Override
	public List<User> getUsers1() {
		
		session = sessionFactory.openSession();
		  tx = session.beginTransaction();
		  List<User> userlist = session.createCriteria(User.class)
		    .list();
		  tx.commit();
		  session.close();
		  
		  return userlist;
		
		
		 }


	@Override
	public List<User2> getUsers2() {
		session = sessionFactory.openSession();
		  tx = session.beginTransaction();
		  List<User2> userlist2 = session.createCriteria(User2.class).list();
		  tx.commit();
		  session.close();
		  
		  return userlist2;
	}


	@Override
	public login getEmployeeById(Integer id, String password) throws Exception {
		session = sessionFactory.openSession();
		 
		login employee = (login) session.load(login.class, new Integer(id));
		  tx = session.getTransaction();
		  
		  session.beginTransaction();
		  
		  tx.commit();
		  
		  System.out.println(password);
		  String pass=employee.getPassword();
		  System.out.println(pass);
		  if(pass.equals(password))
		  {
			  System.out.println("validation is successs");
		      return employee;
		  }
		  
		  return null;
	}

}
