<html data-ng-app="Login">
	<head>
		<title>Welcome to Uber Ride</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="css/normalize.css">
		<link rel="stylesheet" href="css/style.css">
		
		 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		
	<style>

	body 
{
  margin:0px;
  background-color:rgba(51, 51, 51, 1);
  background-image:none;
  position:static;
  left:auto;
  width:1000px;
  height:4000px;
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

.button {
    background-color: #4CAF50;
    border: none;
    color: black;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

	</style>
	
	

	</head>
	<body>
	<div class="container">
	<div class="page-header">
    <h1><img src="resources/img/logo.png" class="img-thumbnail" alt="logo" width="75" height="75">Welcome To Uber Ride</h1>  
     
  </div>
  </div>
	
			<section>
			<h1>Uber Ride</h1>
			
			<img src="resources/img/uberlog.jpg" class="img-log" alt="uber" width="275" height="300">
			
			<div class="info-container">
				<span class="info-header"></span>
				<span class="info where"></span>
			</div>
			
			<script>
function log() {
    window.location.assign("https://login.uber.com/oauth/v2/authorize?client_id=6iBLja4LuuwUzdjv_gAxVRGPYQcJ9fft&response_type=code")
}
</script>
		
				<div>
				<input type="button" class="button" value="L O G I N"
 onclick="log()">
					<p id="login"></p>
				   
				</div>
				
				
		</section>
		<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
  
	</body>
</html>