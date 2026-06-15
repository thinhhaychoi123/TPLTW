<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Xem Chi tiet Đơn hàng - Dashboard</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/css/admin/productlist.css" rel="stylesheet" type="text/css" >
</head>

<body>
  <div class="app">
    <!-- Sidebar -->
    <jsp:include page="dashboard_menu.jsp" />

    <!-- Main -->
    <main class="main">
      <!-- Page header -->
      <div class="page-header">
        <h1 class="page-title">Đơn hàng</h1>

        
      </div>

      <!-- Panel -->
      <div class="container py-5">

      <div class="card border-0 shadow rounded-4 overflow-hidden">
 		<form action="${pageContext.request.contextPath}/admin/order-list/edit" method="post">
        <!-- HEADER -->
        <div class="card-header bg-white border-0 p-4">

            <div class="d-flex justify-content-between align-items-center">

                <div>
                    <h2 class="fw-bold mb-1">
                        Sửa đơn hàng
                    </h2>

                    <p class="text-muted mb-0">
                        Đơn hàng số #${order.orderId}
                    </p>
                </div>

                <button type="submit" class="btn btn-success px-4">
                    Lưu đơn hàng
                </button>

            </div>

        </div>
		
        <!-- BODY -->
        
        <div class="card-body p-4">

            <div class="row g-4">

                <!-- LEFT -->
                <div class="col-lg-8">

                    <!-- CUSTOMER INFO -->
                    <div class="card border-0 bg-light rounded-4 mb-4">

                        <div class="card-body p-4">

                            <h4 class="mb-4">
                                Thông tin đơn hàng
                            </h4>

                            <div class="row g-3">

                                <div class="col-md-6">
                                    <label class="form-label">
                                        Họ và tên
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           value="${order.fullname}">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">
                                        Số điện thoại
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           value="${order.phone}">
                                </div>

                                <div class="col-12">
                                    <label class="form-label">
                                        Địa chỉ
                                    </label>

                                    <textarea class="form-control"
                                              rows="3">${order.address}</textarea>
                                </div>

                            </div>

                        </div>

                    </div>

                    <!-- PRODUCT -->
                    <div class="card border-0 bg-light rounded-4">

                        <div class="card-body p-4">

                            <h4 class="mb-4">
                                Sản phẩm
                            </h4>
							<c:forEach var="productView" items="${order.productView}">
                            <div class="row g-4 align-items-center">

                                <!-- IMAGE -->
                                <div class="col-md-3 text-center">

                                    <img src="/"
                                         class="img-fluid rounded-4 border"
                                         style="height: 100px;
                                                width: 100px;
                                                object-fit: cover;">

                                </div>

                                <!-- INFO -->
                                <div class="col-md-9">

                                    <h4 class="fw-semibold mb-2">
                                        ${productView.productName}
                                    </h4>

                                    <p class="text-muted mb-4">
                                        ID:
                                        # ${productView.productViewId}
                                    </p>

                                    <div class="row g-3">

                                        <div class="col-md">

                                            <label class="form-label">
                                                ${productView.price} x ${productView.quantity}
                                            </label>

                                        </div>


                                    </div>

                                </div>

                            </div>
						</c:forEach>
                        </div>

                    </div>

                </div>

                <!-- RIGHT -->
                <div class="col-lg-4">

                    <div class="card border-0 bg-light rounded-4 h-100">

                        <div class="card-body p-4">

                            <h4 class="mb-4">
                                Tổng quát
                            </h4>

                            <div class="d-flex justify-content-between mb-3">
                                <span class="text-muted">
                                    ID
                                </span>
                                <input name= "orderId" class="text-end" value = "${order.orderId}"  readonly>
                            </div>

                            <div class="d-flex justify-content-between mb-3">
                                <span class="text-muted">
                                    User ID
                                </span>

                                <strong>
                                    Unknown
                                </strong>
                            </div>

                            <div class="d-flex justify-content-between mb-3">
                                <span class="text-muted">
                                    Tạo vào
                                </span>

                                <strong>
                                   ${order.createdAt}
                                </strong>
                            </div>

                            <div class="d-flex justify-content-between mb-3">
                                <span class="text-muted">
                                    Lần cập nhật
                                </span>

                                <strong>
                                    ${order.updatedAt}
                                </strong>
                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <span class="text-muted">
                                    Chi phí
                                </span>

                                <strong>
                                   Unknwon
                                </strong>
                            </div>
                              <div class="d-flex justify-content-between mb-3">
                                <span class="text-muted">
                                    Giảm giá
                                </span>

                                <strong>
                                   Unknwon
                                </strong>
                            </div>

                            <hr>

                            <!-- PAYMENT -->
                            <div class="mb-4">

                                <label class="form-label">
                                    Dạng thanh toán: <strong>${order.paymentMethod}</strong>
                                </label>

 								
                            </div>

                            <!-- STATUS -->
                            <div class="mb-4">

                                <label class="form-label">
                                    Trạng thái
                                </label>

                                <select name= "status" class="form-select" >

                                    <option value="PENDING"
                                        ${order.status == 'PENDING' ? 'selected' : ''}>
                                        Pending
                                    </option>

                                    <option value="CONFIRMED"
                                        ${order.status == 'CONFIRMED' ? 'selected' : ''}>
                                        Confirmed
                                    </option>

                                    <option value="SHIPPING"
                                        ${order.status == 'SHIPPING' ? 'selected' : ''}>
                                        Shipping
                                    </option>

                                    <option value="COMPLETED"
                                        ${order.status == 'COMPLETED' ? 'selected' : ''}>
                                        Completed
                                    </option>

                                    <option value="CANCELLED"
                                        ${order.status == 'CANCELLED' ? 'selected' : ''}>
                                        Cancelled
                                    </option>

                                </select>

                            </div>

                            <hr>

                            <!-- TOTAL -->
                            <div class="d-flex justify-content-between align-items-center">

                                <h5 class="mb-0">
                                    Tổng giá
                                </h5>

                                <h3 class="text-primary fw-bold mb-0">
                                    ${order.totalPrice}
                                </h3>

                            </div>

                        </div>

                    </div>

                </div>

            </div>
			
        </div>
        
        </form>
        </div>

    </div>
       <!-- Panel end -->
    </main>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>