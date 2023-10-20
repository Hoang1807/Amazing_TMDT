const app = angular.module("checkoutApp", []);
app.controller("checkoutCtrl", function ($scope, $rootScope, $http) {
    $rootScope.listItemCart = JSON.parse(localStorage.getItem("items"));
    $scope.cartItems = $rootScope.listItemCart;
    $scope.quantiType = 1 ;
    $scope.totalProduct = 0;
    $scope.totalCart = 0;
    if(!$rootScope.listItemCart) $rootScope.listItemCart = [];

    $scope.saveLocal = function(){
        localStorage.setItem("items",JSON.stringify($rootScope.listItemCart));
    }

    $scope.getTotalCart = function(){
        console.log("show total checkout");
        return $rootScope.listItemCart.reduce(function(total, e) {
            return total + e.total;
        }, 0);
    }

    $scope.SizeCart = function(){
        return $rootScope.listItemCart.length;
    }

    $scope.binhAn = function(){
        $http({
            method: 'POST',
            url: "/checkout",
            data: `idProduct=${User.name}&idType=${User.email}` + (isConfrim ? `&password=${User.password}&otp=${User.otp}` : ''),
            headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Captcha-Token': token}
        }).then(
			function successCallback(response){			// Nếu thành công
				console.log(response.data)
			},
			function errorCallback(response) { 			// Nếu thất bại
				console.log(response)
			}
		)
    }

});