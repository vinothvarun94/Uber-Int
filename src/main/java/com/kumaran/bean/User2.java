package com.kumaran.bean;

import java.io.Serializable;
import javax.persistence.Id;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@Table(name = "user2")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@XmlRootElement
@XmlAccessorType(XmlAccessType.NONE)
public class User2 implements Serializable  {
	
		
	private static final long serialVersionUID = 1L;
		
	@Id
	@Column(name = "email")
	private String email;
	
	@Column(name = "firstname")
	private String firstname;
	
	@Column(name = "lastname")
	private String lastname;
	
	
	@Column(name = "uuid")
	private String uuid;


	public String getEmail() {
		return email;
	}

	 @XmlElement
	public void setEmail(String email) {
		this.email = email;
	}


	public String getFirstname() {
		return firstname;
	}

	 @XmlElement
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}


	public String getLastname() {
		return lastname;
	}

	 @XmlElement
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}


	public String getUuid() {
		return uuid;
	}

	 @XmlElement
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
		
		

}
