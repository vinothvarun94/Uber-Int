<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<script>


$(document).ready(function()
		{
	//alert();
	var fd = new FormData();    
                                 
	fd.append( 'client_secret', "zlPgyik2ScFFAqT0r8XuxPBMZht1v2oAqZfrT7Jk" );
	fd.append( 'client_id', "6iBLja4LuuwUzdjv_gAxVRGPYQcJ9fft" );
	fd.append( 'grant_type', "authorization_code" );
	fd.append( 'redirect_uri', "http://localhost:8080/uber/index.jsp" );
	fd.append( 'code', "SLePZBHR86okofFiOypg8i9J4q81mC#_" );
	
	$.ajax({
	  url: 'https://login.uber.com/oauth/v2/token',
	  data: fd,
	  dataType : 'json',
	  processData: false,
	  contentType: false,
	  type: 'POST',
	  success: function(response)
	  {
	   // alert(response);
	  }
	});
	
});








</script>
</body>
</html>