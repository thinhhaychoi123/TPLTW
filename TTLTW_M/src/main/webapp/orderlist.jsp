<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Electro - Electronics Website Template</title>
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
    <style>
        body {
            background-color: #f8f9fa;
            color: #343a40;
        }

        .custom-navbar {
            background-color: #343a40;
        }

        .table img {
            height: 50px; /* Kích thước hình ảnh thu nhỏ */
            object-fit: cover;
        }
    </style>
    
     <!-- Checkout Stylesheet -->
    <link href="css/pagination.css" rel="stylesheet">
    
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
        <h1 class="text-center text-white display-6 wow fadeInUp" data-wow-delay="0.1s">Trang giỏ hàng</h1>
        <ol class="breadcrumb justify-content-center mb-0 wow fadeInUp" data-wow-delay="0.3s">
            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
            <li class="breadcrumb-item active text-white">Trang giỏ hàng</li>
        </ol>
    </div>
    <!-- Single Page Header End -->

    <!-- Order View Start -->
    <div class="container my-4">
        <h5 class="mb-3">Thông tin đơn hàng</h5>
          <c:if test="${empty orderitems}">
        <div id="order-table">
            <!-- Nếu không có đơn hàng -->
            <p class="text-center">Bạn không có đơn hàng nào.</p>
        </div>
        </c:if>
         <c:if test="${not empty orderitems}">
        	<table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Tổng giá</th>
                    <th scope="col">Dạng thanh toán</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Đã tạo</th>
                    <th scope="col">Cập nhật lần cuối</th>
                    <th scope="col">Xem chi tiet</th>
                </tr>
            </thead>
            <c:forEach var="orderitem" items="${orderitems}">
            <tbody>
                <tr>
                    <td><img src="img/logo.png"></td>
                    <td>${orderitem.totalPrice}</td>
                    <td>${orderitem.paymentMethod}</td>
                   
                    <td>
                    <c:choose>
									<c:when test="${orderitem.status == 'PENDING'}">
										<span class="badge bg-warning">Chờ xử lý</span>
									</c:when>
									<c:when test="${orderitem.status == 'SHIPPING'}">
									<span class="badge bg-primary">Đang giao hàng</span>
									</c:when>
									<c:when test="${orderitem.status == 'SUCCESS'}">
									<span class="badge bg-success">Đã giao hàng</span>
									</c:when>
									<c:when test="${orderitem.status == 'CANCEL'}">
									<span class="badge bg-danger">Đã hủy</span>
									</c:when>
									<c:otherwise>
											<span class="badge">${orderitem.status}</span>
									</c:otherwise>
									</c:choose>                    
									</td>
                    <td><fmt:formatDate value="${orderitem.createdAt}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                    <td><fmt:formatDate value="${orderitem.updatedAt}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                     <td>
                    <a class="btn btn-success btnEditCategory">
               				<i class="bi bi-list-ol me-1"></i>
           					 </a>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        </c:if>
        
    </div>
    <!-- Order View End -->

	<div class="panel-foot">

          <div class="page-numbers px-4 py-2" aria-label="Pagination">
            <span class="dot active">1</span>
            <span class="dot">2</span>
            <span class="dot">3</span>
            <span class="px-2">...</span>
            <span class="dot">8</span>
            <span class="dot">9</span>
            <span class="dot">10</span>
          </div>
        </div>

    <!-- Footer Start-->
	  <jsp:include page="/component/footer.jsp" />
    <!-- Footer End -->


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>


    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>