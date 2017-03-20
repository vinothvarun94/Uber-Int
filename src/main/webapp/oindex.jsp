<html data-ng-app="ForEx">
	<head>
		<title>Uber Ride Estimate</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="css/normalize.css">
		<link rel="stylesheet" href="css/style.css">
		
		 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="resources/js/jquery.ajax-cross-origin.min.js"></script>
<script src="resources/js/jquery.formdata.js"></script>
<style>
	body 
{
  margin:0px;
  background-color:rgba(51, 51, 51, 1);
  background-image:none;
  position:static;
  left:auto;
  width:798px;
  margin-left:0;
  margin-right:0;
  text-align:left;
}
	#collect
{
margin-top:300px;
margin-left:400px;
}	

#table
{
margin-top:50px;
margin-left:100px;

}
	table
{
    border-collapse: collapse;
    width: 80%;
	
}

th, td 
{
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th 
{
    background-color: #4CAF50;
    color: white;
}

td,tr,th
{
padding-left:10px;
padding-right:10px;
}

</style>
	
<script>
	var a;
	alert("script");
	$(document).ready(function()
	{
		//alert("djfg");
	    var token="eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZXMiOlsiaGlzdG9yeSIsImhpc3RvcnlfbGl0ZSIsInBsYWNlcyIsInByb2ZpbGUiLCJyaWRlX3dpZGdldHMiXSwic3ViIjoiMGRmNTY3YjgtMjhhYS00NTI1LWIyZDYtY2EwZDcyNjAwM2VjIiwiaXNzIjoidWJlci11czEiLCJqdGkiOiJjM2QxMjUwMS1jMmQzLTRjODgtODc4OS0yNzczOTIxZmE0YmMiLCJleHAiOjE0ODk4MzMwMzAsImlhdCI6MTQ4NzI0MTAzMCwidWFjdCI6Ilh6ckZucG9FVHRLR09selBQaXVEOVlqYXdtaEx2RSIsIm5iZiI6MTQ4NzI0MDk0MCwiYXVkIjoiNmlCTGphNEx1dXdVemRqdl9nQXhWUkdQWVFjSjlmZnQifQ.FY9iNW4yN-HD4Ca0IWUZBnEoCzqMLjjGkJQ5kKhegqQ3gPSVwxY3Nxt9PrmykOlm5nErYozWQJOh3Dp-cSW5M-q9Z63DQRVpoaTPPa8HdlHHf1GxjsYX3nRF0MtYqdhI2E4zzakq_6vU0lgR1qg7xP_ckvtpK-aEoswjQHE9kayYLP7Dt_lFbyw5UsOVOXuppWshWOb6JyhmgKhXNtB0iy9A6HjspycYrEKcgVUshZb-KHIMP48bXLQUXfYMmG9uDFfWFP2Sg6bdf4PL9Dhbz37k352uuosjcyRpWmKoyOpob1LgzxJBlnmVF0ltS50gBS6bmt7T-CpyvgQRp4KvAA";
		$.ajax({
			type : "GET",
			async:false,
			url : "https://api.uber.com/v1.2/me",
			headers: {
		    	Authorization: "Bearer "+token
		    },
			success: function(response)
			{
				if(response){
					var n=JSON.stringify(response);
					var obj = JSON.parse(n);
					var a = obj.first_name;
					var b=obj.last_name;
					var c=obj.email;
					//alert(a);
					document.getElementById("a").innerHTML=a;
					document.getElementById("b").innerHTML=b;
					document.getElementById("c").innerHTML=c;
				}
				else{
					alert("Fail");
				}
			}
		});
	});
</script>
<script>
	// Uber API Constants
	// Security note: these are visible to whomever views the source code!
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
 	// Great resource: https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation
	navigator.geolocation.watchPosition(function(position) 
	{
		// Update latitude and longitude
		userLatitude = position.coords.latitude;
		userLongitude = position.coords.longitude;
		sessionStorage.setItem("ulatitude",userLatitude);
		sessionStorage.setItem("ulongitude",userLongitude);
		console.log(position);
		getEstimatesForUserLocation(userLatitude, userLongitude);
	});
	function getEstimatesForUserLocation(latitude,longitude) 
	{
		console.log("Requesting updated time estimate...");
	  	$.ajax
	  	({
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
		    success: function(response) 
	    	{
				alert(JSON.stringify(response));
			  	console.log(JSON.stringify(response));
		    	// 'results' is an object with a key containing an Array
		    	var data = response["prices"]; 
		    	if (typeof data != typeof undefined) 
		    	{
		    		// Sort Uber products by time to the user's location 
	    			data.sort(function(t0, t1) {
	    				return t0.duration - t1.duration;
	    			});
	    	  	}
	
	    		// Update the Uber button with the shortest time
	    		var shortest = data[0];
	    		if (typeof shortest != typeof undefined) 
				{
	    			console.log("Updating time estimate...");
					$("#time").html("IN " + Math.ceil(shortest.duration / 60.0) + " MIN");
	    		}
				var price = data[0];
	    		if (typeof price != typeof undefined) {
	    			console.log("Updating price estimate...");
					$("#price").html("IN " + Math.ceil(price.low_estimate) + " RS");
					document.getElementById("mytext").value() = price.low_estimate;
					var type1=price.low_estimate;
	    		}
			}
    	});
	};
	

</script>

	</head>
	<body>
         <label id="a"></label>
	        <label id="b"></label>
	        <label id="c"></label>     
	<nav class="navbar navbar-default">
  
    </nav>
		<section>
			<h1 id="a">Destination</h1>
			<div class="info-container">
				<span class="info-header">Where</span>
				<span class="info where"></span>
			</div>
			<img class="map" src="http://maps.googleapis.com/maps/api/staticmap?center=13.028397,80.250722&zoom=17&format=png&sensor=false&size=280x280&maptype=roadmap&style=element:geometry.fill|color:0xf4f4f4&markers=color:red|13.028397,80.250722&scale=2" alt="">
			<a href="#">
				<div class="button">
					<p id="time">ESTIMATING TIME</p>
				   
				</div>
				
				<div class="button" >
					
				   <p id="price" >ESTIMATING PRICE</p>
				</div>
				<div class="button" >
					
				   <p id="price" >ESTIMATING PRICE</p>
				</div>
				<button class="button" onclick="location.href = 'ride.jsp';">See Products</button>
				</a>
		</section>
		<script src="resources/js/jquery-2.1.1.min.js"></script>
			  <div  class="container">
    		<div class="row">
    <div class="col-xs-5 col-sm-5 col-md-5 col-md-offset-3">
        <div class="panel panel-default" data-ng-controller="ConvertCtrl">
            <div class="panel-body">
                <form action="" method="POST" role="form">
                   
                        <div  class="form-group" >
                            <label for="">ForEx Multi-Currency</label>
                            <input  type="number" class="form-control" placeholder="Enter value"  data-ng-model="fromValue" data-ng-change="forExConvert()" >
							
                        </div>
                    
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="">To</label>
                            <select ng-model="toType" class="form-control" required data-ng-change="forExConvert()" ng-options="k for (k, v) in rates track by v">
                                <option  value="">--Select--</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="">To Value</label>
                            <input type="text" class="form-control" placeholder="Enter value" data-ng-model="toValue" data-ng-change="forExConvert()">
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
    </div>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script src="resources/js/app.js"></script>
  
  <table class="table table-hover table-bordered" id="table1">
			<thead style="background-color: #bce8f1;">
				<tr>
					<th>localized_display_name</th>
					<th>distance</th>
				    <th>display_name</th>
					<th>product_id</th>
					<th>high_estimate</th>
					<th>Surge-Multiplier</th>
					<th>Minimum</th>
					<th>low-estimate</th>
					<th>Time Duration</th>
					<th>Estimate</th>
					<th>currency code</th>
					
				</tr>
			</thead>
		</table>
	</body>
</html>