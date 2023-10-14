let domain = "http://localhost:8080/api";
const app = angular.module("detailApp", []);
app.controller("detailCtrl", function ($scope,$rootScope,$http) {
    $rootScope.listItemCart = JSON.parse(localStorage.getItem("items"));
    $scope.quantiType = 1 ;
    
    if(!$rootScope.listItemCart) $rootScope.listItemCart = [];
    $scope.addToLocal = function(productId, typeId, quanti, image, price, productName){
        console.log($scope.quantiType);
        var item = {
			IDPro: productId,
			TypeID: typeId,
			Quantity: quanti,
			Img: image,
            Price: price,
            ProductName: productName
		};
        var notExist = true;
        $rootScope.listItemCart.forEach(i => {
            if (i.TypeID == item.TypeID) { i.Quantity += 1 * 1; notExist = false; }
        }); 
        var sum =0;
        if (notExist) $rootScope.listItemCart.push(item)
        sum += item.Price * item.Quantity
        console.log(item.IDPro);
        localStorage.setItem("items",JSON.stringify($rootScope.listItemCart));
    }
    

    $scope.SizeCart = function(){
        console.log("12", $rootScope.listItemCart.length);
        return $rootScope.listItemCart.length;
    }

    $scope.plusProduct = function(){
        return  $scope.quantiType++;
    }

    $scope.minusProduct = function(){
        return  $scope.quantiType--;
    }
});