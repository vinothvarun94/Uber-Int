<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/normalize.css">
<link rel="stylesheet" href="resources/css/style.css">
<meta charset="utf-8">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="resources/js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Party Invitation</title>

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


<script>
	
	alert();
	var uberClientId = "6iBLja4LuuwUzdjv_gAxVRGPYQcJ9fft"
	, uberServerToken = "9KY9xKJAVcKKp0AJSYlL8ijc6fqZeV5jheQEndak"; 

// Create variables to store latitude and longitude
	var userLatitude
	, userLongitude
	, partyLatitude = 13.028397
	, partyLongitude = 80.250722;
	
	var type1;

// Create variable to store timer
	var timer;
	
	var firstname=sessionStorage.getItem("firstname");
	var lastname=sessionStorage.getItem("lastname");
	var mail=sessionStorage.getItem("mail");
	var uid=sessionStorage.getItem("uid");
	//alert(firstname);
	
	console.log(sessionStorage.getItem("token"));
	
	
	// td.innerHTML=firstname;
 
// Great resource: https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation
	navigator.geolocation.watchPosition(function(position) {
		// Update latitude and longitude
		userLatitude = position.coords.latitude;
		userLongitude = position.coords.longitude;
		sessionStorage.setItem("ulatitude",userLatitude);
		console.log(userLatitude);
		console.log(userLongitude);
		
		sessionStorage.setItem("ulongitude",userLongitude);
		console.log(position);
	    
		// Create timer if needed
		// Once initialized, it will fire every 60 seconds as recommended by the Uber API
		// We only create the timer after we've gotten the user's location for the first time 
		if (typeof timer === typeof undefined) {
			timer = setInterval(function() {
				getEstimatesForUserLocation(userLatitude, userLongitude);
			}, 60000);
	
			// Query Uber API the first time manually
			getEstimatesForUserLocation(userLatitude, userLongitude);
		}
	});

function getEstimatesForUserLocation(latitude,longitude) 
{
	
	console.log("Requesting updated time estimate...");
  $.ajax({
    url: "https://api.uber.com/v1/estimates/price",
    headers: {
    	Authorization: "Token " + uberServerToken
    },
    data: { 
    	start_latitude: latitude,
    	start_longitude: longitude,
    	end_latitude: partyLatitude,
    	end_longitude: partyLongitude
    },
    success: function(response) {
		alert(JSON.stringify(response));
		// 'results' is an object with a key containing an Array
    	var data = response["prices"]; 
    	if (typeof data != typeof undefined) 
    	{
    		// Sort Uber products by time to the user's location 
	    	data.sort(function(t0, t1) {
	    		return t0.duration - t1.duration;
	    	});
	    		// Update the Uber button with the shortest time
	   		var shortest = data[0];
	   		if (typeof shortest != typeof undefined) 
			{
	   			console.log("Updating time estimate...");
				$("#time").html("Reach There in: " + Math.ceil(shortest.duration / 60.0) + " MIN");
				$("#note").html("Welcome ,"+firstname);
	   		}
			var price = data[0];
	   		if (typeof price != typeof undefined) {
	    		console.log("Updating price estimate...");
				$("#price").html("Minimum Estimate: " + Math.ceil(price.low_estimate) + " RS");
				document.getElementById("mytext").value() = price.low_estimate;
				var type1=price.low_estimate;
    		}
	
    	}
    }
  });
}
/* alert(sessionStorage.getItem("token"));
alert(sessionStorage.getItem("firstname"));
alert(sessionStorage.getItem("lastname"));
alert(sessionStorage.getItem("mail"));
 */
 

</script>
</head>
<style>

img {
    width: 100%;
    height: auto;
}

</style>
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

            <div class="container">
                <div class="container">
                    <h1>Event Invitation</h1>
                    <h3 id="note" align="center"></h3>
                    <h4 id="note"></h4>
                    <h2 id=""></h2>
                    <h3 align="center">Online Invitation with Uber Integration</h3>
                   
                    <br>
                    <!-- <a href="#tf-contact" class="btn btn-primary my-btn">Contact</a>
                    <a href="#tf-portfolio" class="btn btn-primary my-btn2">Portfolio</a> -->
     <div id="container">
			
			
			 
	 	<!-- <img  class="map" src="resources/img/map.png" alt=""/ > -->
	 
	   
               <section>
                
               <h1>Destination</h1>
                     <img src="resources/img/map.png" class="img-rounded" width="50" height="100" >
                    <!-- <img class="img-rounded" width="50" height="100" src="http://maps.googleapis.com/maps/api/staticmap?center=13.028397,80.250722&zoom=17&format=png&sensor=false&size=280x280&maptype=roadmap&style=element:geometry.fill|color:0xf4f4f4&markers=color:red|13.028397,80.250722&scale=2" alt=""/>
            -->     <div class="button">
				<p id="time" align="center">ESTIMATING TIME</p>
				
			</div>
			<div class="button">
			   <p id="price" align="center">ESTIMATING PRICE</p>
			</div>
			
                 </section>
      	<a href="ride.jsp">
	<div class="button1">
	
	<p id="serv" style="color:white" >Get Available Services</p>
	
	
	</div>
	</a>
                    
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
</body>
</html>