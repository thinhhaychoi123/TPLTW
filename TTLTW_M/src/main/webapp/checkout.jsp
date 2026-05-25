<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Thanh toán | Thuốc bảo vệ thực vật</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700&family=Roboto:wght@400;500;700&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
      <!-- Checkout Stylesheet -->
    <link href="css/checkout.css" rel="stylesheet">
</head>

<body>

   <!-- Spinner Start -->
      <jsp:include page="/component/spinner.jsp" />
    <!-- Spinner End -->


    <!-- Topbar Start -->
      <jsp:include page="/component/topbar.jsp" />
    <!-- Topbar End -->

    <!-- Navbar & Hero Start -->
      <jsp:include page="/component/navbar.jsp" />
    <!-- Navbar & Hero End -->
    
    <!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6 wow fadeInUp" data-wow-delay="0.1s">Trang thanh toán</h1>
        <ol class="breadcrumb justify-content-center mb-0 wow fadeInUp" data-wow-delay="0.3s">
            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
            <li class="breadcrumb-item active text-white">Trang thanh toán</li>
        </ol>
    </div>
    <!-- Single Page Header End -->

    <!-- Searvices Start -->
     	<jsp:include page="/component/searvices.jsp" />
    <!-- Searvices End -->


    <!-- Checkout Page Start -->
    <div class="container-fluid bg-light overflow-hidden py-5">
    	<h1 class="mb-4 wow fadeInUp" data-wow-delay="0.1s">Đơn thanh toán</h1>
        <div class="row g-4">
            <!-- LEFT START -->
            <div class="col-12 col-lg-8">

            <!-- Shipping Information -->
            <div class="card border-0 shadow-sm rounded-4 mb-4">
                <div class="card-body p-4">

                    <h4 class="section-title mb-4">
                        <i class="fas fa-map-marker-alt me-2"></i>
                        Thông tin giao hàng
                    </h4>

                    <div class="row g-3">

                        <div class="col-md-4">
                            <label class="form-label">Họ và tên *</label>
                            <input type="text"
                                   class="form-control form-control-lg"
                                   placeholder="Nhập họ tên">
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Số điện thoại *</label>
                            <input type="text"
                                   class="form-control form-control-lg"
                                   placeholder="Nhập số điện thoại">
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Email</label>
                            <input type="email"
                                   class="form-control form-control-lg"
                                   placeholder="Nhập email">
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Tỉnh / Thành phố *</label>

                            <select class="form-select form-select-lg">
                                <option>Chọn tỉnh / thành phố</option>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Quận / Huyện *</label>

                            <select class="form-select form-select-lg">
                                <option>Chọn quận / huyện</option>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Phường / Xã *</label>

                            <select class="form-select form-select-lg">
                                <option>Chọn phường / xã</option>
                            </select>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Địa chỉ cụ thể *</label>

                            <input type="text"
                                   class="form-control form-control-lg"
                                   placeholder="Số nhà, tên đường, thôn/xóm...">
                        </div>

                        <div class="col-12">
                            <label class="form-label">Ghi chú đơn hàng</label>

                            <textarea class="form-control"
                                      rows="5"
                                      placeholder="Ghi chú thêm cho đơn hàng..."></textarea>
                        </div>

                    </div>

                </div>
            </div>

            <!-- Shipping Method -->
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body p-4">

                    <h4 class="section-title mb-4">
                        <i class="fas fa-truck me-2"></i>
                        Phương thức giao hàng
                    </h4>

                    <div class="row g-3">

                        <div class="col-md-4">
                            <label class="shipping-card active">

                                <input type="radio"
                                       name="shipping"
                                       checked
                                       hidden>

                                <div class="fw-bold">
                                    Giao hàng tiêu chuẩn
                                </div>

                                <div class="text-muted small mt-2">
                                    2 - 4 ngày
                                </div>

                                <div class="shipping-price">
                                    Miễn phí
                                </div>

                            </label>
                        </div>

                        <div class="col-md-4">
                            <label class="shipping-card">

                                <input type="radio"
                                       name="shipping"
                                       hidden>

                                <div class="fw-bold">
                                    Giao hàng nhanh
                                </div>

                                <div class="text-muted small mt-2">
                                    1 - 2 ngày
                                </div>

                                <div class="shipping-price">
                                    15.000đ
                                </div>

                            </label>
                        </div>

                        <div class="col-md-4">
                            <label class="shipping-card">

                                <input type="radio"
                                       name="shipping"
                                       hidden>

                                <div class="fw-bold">
                                    Nhận tại cửa hàng
                                </div>

                                <div class="text-muted small mt-2">
                                    Nhận trực tiếp
                                </div>

                                <div class="shipping-price">
                                    Miễn phí
                                </div>

                            </label>
                        </div>

                    </div>

                </div>
            </div>

        </div>
        
       	<!-- LEFT END -->
        
        <!-- RIGHT START -->
        <div class="col-12 col-lg-4">

            <div class="checkout-summary">

                <!-- Order Summary -->
                <div class="card border-0 shadow-sm rounded-4 mb-4">
                    <div class="card-body p-4">

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h4 class="section-title mb-0">
                                Đơn hàng của bạn
                            </h4>

                            <a href="#" class="small text-success">
                                Sửa giỏ hàng
                            </a>
                        </div>

                        <!-- Product -->
                        <c:forEach var="cartview" items="${cartviews}">
                        <div class="product-item">

                            <img src="img/logo.png"
                                 class="product-image">

                            <div class="flex-grow-1">

                                <div class="fw-semibold">
                                      ${cartview.productName}
                                </div>

                                <div class="small text-muted">
                                    ${cartview.productPrice} x ${cartview.quantity}
                                </div>

                            </div>

                            <div class="fw-bold text-success">
                                ${cartview.totalPrice}
                            </div>

                        </div>
						</c:forEach>

                        <hr>

                        <!-- Coupon -->
                        <div class="d-flex gap-2 mb-4">

                            <input type="text"
                                   class="form-control"
                                   placeholder="Nhập mã giảm giá">

                            <button class="btn btn-outline-success">
                                Áp dụng
                            </button>

                        </div>

                        <!-- Totals -->
                        <div class="summary-row">
                            <span>Tạm tính</span>
                            <span>715.000đ</span>
                        </div>

                        <div class="summary-row">
                            <span>Phí vận chuyển</span>
                            <span class="text-success">Miễn phí</span>
                        </div>

                        <div class="summary-row">
                            <span>Giảm giá</span>
                            <span class="text-danger">-50.000đ</span>
                        </div>

                        <hr>

                        <div class="summary-row total-row">
                            <span>Tổng cộng</span>
                            <span>665.000đ</span>
                        </div>

                    </div>
                </div>

                <!-- Payment -->
                <div class="card border-0 shadow-sm rounded-4">
                    <div class="card-body p-4">

                        <h4 class="section-title mb-4">
                            <i class="fas fa-credit-card me-2"></i>
                            Phương thức thanh toán
                        </h4>

                        <div class="payment-method active">
                            <input type="radio"
                                   checked
                                   hidden>

                            <div class="fw-semibold">
                                Thanh toán khi nhận hàng (COD)
                            </div>

                            <div class="small text-muted">
                                Thanh toán bằng tiền mặt
                            </div>
                        </div>

                        <div class="payment-method">
                            <input type="radio"
                                   hidden>

                            <div class="fw-semibold">
                                Chuyển khoản ngân hàng
                            </div>

                            <div class="small text-muted">
                                Chuyển khoản qua tài khoản
                            </div>
                        </div>

                        <div class="payment-method">
                            <input type="radio"
                                   hidden>

                            <div class="fw-semibold">
                                Ví MoMo
                            </div>

                            <div class="small text-muted">
                                Thanh toán qua MoMo
                            </div>
                        </div>

                        <button class="btn btn-success btn-lg w-100 rounded-pill mt-4">
                            <i class="fas fa-lock me-2"></i>
                            ĐẶT HÀNG
                        </button>

                        <div class="secure-note">
                            Thông tin thanh toán được bảo mật an toàn
                        </div>

                    </div>
                </div>

            </div>

        </div>
        <!-- RIGHT END -->
        
        
        </div>
    </div>
    <!-- Checkout Page End -->

    <!-- Footer Start -->
    <div class="container-fluid footer py-5 wow fadeIn" data-wow-delay="0.2s">
        <div class="container py-5">
            <div class="row g-4 rounded mb-5" style="background: rgba(255, 255, 255, .03);">
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="rounded p-4">
                        <div class="rounded-circle bg-secondary d-flex align-items-center justify-content-center mb-4"
                            style="width: 70px; height: 70px;">
                            <i class="fas fa-map-marker-alt fa-2x text-primary"></i>
                        </div>
                        <div>
                            <h4 class="text-white">Address</h4>
                            <p class="mb-2">123 Street New York.USA</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="rounded p-4">
                        <div class="rounded-circle bg-secondary d-flex align-items-center justify-content-center mb-4"
                            style="width: 70px; height: 70px;">
                            <i class="fas fa-envelope fa-2x text-primary"></i>
                        </div>
                        <div>
                            <h4 class="text-white">Mail Us</h4>
                            <p class="mb-2">info@example.com</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="rounded p-4">
                        <div class="rounded-circle bg-secondary d-flex align-items-center justify-content-center mb-4"
                            style="width: 70px; height: 70px;">
                            <i class="fa fa-phone-alt fa-2x text-primary"></i>
                        </div>
                        <div>
                            <h4 class="text-white">Telephone</h4>
                            <p class="mb-2">(+012) 3456 7890</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="rounded p-4">
                        <div class="rounded-circle bg-secondary d-flex align-items-center justify-content-center mb-4"
                            style="width: 70px; height: 70px;">
                            <i class="fab fa-firefox-browser fa-2x text-primary"></i>
                        </div>
                        <div>
                            <h4 class="text-white">Yoursite@ex.com</h4>
                            <p class="mb-2">(+012) 3456 7890</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-5">
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="footer-item d-flex flex-column">
                        <div class="footer-item">
                            <h4 class="text-primary mb-4">Newsletter</h4>
                            <p class="text-white mb-3">Dolor amet sit justo amet elitr clita ipsum elitr est.Lorem ipsum
                                dolor sit amet, consectetur adipiscing elit consectetur adipiscing elit.</p>
                            <div class="position-relative mx-auto rounded-pill">
                                <input class="form-control rounded-pill w-100 py-3 ps-4 pe-5" type="text"
                                    placeholder="Enter your email">
                                <button type="button"
                                    class="btn btn-primary rounded-pill position-absolute top-0 end-0 py-2 mt-2 me-2">SignUp</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="footer-item d-flex flex-column">
                        <h4 class="text-primary mb-4">Customer Service</h4>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Contact Us</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Returns</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Order History</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Site Map</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Testimonials</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> My Account</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Unsubscribe Notification</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="footer-item d-flex flex-column">
                        <h4 class="text-primary mb-4">Information</h4>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> About Us</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Delivery infomation</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Privacy Policy</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Terms & Conditions</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Warranty</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> FAQ</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Seller Login</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="footer-item d-flex flex-column">
                        <h4 class="text-primary mb-4">Extras</h4>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Brands</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Gift Vouchers</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Affiliates</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Wishlist</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Order History</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Track Your Order</a>
                        <a href="#" class=""><i class="fas fa-angle-right me-2"></i> Track Your Order</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Copyright Start -->
    <div class="container-fluid copyright py-4">
        <div class="container">
            <div class="row g-4 align-items-center">
                <div class="col-md-6 text-center text-md-start mb-md-0">
                    <span class="text-white"><a href="#" class="border-bottom text-white"><i
                                class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right
                        reserved.</span>
                </div>
                <div class="col-md-6 text-center text-md-end text-white">

                    <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                    <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                    <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                    Designed By <a class="border-bottom text-white" href="https://htmlcodex.com">HTML Codex</a>.
                    Distributed By <a class="border-bottom text-white" href="https://themewagon.com">ThemeWagon</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary btn-lg-square back-to-top"><i class="fa fa-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>


    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>