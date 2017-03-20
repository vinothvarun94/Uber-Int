package com.kumaran.bean;

import java.io.Serializable;
import javax.persistence.Id;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@Table(name = "login")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@XmlRootElement
@XmlAccessorType(XmlAccessType.NONE)
public class login implements Serializable  {
	
		
	private static final long serialVersionUID = 1L;
		
	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "uname")
	private String uname;
	
	@Column(name = "password")
	private String password;
	
	
	public Integer getId() {
		return id;
	}

	 @XmlElement
	public void setId(Integer id) {
		this.id = id;
	}


	public String getUname() {
		return uname;
	}

	 @XmlElement
	public void setUname(String uname) {
		this.uname = uname;
	}


	public String getPassword() {
		return password;
	}

	 @XmlElement
	public void setPassword(String password) {
		this.password = password;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
/*	@Override
    public String toString() 
{
	return "User [Email=" + email + ", Firstname=" + firstname +",Lastname="+lastname+",UUid="+uuid+"]";
}
*/		
		

}
