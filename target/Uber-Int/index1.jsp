<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>uber login</title>
  
  
  
      <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      @import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(resources/img/img2.jpg);
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(50%  - 80px);
	left: calc(50% - 280px);
	z-index: 2;
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 500;
}

.header div span{
	color: brown !important;
}

.login{
	position: absolute;
	top: calc(50% - 92px);
	left: calc(50% - 10px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}
.icon{
	position: absolute;
	top: calc(50%  - 110px);
	left: calc(50% - 400px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.login input[type=button]{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=button]:hover{
	opacity: 0.8;
}

.login input[type=button]:active{
	opacity: 0.6;
}


.login input[type=button]:focus{
	outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
    </style>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body>

<script>
function log() 
{
    window.location.assign("https://login.uber.com/oauth/v2/authorize?client_id=6iBLja4LuuwUzdjv_gAxVRGPYQcJ9fft&response_type=code")
}
</script>

  <div class="body"></div>
		<div class="grad"></div>
		<div class="icon">
		<img src="resources/img/icon.png" alt="Uber" style="width:104px;height:88px;">
		</div>
		<div class="header">
			
			<div>UBER<span>  Integration</span></div>
		</div>
		<br>
		<div class="login">
				<input type="button" value="Login" onclick="log()">
		</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  
</body>
</html>
