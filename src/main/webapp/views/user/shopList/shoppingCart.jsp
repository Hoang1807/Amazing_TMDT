<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html ng-app="cartApp">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>
				<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
                <!-- Google Font -->
                <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
                <!-- Css Styles -->
                <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
                <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
                <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
                <link rel="stylesheet" href="/css/nice-select.css" type="text/css">
                <link rel="stylesheet" href="/css/jquery-ui.min.css" type="text/css">
                <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
                <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
                <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body ng-controller="cartCtrl">

    <jsp:include page="../header.jsp"></jsp:include>

    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="#">Fresh Meat</a></li>
                            <li><a href="#">Vegetables</a></li>
                            <li><a href="#">Fruit & Nut Gifts</a></li>
                            <li><a href="#">Fresh Berries</a></li>
                            <li><a href="#">Ocean Foods</a></li>
                            <li><a href="#">Butter & Eggs</a></li>
                            <li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                            <li><a href="#">Oatmeal</a></li>
                            <li><a href="#">Fresh Bananas</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="/home">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<tr ng-repeat="item in cartItems">
                                    <td class="shoping__cart__item">
                                        <img src="{{item.Img}}" alt="" style="width: 50%; height: 50%;" class="img-thumbnail">
                                        <h5>{{item.ProductName}}</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        {{item.Price}} VND
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qtys">
                                                <!-- <input type="number" ng-model="item.Quantity"> -->
                                                <div class="input-group mb-3">
                                                    <button class="btn btn-outline-secondary" ng-disabled="item.Quantity < 1" ng-click="item.Quantity=item.Quantity-1; saveLocal()">-</button>
                                                    <input type="number" class="form-control" ng-model="item.Quantity">
                                                    <button class="btn btn-outline-secondary" ng-disabled="item.Quantity >= item.MaxQuanti" ng-click="item.Quantity=item.Quantity+1; saveLocal()">+</button>
                                                </div>
                                                <div>Số lượng trong kho : {{item.MaxQuanti}}</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total" id="sumPrice" ng-model="item.total = item.Price * item.Quantity">
                                        {{item.total}} VND
                                    </td>
                                    <td class="shoping__cart__item__close" style="cursor: pointer;" ng-click="cartItems.splice($index, 1); saveLocal()">
                                        <i class="bi bi-trash3-fill h4"  ></i>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="/user/shoplist" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Total <span>$ {{getTotalCart()}}</span></li>
                        </ul>
                        <a href="/checkout" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

    <footer class="footer spad">
        <jsp:include page="../footer.jsp"></jsp:include>
    </footer>

    
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.nice-select.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.slicknav.js"></script>
    <script src="/js/mixitup.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/main.js"></script>

    <script src="./js/user/viewCart.js"></script>
</body>
</html>