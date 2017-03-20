<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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

 <link rel="stylesheet" href="resources/login/style.css">


</head>
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
                      <a class="navbar-brand logo" href="index.html">Uber Integration</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                      <ul class="nav navbar-nav navbar-right">
                        <li><a href="#tf-home">Home</a></li>
                        
                        <li><a href="#tf-contact">About</a></li>
                      </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>

            <div class="container">
            
              
              <h1 align="center">Admin Login</h1>
			
		
		      <div id="login">
              <h1 id="header">Login</h1>
              <form> 
              <input type="text" placeholder="Username" id="username"></input><br />
              <input type="password" placeholder="Password" id="password"></input><br />
              <input type="button" value="Submit" id="submit"></input>
              </form>
              </div>
             
               
    
      <div class="space"></div>

	<nav id="tf-footer">
        <div class="container">
             <div class="pull-left">
                <p>2015 © Awesomess. All Rights Reserved. Designed and Coded by <a href="https://dribbble.com/jennpereira">Jenn</a> for <a href="https://themeforces.com">ThemeForces.Com</a></p>
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
    </div>
    <script src="resources/login/index.js"></script>
    <script>
    var search = {};
	$('#submit').click(function() {
		
		var id =$('#username').val();
		var password =$('#password').val();
		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : "http://localhost:8080/Uber-Int/Login/"+id+","+password,
			
			dataType : 'json',
			timeout : 100000,
			cache : false,
			success: function(response)
			{
			  
				var res = response.split(",");
				
				if(response!="")
				{
				var name=res[0];
				var pass=res[1];
				
				alert(name);
				if(pass==password)
					{
					window.location.href="content.jsp";
					}
				}
				
			}
		});
	});
    </script>
   
</body>

</html>