<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="resources/js/jquery.formdata.js"></script>
</head>
<script>

$( window ).on( "load", function() 
		{
			
			
	var token=sessionStorage.getItem("token");
			
		 	 $.ajaxFormData
		 	({
	        	 method: 'POST',
		         url : 'https://login.uber.com/oauth/v2/revoke', 
		         dataType : 'json', 
		         data: 
		         {
		             'client_secret': 'zlPgyik2ScFFAqT0r8XuxPBMZht1v2oAqZfrT7Jk',
		             'client_id': '6iBLja4LuuwUzdjv_gAxVRGPYQcJ9fft',
		             'token': token
		         },
		         processData : false,
		         contentType : false, 
		         
				 success: function(response)
				 {
					alert("logout");
					
					
				 }
		        
			
	     }); 
		 	
		 	window.location.href="index1.jsp";
		 	
		 	
	}); 


</script>
<body>

</body>
</html>