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
navigator.geolocation.watchPosition(function(position) {
	// Update latitude and longitude
	userLatitude = position.coords.latitude;
	userLongitude = position.coords.longitude;
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

function getEstimatesForUserLocation(latitude,longitude) {
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
						/* var json = "<h4>Ajax Response</h4><pre>"
							+ JSON.stringify(response, null, 4) + "</pre>"; */
						var obj = $.parseJSON(JSON.stringify(response));

						for ( var key in obj )
						{
							var obj1 = obj[key];

							for ( var key1 in obj1) 
						    {
								var obj2 = obj1[key1];
								 var table = document.getElementById("table1");
								    var tr = table.insertRow();
								for ( var key2 in obj2)
								{
									var td = tr.insertCell();
								    td.innerHTML= JSON.stringify(obj2[key2]).replace('"',' ').replace('"',' ');
								}
							}
						}
    	console.log(JSON.stringify(response));

    	// 'results' is an object with a key containing an Array
    	var data = response["prices"]; 
    	if (typeof data != typeof undefined) {
    		// Sort Uber products by time to the user's location 
    		data.sort(function(t0, t1) {
    			return t0.duration - t1.duration;
    		});

    		// Update the Uber button with the shortest time
    		var shortest = data[0];
    		if (typeof shortest != typeof undefined) {
    			console.log("Updating time estimate...");
					$("#time").html("IN " + Math.ceil(shortest.duration / 60.0) + " MIN");
    		}
			
			
			var price = data[0];
    		if (typeof price != typeof undefined) {
    			console.log("Updating price estimate...");
					$("#price").html("IN " + Math.ceil(price.low_estimate) + " RS");
			
					var type1=price.low_estimate;
    		}
			
		
    	}
    }
  });
}



