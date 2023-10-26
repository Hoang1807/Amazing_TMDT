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


});