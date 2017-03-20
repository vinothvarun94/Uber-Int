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

 
<style>
table#miyazaki { 
  margin: 0 auto;
  border-collapse: collapse;
  font-family: Agenda-Light, sans-serif;
  font-weight: 100; 
  background: #333; color: #fff;
  text-rendering: optimizeLegibility;
  border-radius: 5px; 
}
table#miyazaki caption { 
  font-size: 2rem; color: #444;
  margin: 1rem;
  background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/miyazaki.png), url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/miyazaki2.png);
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center left, center right; 
}
table#miyazaki thead th { font-weight: 600; }
table#miyazaki thead th, table#miyazaki tbody td { 
  padding: .8rem; font-size: 1.4rem;
}
table#miyazaki tbody td { 
  padding: .8rem; font-size: 1.4rem;
  color: #444; background: #eee; 
}
table#miyazaki tbody tr:not(:last-child) { 
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;  
}

@media screen and (max-width: 600px) {
  table#miyazaki caption { background-image: none; }
  table#miyazaki thead { display: none; }
  table#miyazaki tbody td { 
    display: block; padding: .6rem; 
  }
  table#miyazaki tbody tr td:first-child { 
    background: #666; color: #fff; 
  }
	table#miyazaki tbody td:before { 
    content: attr(data-th); 
    font-weight: bold;
    display: inline-block;
    width: 6rem;  
  }
}
</style>
<script>
var headertext = [],
headers = document.querySelectorAll("#miyazaki th"),
tablerows = document.querySelectorAll("#miyazaki th"),
tablebody = document.querySelector("#miyazaki tbody");

for(var i = 0; i < headers.length; i++) {
  var current = headers[i];
  headertext.push(current.textContent.replace(/\r?\n|\r/,""));
} 
for (var i = 0, row; row = tablebody.rows[i]; i++) {
  for (var j = 0, col; col = row.cells[j]; j++) {
    col.setAttribute("data-th", headertext[j]);
  } 
}

</script>
</head>
<body>
	<script>
	
	$(document).ready(function()
			{
		//alert("ll");
		//alert(sessionStorage.getItem("ulatitude"));
		//alert(sessionStorage.getItem("ulongitude"));
		var lat=sessionStorage.getItem("ulatitude");
		var lon=sessionStorage.getItem("ulatitude");
		var token=sessionStorage.getItem("token");
		//alert(token);
		
	
	   		$.ajax({
			type : "GET",
			async:false,
			url : "https://api.uber.com/v1.2/products?latitude=13.082680199999999&longitude=80.2707184" ,
			
			
			
			headers: 
			{
		    	Authorization: "Bearer "+token
		    },
		    
		   
			
			success: function(response)
			{
				
				if(response)
					
				{
					var n=JSON.stringify(response);
					
					var obj = $.parseJSON(JSON.stringify(response));

					for ( var key in obj)
					{
						var obj1 = obj[key];

						for ( var key1 in obj1) 
						{
							var obj2 = obj1[key1];
							var table = document.getElementById("miyazaki");
							    var tr = table.insertRow();
							for ( var key2 in obj2)
							      {
								
			                       if(key2=="product_id")
			                    	   {
								var td = tr.insertCell();
								//alert(obj2[key2]);
								var k=obj2[key2];
							    td.innerHTML= JSON.stringify(obj2[key2]).replace('"',' ').replace('"',' ');
							    var td1 = tr.insertCell();
							    td1.innerHTML='<form action="estimate.jsp"><input name="id" type="hidden"  value='+obj2[key2]+'><input class="btn btn-primary my-btn2" name="submit" type="submit"  value="Get Estimates"></form>';
			                    	   }
			                       if(key2=="display_name")
		                    	   {
							var td = tr.insertCell();
						    td.innerHTML= JSON.stringify(obj2[key2]).replace('"',' ').replace('"',' ');
		                    	   }
			                       if(key2=="description")
		                    	   {
			                    	  
							var td = tr.insertCell();
						    td.innerHTML= JSON.stringify(obj2[key2]).replace('"',' ').replace('"',' ');
						   
						   
						    
		                    	   }
			                    }
					     	}
					   }
			         }
				else
					{
					//alert("Fail");
					}
			      }
		      });

	         });

</script>



		
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
                        <li><a href="invitation.jsp">Home</a></li>
                        
                        <li><a href="profile.jsp">Uber Profile</a></li>
                        <li><a href="logout.jsp">LogOut</a></li>
                      </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>

            <div class="container">
            
              <div class="content">
              <h2 align="center">Available Products</h2>
            <h4 align="center">(for your location)</h4>
             <table  id="miyazaki">
			
				<tr align="center">
					<!-- <th>upfront_fare_enabled</th>
					<th>capacity</th> -->
				    <th align="center">Product ID</th>
					<!-- <th>image</th> -->
					<!-- <th>cash_enabled</th>
					<th>shared</th>
					<th>short_description</th> -->
					<th align="center">--**--</th>
					<th align="center">Display Name</th>
					<!-- <th>product_group</th> -->
					<th align="center">Description</th>
					
					
					
				</tr>
			
		</table>
		  <div class="container">
        </div>
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
    </div>
   
</body>

</html>