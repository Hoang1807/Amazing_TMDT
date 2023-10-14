let domain = "http://localhost:8080/api";
const app = angular.module("cartApp", []);
app.controller("cartCtrl", function ($scope,$rootScope) {
    $rootScope.listItemCart = JSON.parse(localStorage.getItem("items"));
    $scope.cartItems = $rootScope.listItemCart;
    $scope.quantiType = 1 ;
    $scope.totalProduct = 0;
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
        if (notExist) $rootScope.listItemCart.push(item)
        console.log(item.IDPro);
        localStorage.setItem("items",JSON.stringify($rootScope.listItemCart));
    }
    // var url = `${domain}/products?${$scope.sorttype}&${temp}&${$scope.category}&${$scope.producer}&${$scope.minprice}&${$scope.maxprice}&${$scope.paramPage}`;
	// 	$http.get(url).then(response => {
	// 		$scope.items = response.data.data;
	// 		$scope.total = response.data.total;
	// 		$scope.countPage = $scope.total % $scope.itemsPerPage == 0 ? $scope.total / $scope.itemsPerPage : Math.ceil($scope.total / $scope.itemsPerPage);
	// 		$scope.listPage = $scope.getRange($scope.countPage);
	// 		console.log("Success", $scope.items);
	// 	}).catch(error => {
	// 		console.log("Error: ", error);
	// 	})

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