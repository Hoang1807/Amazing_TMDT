<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <!DOCTYPE html>
            <html ng-app="shopApp">
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
                    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
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

            <body ng-controller="shopCtrl">
                <jsp:include page="../header.jsp"></jsp:include>

                <!-- Hero Section Begin -->
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
                                    <h2>Organi Shop</h2>
                                    <div class="breadcrumb__option">
                                        <a href="/home">Home</a>
                                        <span>Shop</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Breadcrumb Section End -->

                <!-- Product Section Begin -->
                <section class="product spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3 col-md-5">
                                <jsp:include page="../Component/filterShopList.jsp"></jsp:include>
                            </div>
                            <div class="col-lg-9 col-md-7">

                                <div class="product__discount">
                                    <div class="section-title product__discount__title">
                                        <h2>Popular</h2>
                                    </div>
                                    <div class="row">
                                        <div class="product__discount__slider owl-carousel">
                                            <c:forEach var="item" items="${listProduct}" varStatus="loop">
                                                <div class="col-lg-4">
                                                    <a href="/shopDetail?id=${item.productId}">
                                                        <div class="product__discount__item">
                                                            <div class="product__discount__item__pic set-bg"
                                                                data-setbg="${item.types[0].typeImage}">
                                                            </div>
                                                            <div class="product__discount__item__text">
                                                                <span>${item.category.cateName}</span>
                                                                <h5>${item.productName}</h5>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                </div>

                                <div class="filter__item">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-5">
                                            <div class="filter__sort">
                                                <span>Sắp xếp theo giá</span>
                                                <select id="filterPrice">
                                                    <option value=""><a href="">Nhấp vào chọn</a></option>
                                                    <option value="true"><a href="">Tăng dần</a></option>
                                                    <option value="false"><a href="">Giảm dần</a></option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4">
                                            <div class="filter__found">
                                                <h6><span>${listProduct.size()}</span> Products found</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <c:forEach var="item" items="${page.content}" varStatus="loop">
                                        <a href="/shopDetail?id=${item.productId}">
                                            <div class="col-lg-4 col-md-6 col-sm-6">
                                                <div class="product__item">
                                                    <div class="product__item__pic set-bg" data-setbg="${item.types[0].typeImage}">
                                                    </div>
                                                    <div class="product__item__text">
                                                        <span>${item.category.cateName}</span>
                                                        <h6><a href="/shopDetail?id=${item.productId}">${item.productName}</a></h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                                <div class="product__pagination">
                                        <c:if test="${page.totalPages > 1}">
                                            <c:forEach var="i" begin="1" end="${page.totalPages}">
                                                    <a href="/user/shoplist/search?page=${i-1}">${i}</a>
                                            </c:forEach>
                                        </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Product Section End -->

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
                <script src="/js/user/shop.js"></script>
                <script>
                    $(document).ready(function() {
                    // Chọn phần tử <select> bằng ID hoặc bất kỳ cách nào khác.
                    // Dưới đây, chúng ta chọn phần tử có ID là "mySelect".
                    $("#filterPrice").change(function() {
                        // Xử lý sự kiện khi giá trị của <select> thay đổi.
                        var selectedValue = $(this).val();
                        console.log("Giá trị đã chọn: " + selectedValue);
                        sessionStorage.setItem("statusOption",selectedValue);
                        window.location.href = "/user/shoplist/search?name=productMinprice&sort="+selectedValue; 
                                // Lấy giá trị được lưu trong localStorage (nếu có)
                                var selectedValue = sessionStorage.getItem("statusOption");

                                // Nếu đã lưu giá trị trong localStorage, chọn option tương ứng
                                if (selectedValue) {
                                    var selectElement = document.getElementById("filterPrice");
                                    for (var i = 0; i < selectElement.options.length; i++) {
                                    if (selectElement.options[i].value === selectedValue) {
                                        selectElement.options[i].selected = true;
                                    }
                                    }
                                }

                                    // Bắt sự kiện khi người dùng thay đổi giá trị
                                    document.getElementById("filterPrice").addEventListener("change", function() {
                                    var selectedOption = this.value;

                                    // Lưu giá trị đã chọn vào localStorage
                                    sessionStorage.setItem("statusOption", selectedOption);
                                });
    
                        // Thêm mã xử lý tùy chỉnh ở đây dựa trên giá trị đã chọn.
                    });
                    });
                    
                </script>
            </body>

            </html>