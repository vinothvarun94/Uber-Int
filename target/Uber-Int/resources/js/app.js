


var a=sessionStorage.getItem("data");


angular.module('ForEx', [])
    .controller('ConvertCtrl', ['$scope', '$http',function($scope, $http) {
        $scope.rates = {};
        $http.get('http://api.fixer.io/latest?base=ZAR')
            .then(function(res) {
                $scope.rates = res.data.rates;
                $scope.toType = $scope.rates.USD;
                $scope.fromType = $scope.rates.INR;
                $scope.fromValue = a;
                
            
                
                $scope.forExConvert();
            });
        $scope.forExConvert = function() {
            $scope.toValue = $scope.fromValue * ($scope.toType * (1 / $scope.fromType));
            $scope.toValue = $scope.toValue;
        };
    }]);
	
	