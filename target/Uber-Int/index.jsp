<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="resources/js/jquery.ajax-cross-origin.min.js"></script>
<script src="resources/js/jquery.formdata.js"></script>
</head>
<script>
var token;
var obj;
var firstname;
var lastname;
var mail;
var uid;
var code;



$( window ).on( "load", function() 
	{
		var url = window.location.href; 
		var captured = /code=([^&]+)/.exec(url)[1]; 
		var result = captured ? captured : 'myDefaultValue';
		//alert(result);
		sessionStorage.setItem("result",result);
		code=sessionStorage.getItem("result");
		//alert(code);
		var fd = new FormData();    
	    fd.append( "client_secret", "zlPgyik2ScFFAqT0r8XuxPBMZht1v2oAqZfrT7Jk" );
		fd.append( "client_id", "6iBLja4LuuwUzdjv_gAxVRGPYQcJ9fft" );
		fd.append( "grant_type", "authorization_code" );
		fd.append( "redirect_uri", "http://localhost:8080/uber/index.jsp" );
		fd.append( "code", result);
		
/* 
	$.ajax({
		type : 'POST',
		url : 'https://login.uber.com/oauth/v2/token', 
	   dataType : 'json', 
		data: fd,
		crossOrigin: true,
		  processData: false,
		  contentType: false,
		success: function(response)
		{
			alert("success");
			alert(JSON.stringify(response));
		},
		error: function(response) 
		{
			alert("error");
			alert(JSON.stringify(response));
			w.innerHTML=JSON.stringify(response);
		}
		});  */
		
	 	$.ajaxFormData( {
        	 method: 'POST',
	         url : 'https://login.uber.com/oauth/v2/token', 
	         dataType : 'json', 
	         data: {
	             'client_secret': 'zlPgyik2ScFFAqT0r8XuxPBMZht1v2oAqZfrT7Jk',
	             'client_id': '6iBLja4LuuwUzdjv_gAxVRGPYQcJ9fft',
	             'grant_type': 'authorization_code',
	             'redirect_uri': 'http://localhost:8080/Uber-Int/index.jsp',
	             'code': code ,
	             'scope': 'request.delegate.tos_accept'
	         },
	         processData : false,
	         contentType : false, 
			 success: function(response)
			 {
				//alert("success");
				//alert(JSON.stringify(response));
				var x=JSON.stringify(response);
				//alert(x);
				var obj = $.parseJSON(JSON.stringify(response));
			//	alert(obj["access_token"]);
				token=obj["access_token"];
				//alert(token);
				sessionStorage.setItem("token",token);
				console.log(token);
				$.ajax({
					method : "GET",
					async:false,
					url : "https://api.uber.com/v1.2/me",
					headers: 
					{
				    	Authorization: "Bearer "+token
				    },
					success: function(response)
					{
						if(response){
							var n=JSON.stringify(response);
							//alert(n);
							obj = JSON.parse(n);
							firstname = obj.first_name;
							lastname=obj.last_name;
							mail=obj.email;
							uid=obj.uuid;
							alert(uid);
							alert(firstname);
							alert(lastname);
							alert(mail);
							sessionStorage.setItem("token",token);
							console.log(token);
							sessionStorage.setItem("firstname",firstname);
							sessionStorage.setItem("lastname",lastname);
							sessionStorage.setItem("mail",mail);
							sessionStorage.setItem("uid",uid);
							
							var search = {};
							
							search["firstname"]=firstname;
							search["lastname"]=lastname;
							search["email"]=mail;
							search["uuid"]=uid;
							alert(search);
							
							
							$.ajax({
								type : "POST",
								contentType : "application/json",
								url : "http://localhost:8080/Uber-Int/registration",
								data : JSON.stringify(search),
								dataType : 'json',
								timeout : 100000,
								success : function(data)  
								{
								if(data)
									{
									alert(data);
									window.location.href="invitation.jsp";
									}
								else
									{
									
									}

								}
							});
							
						
						}
						else
						{
							alert("Fail");
						}
					}
				});
			},
		error: function(response) 
		{
			//alert("error");
			//alert(JSON.stringify(response));
			w.innerHTML=JSON.stringify(response);
		}
     });
}); 
</script>
<body >
  <p id="w"></p>
</body>
</html>