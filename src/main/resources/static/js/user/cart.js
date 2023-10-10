const app = angular.module("userApp", []);
app.controller("cartCtrl", function ($scope,$rootScope) {
    $rootScope.listItemCart = JSON.parse(localStorage.getItem("items"));
    $scope.addToLocal = function(){

    }
});