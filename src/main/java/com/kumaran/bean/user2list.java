package com.kumaran.bean;

import java.util.*;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement(name = "employees")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class user2list {

	 private List<User2> user1;

	 public user2list() {
		 user1= new ArrayList<User2>();
		    }

	 
	 public user2list(List<User2> items) {
			this.user1 = items;
		    }

	 @XmlElement
	public List<User2> getUser1() {
		return user1;
	}


	public void setUser1(List<User2> user1) {
		this.user1 = user1;
	}


	

}
