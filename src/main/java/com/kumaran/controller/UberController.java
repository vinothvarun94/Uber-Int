package com.kumaran.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kumaran.bean.login;
import com.kumaran.bean.user1list;
import com.kumaran.bean.user2list;

import com.kumaran.bean.User;
import com.kumaran.bean.User2;
import com.kumaran.service.UberService;

import io.swagger.annotations.ApiOperation;



@RestController
public class UberController 
{
	@Autowired
	 UberService UberService;
	
	
	
	@ApiOperation(value = "SeenByUser",notes="users seen link",response=User.class)
    @RequestMapping(value ="/registration", method = RequestMethod.POST,consumes = "application/json", produces = "application/json")
    public @ResponseBody
    User user(@RequestBody User user) {
       System.out.println(user);
       UberService.registration(user);
       return user;
     
    }
	

	@ApiOperation(value = "Ride:User",notes="users given ride request",response=User2.class)
    @RequestMapping(value ="/registration2", method = RequestMethod.POST,consumes = "application/json", produces = "application/json")
    public @ResponseBody
    User2 user2(@RequestBody User2 user2) {
       System.out.println(user2);
       UberService.registration2(user2);
       return user2;
     
    }
	
	
	
    @ApiOperation(value = "LOGIN",notes="login for end user",response = login.class)
    @RequestMapping(value = "/login/{email},{password}", method = RequestMethod.GET,produces = { MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_VALUE })
   
    @ResponseBody 
    public String login(@PathVariable String email,@PathVariable String password) {
    System.out.println("controll");
     String employee = UberService.login(email,password);
     if(employee.equals("success"))
     {
	return "success";
     }
	return "failure";
    
    }
    
   

    
    
    /*Gets User 1 details*/
    @ApiOperation(value = "Gets User 1 details", notes = "Retrieves all Employees details", response = User.class, responseContainer = "List")
    @RequestMapping(method = RequestMethod.GET, produces = { MediaType.APPLICATION_XML_VALUE,
	    MediaType.APPLICATION_JSON_VALUE }, value = "Users")
    @ResponseBody
    public user1list getEmployees()
    {
    	System.out.println(UberService.getUser1());
	return new user1list(new ArrayList<User>(UberService.getUser1()));
    }
	
    
    /*Gets User 2 details*/
    @ApiOperation(value = "Gets User 2 details", notes = "Retrieves all Employees details", response = User2.class, responseContainer = "List")
    @RequestMapping(method = RequestMethod.GET, produces = { MediaType.APPLICATION_XML_VALUE,
	    MediaType.APPLICATION_JSON_VALUE }, value = "User2")
    @ResponseBody
    public user2list getEmployees1()
    {
    	System.out.println(UberService.getUser2());
	return new user2list(new ArrayList<User2>(UberService.getUser2()));
    }
    
    
    @ApiOperation(value = "To Login",notes="Method for Login",response = login.class)
    @RequestMapping(value = "/Login/{id},{password}", method = RequestMethod.GET,produces = { MediaType.APPLICATION_JSON_VALUE,MediaType.APPLICATION_XML_VALUE, })
   
    @ResponseBody 
    public  String getEmployee(@PathVariable Integer id,@PathVariable String password,HttpSession session)  {
    
    	login employee = UberService.getEmployeeById(id,password);
     System.out.println(employee);
    
     
       
    List<String> list=new ArrayList<String>();
	
    list.add(employee.getUname());
    list.add(employee.getPassword());
    
   
    
    session.setAttribute("name", employee.getUname());
    session.setAttribute("password", employee.getPassword());
    
    
    String names="";
	int i=0;
	while(i<list.size())
    {
    	if(i<list.size()-1)
    		names+=list.get(i)+",";
    	else
    		names+=list.get(i);
    	i++;
    }
    
    System.out.println(names);
    return names;
	
    }
    

}
