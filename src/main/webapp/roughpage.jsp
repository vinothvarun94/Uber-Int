<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<script>

$( window ).on( "load", function() {

	var url = "http://localhost:8080/Emailmarketing/dashboard.html?code=mgK7zSeqY1zhmlJOOWa1MaaUZbI&username=dsabarishcse%40gmail.com"; 
	var captured = /code=([^&]+)/.exec(url)[1]; 
	var result = captured ? captured : 'myDefaultValue';
	//alert(result);
	sessionStorage.setItem("result",result);
	window.location="refer.jsp";
	
	
});

</script>
<body >

</body>
</html>