<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Đơn hàng - Dashboard</title>

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
      <section class="panel">
        <div class="panel-head">
          <h5>Danh sách đơn hàng</h5>
          <div class="d-flex align-items-center gap-2">
            <button class="btn btn-soft" type="button">
              <i class="bi bi-funnel me-1"></i> Lọc
            </button>
          </div>
        </div>

        <div class="table-wrap">
          <div class="table-responsive">
            <table class="table align-middle mb-0">
              <thead>
                <tr>
                  <th style="width:44px;">
                    <input class="form-check-input" type="checkbox" aria-label="Select all">
                  </th>
                  <th style="min-width:220px;">
                    ID <i class="bi bi-caret-down ms-1 text-muted"></i>
                  </th>
                  <th style="min-width:220px;">
                    Khách hàng <i class="bi bi-caret-down ms-1 text-muted"></i>
                  </th>
                  <th style="min-width:220px;">
                    Dạng thanh toán <i class="bi bi-caret-down ms-1 text-muted"></i>
                  </th>
                  <th style="min-width:220px;">
                    Trạng thái <i class="bi bi-caret-down ms-1 text-muted"></i>
                  </th>
                  <th style="min-width:220px;">
                    Thời gian tạo <i class="bi bi-caret-down ms-1 text-muted"></i>
                  </th>
                  <th class="text-end" style="min-width:120px;">Hành động</th>
                </tr>
              </thead>
	
              <tbody>
              <c:forEach var="order" items="${orders}">
                <!-- Row 1 -->
                <tr>
                  <td>
                    <input class="form-check-input" type="checkbox" aria-label="Select row 1">
                  </td>
                  <td>
                  <span>${order.orderId}</span>
                  </td>
                  <td>${order.fullName}</td>
                  <td>${order.paymentMethod}</td>
                  <td>${order.status}</td>
                  <td>${order.createdAt}</td>                        
                  <td class="text-end">
                  <a href="${pageContext.request.contextPath}/admin/order-list/edit?id=${order.orderId}"
                    		class="btn btn-warning btnEditOrder">
               				<i class="bi bi-pencil-square me-1"></i>
           					 </a>
           					 
           		  <a data-order-id="${order.orderId}"
        						class="btn btn-danger btnDeleteOrder">
    							<i class="bi bi-trash me-1"></i>
				 </a>
                  </td>
                </tr>
			</c:forEach>
              
              </tbody>
            </table>
          </div>
        </div>

        <!-- Pagination (mÃ´ phá»ng) -->
        <div class="panel-foot">
          <button class="btn btn-outline-secondary rounded-pill px-4 py-2" type="button">
            <i class="bi bi-arrow-left me-2"></i> Trở về
          </button>

          <div class="page-numbers" aria-label="Pagination">
            <span class="dot active">1</span>
            <span class="dot">2</span>
            <span class="dot">3</span>
            <span class="px-2">...</span>
            <span class="dot">8</span>
            <span class="dot">9</span>
            <span class="dot">10</span>
          </div>

          <div style="width:200px;"></div>
        </div>
      </section>
    </main>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  	document.querySelectorAll(".btnDeleteOrder")
  		.forEach(button => {

     	 button.addEventListener("click", function () {

       	   const orderId = this.dataset.orderId;
           const confirmDelete = confirm(
              "Bạn có chắc muốn xóa order # "+ orderId + " ?"
          	);
          
         	if (confirmDelete) {
              	window.location.href = "${pageContext.request.contextPath}/admin/order-list/delete?orderId="+orderId;
          	}
      });

  });
  </script>
</body>
</html>