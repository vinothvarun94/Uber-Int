<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
   
</head>
<body>
<%-- <%=request.getParameter("id") %>  --%>
	<script>
	//alert();

	$(document).ready(function()
			{
		
		var url = window.location.href; 
		var captured = /id=([^&]+)/.exec(url)[1]; 
		var result1 = captured ? captured : 'myDefaultValue';
		//alert(result1);
			
		/* var lat=13.030184;
		var lon=80.238003; */
		var val=26;
		
		var lat=sessionStorage.getItem("ulatitude");
		var lon=sessionStorage.getItem("ulongitude");
		var partyLatitude = 13.028397;
		var partyLongitude = 80.250722;
		
			
		//alert("ll");
		//alert("<%=request.getParameter("id") %>");
		var id="<%=request.getParameter("id") %>";
		
		//alert(sessionStorage.getItem("ulatitude"));
		//alert(sessionStorage.getItem("ulongitude"));
		var s=sessionStorage.getItem("ulatitude");
		var s1=sessionStorage.getItem("ulongitude");
		var token=sessionStorage.getItem("token");
		//alert(token);
		
		
		
		
	    
	    $.ajax({
	        url: "https://api.uber.com/v1.2/estimates/price",
	        headers: {
	        	Authorization: "Bearer " + token
	        },
	        data: { 
	        	start_latitude: lat,
	        	start_longitude: lon,
	        	end_latitude: partyLatitude,
	        	end_longitude: partyLongitude
	        },
	        success: function(response) {
	    		//alert(JSON.stringify(response));
	    		// 'results' is an object with a key containing an Array
	        	var data = response["prices"]; 
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
							if(key2=="product_id")
							{
							if(obj2[key2]==result1)
							{
								
								for ( var key2 in obj2)
							    {
									if(key2=="high_estimate")
										{
									//alert(key2);
									//alert(obj2[key2]);
									sessionStorage.setItem("data",obj2[key2]);
									
								
										}
									var td = tr.insertCell();
								    td.innerHTML= JSON.stringify(obj2[key2]).replace('"',' ').replace('"',' ');
							    }
							
						       
							}}}
						
					}
				}
	        	
	        	
	        	
	        }
	      });
	});

	


</script>
	

<table  id="table1">
			<thead style="background-color: #bce8f2;">
				<tr>
					<th>Localized Display Name</th>
					<th>Distance</th>
				    <th>Display name</th>
					<th>Product Id</th>
					<th>High-Estimate</th>
					<th>Low-Estimate</th>
					 <th>Duration</th> 
					<th>Estimate</th> 
					<th>Currency Code</th>
					
					
					<th><button value="ride now" ></button></th>
					
					
				</tr>
			</thead>
		</table>
		 <script type="text/javascript" src="resources/js/app.js"></script>
		  <div data-ng-app="ForEx" class="container">
        
		
		
		<div class="row">
    <div class="col-xs-5 col-sm-5 col-md-5 col-md-offset-3">
        <div class="panel panel-default" data-ng-controller="ConvertCtrl" ng-init="data1='120'" >
            <div class="panel-body">
                <form action="" method="POST" role="form">
                   
                    <div class="form-group">
                            <label for="">From</label>
                            <select ng-model="fromType" class="form-control" required data-ng-change="forExConvert()" ng-options="k for (k, v) in rates track by v">
                                <option value="">--Select--</option>
                            </select>
						</div>
						<input type="hidden" ng-model="data1" />
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="">To</label>
                            <select ng-model="toType" class="form-control" required data-ng-change="forExConvert()" ng-options="k for (k, v) in rates track by v">
                                <option value="">--Select--</option>
                            </select>
                        </div>
                    </div>
                    <div  class="form-group">
                            <label for="">From Value</label>
                            <input type="text" class="form-control" placeholder="Enter value"  ng-model="fromValue"  ng-init="forExConvert()" ng-change="forExConvert()">
                        </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="">To Value</label>
                            <input type="text" class="form-control"  placeholder="Enter value" ng-model="toValue" ng-change="forExConvert()">
                            <p>{{toValue}}</p>
                        </div>
                    </div>
                    
                    

                </form>
            </div>
        </div>
    </div>
</div>
    </div>
   
</body>
</html>