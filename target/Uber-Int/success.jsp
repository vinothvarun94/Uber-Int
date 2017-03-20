<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="resources/js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Awesomess - Portfolio Bootstrap Theme</title>
    <meta name="description" content="Your Description Here">
    <meta name="keywords" content="bootstrap themes, portfolio, responsive theme">
    <meta name="author" content="ThemeForces.Com">
    
    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css"  href="resources/design/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="resources/design/fonts/font-awesome/css/font-awesome.css">

    <!-- Stylesheet
    ================================================== -->
    <link rel="stylesheet" type="text/css"  href="resources/design/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/design/css/responsive.css">

    <script type="text/javascript" src="resources/design/js/modernizr.custom.js"></script>

    <link href='http://fonts.googleapis.com/css?family=Raleway:500,600,700,100,800,900,400,200,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
            <link rel="stylesheet" type="text/css" href="resources/table/css/bootstrap.min.css">
            
            <!-- Main Style -->
            <link rel="stylesheet" type="text/css" href="resources/table/css/main.css">

            <!--Icon Fonts-->
            <link rel="stylesheet" media="screen" href="resources/table/fonts/font-awesome/font-awesome.min.css" />

</head>

<script>
var estimate=sessionStorage.getItem("estimate");
var productid=sessionStorage.getItem("productid");
var highestimate=sessionStorage.getItem("data");
var lowestimate=sessionStorage.getItem("low_estimate");
var duration=sessionStorage.getItem("duration");
var distance=sessionStorage.getItem("distance");
var uname=sessionStorage.getItem("firstname");


var firstname=sessionStorage.getItem("firstname");
var lastname=sessionStorage.getItem("lastname");
var mail=sessionStorage.getItem("mail");
var uuid=sessionStorage.getItem("uid");

//alert(estimate);
//alert(productid);
//alert(highestimate);
//alert(lowestimate);
//alert(duration);
//alert(distance);

$(document).ready(function()
		{
	
	$("#high").html(""+highestimate+"&#8377;");
	$("#uname").html("UserName:"+uname);
	$("#estimate").html("Estimate:"+estimate);
	$("#distance").html("Distance:"+distance+"km");
//	$("#distance").html("Duration:"+duration);

        var firstname=sessionStorage.getItem("firstname");
		var lastname=sessionStorage.getItem("lastname");
		var mail=sessionStorage.getItem("mail");
		var uuid=sessionStorage.getItem("uid");
		alert(firstname);
		alert(lastname);
		alert(mail);
		alert(uuid);
		
		 
	var search = {};


	search["firstname"]=firstname;
	search["lastname"]=lastname;
	search["email"]=mail;
	search["uuid"]=uuid;
	
	alert(search["firtstname"]);
	alert(search["lastname"]);
	alert(search["email"]);
	alert(search["uuid"]);
	
	
	
	
	$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "http://localhost:8080/Uber-Int/registration2",
			data : JSON.stringify(search),
			dataType : 'json',
			timeout : 100000,
			success : function(data)  {
			if(data)
				{
				alert("success");
				}
			else
				{
				//window.location.href="register.jsp";
				}

			}
		})
	
	
	
		});
		
	
</script>
<body>
<div id="tf-home">
        <div class="overlay">
            <div id="sticky-anchor"></div>
            <nav id="tf-menu" class="navbar navbar-default">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                      </button>
                      <a class="navbar-brand logo" href="index.jsp">Uber Integration</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                      <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">Home</a></li>
                        
                        <li><a href="profile.jsp">Uber Profile</a></li>
                        <li><a href="logout.jsp">Log-Out</a></li>
                      </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>

  
   <section  id="pricing-table">
            <div  class="container">
                
                    <div  class="pricing">
                       

                        <div style="visibility:hidden" class="col-md-4 col-sm-12 col-xs-12">
                            <div class="pricing-table">
                                <div class="pricing-header">
                                    <p class="pricing-title">Uber</p>
                                    <p  class="pricing-rate"> 20 </p>
                                    <a href="#" class="btn btn-custom">Ride Booked</a>
                                </div>

                                <div class="pricing-list">
                                    <ul>
                                        <li ><i class="fa fa-envelope"></i>10,000 messages</li>
                                        <li ><i class="fa fa-signal"></i><span>unlimited</span> data</li>
                                        <li ><i class="fa fa-user"></i><span>unlimited</span> users</li>
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                         <div class="col-md-4 col-sm-12 col-xs-12">
                            <div class="pricing-table">
                                <div class="pricing-header">
                                    <p class="pricing-title">Uber</p>
                                    <p id="high" class="pricing-rate"> 20 </p>
                                    <p>high estimate</p>
                                    <a href="#" class="btn btn-custom">Ride Booked</a>
                                </div>

                                <div class="pricing-list">
                                    <ul>
                                        <li id="estimate"><i class="fa fa-envelope"></i>10,000 messages</li>
                                        <li id="distance"><i class="fa fa-signal"></i><span>unlimited</span> data</li>
                                        <li id="uname"><i class="fa fa-user"></i><span>unlimited</span> users</li>
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
               
            </div>
        </section>
        
        <div class="content">
         
        
        </div>
        
    
      <div class="space"></div>

	<nav id="tf-footer">
        <div class="container">
             <div class="pull-left">
                <p>2017 ©. All Rights Reserved. Designed and Coded by kumaran systems</p>
            </div>
            <div class="pull-right"> 
                <ul class="social-media list-inline">
                    <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                    <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                    <li><a href="#"><span class="fa fa-pinterest"></span></a></li>
                    <li><a href="#"><span class="fa fa-google-plus"></span></a></li>
                    <li><a href="#"><span class="fa fa-dribbble"></span></a></li>
                    <li><a href="#"><span class="fa fa-behance"></span></a></li>
                </ul>
            </div>
        </div>
    </nav>
   </div>
   </div>
   
</body>
</html>