<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>

$(document).ready(function()
		{
	alert("ll");
	//alert(sessionStorage.getItem("ulatitude"));
	//alert(sessionStorage.getItem("ulongitude"));
	var lat=sessionStorage.getItem("ulatitude");
	var lon=sessionStorage.getItem("ulatitude");
	var token=sessionStorage.getItem("token");
	alert(token);
	

   		$.ajax
   		({
		type : "PUT ",
		async:false,
		url : "https://sandbox-api.uber.com/v1.2/requests" ,
		
		
		
		headers: 
		{
			
	    	Authorization: "Bearer "+token
	    },
	    
	    data:
	    { "fare_id": "abcd",
	    	"product_id": "a1111c8c-c720-46c3-8534-2fcdd730040d", 
	    	"start_latitude": 37.761492,
	    	"start_longitude": -122.423941, 
	    	"end_latitude": 37.775393,
	    	"end_longitude": -122.417546 
	    } ,
	    
	    statusCode: 
	    {
	        200: function (response)
	        {
	           alert("200");
	           
	        }
	    } ,
	    
	    success: function(response)
	    {
	    	alert(response);
	    }
		
		
	      });

         });



</script>

</head>
<body>

</body>
</html>