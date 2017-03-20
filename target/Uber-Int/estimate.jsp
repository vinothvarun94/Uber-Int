<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
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
  padding: 3.5rem; font-size: 1.2rem;
}
table#miyazaki tbody td { 
  padding: 2.2rem; font-size: 1.4rem;
  color: #444; background: #eee; 
}
table#miyazaki tbody tr:not(:last-child) { 
  border-top: 1.5px solid #ddd;
  border-bottom: 1.5px solid #ddd;  
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
    width: 9rem;  
  }
}
</style>
<!-- <script>
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

</script> -->
   
</head>
<body>
<%-- <%=request.getParameter("id") %>  --%>
	<script>
	
	//alert();

	$(document).ready(function()
			{
		
		var url = window.location.href; 
		var captured = /id=([^&]+)/.exec(url)[1]; 
		var result1 = captured ? captured : 'myDefaultValue';
		
		
		//alert(result1);
		sessionStorage.setItem("productid",result1);
		/* var lat=13.030184;
		var lon=80.238003; */
		var val=26;
		                               
		var lat=sessionStorage.getItem("ulatitude");
		var lon=sessionStorage.getItem("ulongitude");
		var partyLatitude = 13.028397;
		var partyLongitude = 80.250722;
		
			
		//alert("ll");
		//alert("<%=request.getParameter("id") %>");
		var id="<%=request.getParameter("id") %>";
		
		//alert(sessionStorage.getItem("ulatitude"));
		//alert(sessionStorage.getItem("ulongitude"));
		var s=sessionStorage.getItem("ulatitude");
		var s1=sessionStorage.getItem("ulongitude");
		var token=sessionStorage.getItem("token");
		//alert(token);
		
	
	    $.ajax({
	        url: "https://api.uber.com/v1.2/estimates/price",
	        headers: {
	        	Authorization: "Bearer " + token
	        },
	        data: { 
	        	start_latitude: lat,
	        	start_longitude: lon,
	        	end_latitude: partyLatitude,
	        	end_longitude: partyLongitude
	        },
	        success: function(response) 
	        {
	    		//alert(JSON.stringify(response));
	    		// 'results' is an object with a key containing an Array
	        	var data = response["prices"]; 
	        	var obj = $.parseJSON(JSON.stringify(response));
	        	for ( var key in obj )
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
							if(obj2[key2]==result1)
							{
								
								for ( var key2 in obj2)
							    {
									if(key2=="high_estimate")
										{
									//alert(key2);
									//alert(obj2[key2]);
									sessionStorage.setItem("data",obj2[key2]);
									
										}
									
									if(key2=="low_estimate")
									{
								//alert(key2);
								//alert(obj2[key2]);
								sessionStorage.setItem("low_estimate",obj2[key2]);
								
									}
									
									if(key2=="duration")
									{
								//alert(key2);
								//alert(obj2[key2]);
								sessionStorage.setItem("duration",obj2[key2]);
								
									}
									
									if(key2=="estimate")
									{
								//alert(key2);
								//alert(obj2[key2]);
								sessionStorage.setItem("estimate",obj2[key2]);
								
									}
									
									if(key2=="distance")
									{
								//alert(key2);
								//alert(obj2[key2]);
								sessionStorage.setItem("distance",obj2[key2]);
								
									}
									
									
									
									var td = tr.insertCell();
								    td.innerHTML= JSON.stringify(obj2[key2]).replace('"',' ').replace('"',' ');
								    if(key2=="currency_code")
									{
								//alert(key2);
								//alert(obj2[key2]);
								
								 td.innerHTML= JSON.stringify(obj2[key2]).replace('"',' ').replace('"',' ');
								
								td.innerHTML='<form action="success.jsp"><input name="id" type="hidden"  value='+obj2[key2]+'><input class="btn btn-primary my-btn2" name="submit" id="submit" type="submit"  value="Book Ride"></form>';
				                  
								
									}
							    }
							
						       
							}}}
						
					}
						}
	        	//window.location.href="estimate1.jsp";
	        	
	        	
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
                        <li><a href="logout.jsp">Log-Out</a></li>
                      </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>

            <div class="container">
          
            <h3 align="center">Ride Estimate</h3>
            
            <table  id="miyazaki">
			
				<tr>
					<th>Localized Display Name</th>
					<th>Distance</th>
				    <th>Display name</th>
					<th>Product Id</th>
					<th>High-Estimate</th>
					<th>Low-Estimate</th>
					 <th>Duration</th> 
					<th>Estimate</th> 
					<th>Book</th>
					
					
					
					
					
					
					
				</tr>
			
		</table>
		
          		  <div align="center" data-ng-app="ForEx" class="content">
        
		
		
		<div align="center" class="container">
    <div class="col-xs-5 col-sm-5 col-md-5 col-md-offset-3">
    <h3 align="center">ForEx Integration</h3>
        <div class="panel panel-default" data-ng-controller="ConvertCtrl" >
            <div class="panel-body">
                <form action="" method="POST" role="form">
                   
                    <div  class="form-group">
                            <label for="">From</label>
                            <select ng-model="fromType" class="form-control" required data-ng-change="forExConvert()" ng-options="k for (k, v) in rates track by v">
                                <option value="">--Select--</option>
                            </select>
						</div>
						<input type="hidden" ng-model="data1" />
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="">To</label>
                            <select ng-model="toType" class="form-control" required data-ng-change="forExConvert()" ng-options="k for (k, v) in rates track by v">
                                <option value="">--Select--</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <div  class="form-group">
                            <label for="">Estimated Amount</label>
                            <input type="text" class="form-control" placeholder="Enter value"  ng-model="fromValue"  ng-init="forExConvert()" ng-change="forExConvert()">
                        </div>
                         </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="">To Value</label>
                            <input type="text" class="form-control"  placeholder="Enter value" ng-model="toValue" ng-change="forExConvert()" >
                           
                            <p>{{toValue}}</p>
                        </div>
                    </div>
                    
                    

                </form>
            </div>
        </div>
    </div>
</div>
    </div>
    
    
   
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
		 <script type="text/javascript" src="resources/js/app.js"></script>

   
</body>
</html>