<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>




</head>
<body>
Hello
<script>


$(document).ready(function()
		{
	//alert("ll");
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
			
			if(response)
				
			{
				var n=JSON.stringify(response);
				var obj = JSON.parse(n);
				var a = obj.first_name;
				var b=obj.last_name;
				var c=obj.email;
				
				
		

			//   sessionStorage.setItem("SessionName","SessionData");
			
				document.getElementById("a").innerHTML=a;
				document.getElementById("b").innerHTML=b;
				document.getElementById("c").innerHTML=c;
				 
			}
			else
				{
				//alert("Fail");
				}
		}
	});

});




</script>
	<label id="a"></label>
	<label id="b"></label>
	<label id="c"></label>
</body>
</html>