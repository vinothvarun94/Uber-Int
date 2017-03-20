package com.kumaran.bean;

import java.util.*;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement(name = "users")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class user1list {

	 private List<User> user1;

	 public user1list() {
		 user1= new ArrayList<User>();
		    }

	 
	 public user1list(List<User> items) {
			this.user1 = items;
		    }

	 @XmlElement(name = "user")
	public List<User> getUser1() {
		return user1;
	}


	public void setUser1(List<User> user1) {
		this.user1 = user1;
	}


	

}
