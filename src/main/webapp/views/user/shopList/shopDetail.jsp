<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="description" content="Ogani Template">
                <meta name="keywords" content="Ogani, unica, creative, html">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Ogani | Template</title>

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

            <body>
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
                <section class="product-details spad">
                    <div class="container">
                        <div class="row">
                        	
	                            <div class="col-lg-6 col-md-6">
	                                <div class="product__details__pic">
	                                    <div class="product__details__pic__item">
	                                        <img class="product__details__pic__item--large"
	                                            src="${product.types[0].typeImage}" alt="">
	                                    </div>
	                                    
		                                    <div class="product__details__pic__slider owl-carousel">
			                                    <c:forEach var="p" items="${type}" varStatus="loop">
			                                        <img data-imgbigurl="${p.typeImage}"
			                                            src="${p.typeImage}" alt="">
			                                     </c:forEach>       
		                                    </div>
	                                    
	                                </div>
	                            </div>
	                          
                            <div class="col-lg-6 col-md-6">
                                <div class="product__details__text">
                                    <h3>${product.productName}</h3>
                                    <div class="product__details__rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-o"></i>
                                        <span>(18 reviews)</span>
                                    </div>
                                    <div class="product__details__price">$ ${product.productMinprice} - $ ${product.productMaxprice}</div>
                                    <p>Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam
                                        vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet
                                        quam vehicula elementum sed sit amet dui. Proin eget tortor risus.</p>
                                    <div class="product__details__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#" class="primary-btn">ADD TO CARD</a>
                                    <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                                    <ul>
                                        <li><b>Availability</b> <span>In Stock</span></li>
                                        <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                                        <li><b>Weight</b> <span>0.5 kg</span></li>
                                        <li><b>Share on</b>
                                            <div class="share">
                                                <a href="#"><i class="fa fa-facebook"></i></a>
                                                <a href="#"><i class="fa fa-twitter"></i></a>
                                                <a href="#"><i class="fa fa-instagram"></i></a>
                                                <a href="#"><i class="fa fa-pinterest"></i></a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="product__details__tab">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                                aria-selected="true">Description</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                            <div class="product__details__tab__desc">
                                                <h6>Products Infomation</h6>
                                                <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                                    Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus
                                                    suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam
                                                    vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.
                                                    Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,
                                                    accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a
                                                    pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula
                                                    elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus
                                                    et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
                                                    vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
                                                    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
                                                    ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
                                                    elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
                                                    porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
                                                    nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
                                                    Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
                                                    porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
                                                    sed sit amet dui. Proin eget tortor risus.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Footer Section Begin -->
                <footer class="footer spad">
                    <jsp:include page="../footer.jsp"></jsp:include>
                </footer>
                <!-- Footer Section End -->

                <!-- Js Plugins -->
                <script src="/js/jquery-3.3.1.min.js"></script>
                <script src="/js/bootstrap.min.js"></script>
                <script src="/js/jquery.nice-select.min.js"></script>
                <script src="/js/jquery-ui.min.js"></script>
                <script src="/js/jquery.slicknav.js"></script>
                <script src="/js/mixitup.min.js"></script>
                <script src="/js/owl.carousel.min.js"></script>
                <script src="/js/main.js"></script>



            </body>

            </html>
