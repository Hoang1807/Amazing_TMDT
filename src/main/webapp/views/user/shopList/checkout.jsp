<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html ng-app="checkoutApp">
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
<body ng-controller="checkoutCtrl">

    <jsp:include page="../header.jsp"></jsp:include>

     <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click here</a> to enter your code
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>Billing Details</h4>
                <form action="/checkout" method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" name="address" placeholder="Street Address" class="checkout__input__add">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text" name="phone">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" name="email">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Order notes<span>*</span></p>
                                <input type="text" name="notes" placeholder="Notes about your order, e.g. special notes for delivery.">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span>Total</span></div>
                                <ul ng-repeat="item in cartItems">
                                    <li>
                                        <input type="hidden" name="product" value="{ id:{{item.IDPro}}, type:{{item.TypeID}}, quantities:{{item.Quantity}} }">
                                        <!-- <input type="hidden" name="type" value="{{item.TypeID}}"> -->
                                        {{item.ProductName}} <span ng-init="item.total=item.Price * item.Quantity">{{item.total}} VND</span>
                                    </li>
                                </ul>
                                <div class="checkout__order__total">Total <span>{{getTotalCart()}} VND</span></div>
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Check Payment
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>

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

    <script src="./js/user/checkout.js"></script>
</body>
</html>