<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Sản phẩm - Dashboard</title>

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

	<!-- Modal -->
 	<jsp:include page="modal/admin/modal_product.jsp" />
    <!-- Main -->
    <main class="main">
      <!-- Page header -->
      <div class="page-header">
        <h1 class="page-title">Sản phẩm</h1>

        
      </div>

      <!-- Panel -->
      <section class="panel">
        <div class="panel-head">
          <h5>Products list</h5>
          <div class="d-flex align-items-center gap-2">
            <button class="btn btn-soft" type="button">
              <i class="bi bi-funnel me-1"></i> Lọc
            </button>
            <button class="btn btn-primary-soft" type="button" data-bs-toggle="modal" data-bs-target="#modalAddProduct">
              <i class="bi bi-plus-lg me-1"></i> Thêm sản phẩm
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
                    Tên sản phẩm <i class="bi bi-caret-down ms-1 text-muted"></i>
                  </th>
                  <th style="min-width:220px;">
                    Thể loại <i class="bi bi-caret-down ms-1 text-muted"></i>
                  </th>
                  <th style="min-width:140px;">
                    Giá <i class="bi bi-caret-down ms-1 text-muted"></i>
                  </th>
                  <th style="min-width:120px;">
                    Số lượng <i class="bi bi-caret-down ms-1 text-muted"></i>
                  </th>
                  <th style="min-width:160px;">
                    Trạng thái <i class="bi bi-caret-down ms-1 text-muted"></i>
                  </th>
                  <th class="text-end" style="min-width:120px;">Hành động</th>
                </tr>
              </thead>

              <tbody>
              <c:forEach var="product" items="${products}">
                <!-- Row 1 -->
                <tr>
                  <td>
                    <input class="form-check-input" type="checkbox" aria-label="Select row 1">
                  </td>
                  <td>
                    <div class="product-cell">
                      <div class="thumb">
                        <img alt="thumb" src="data:image/jpeg;base64,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">
                      </div>
                      <span>${product.name}</span>
                    </div>
                  </td>
                  <td>${product.categoryId}</td>
                  <td>${product.price}</td>
                  <td>99999999</td>
                  <td>
                    <span class="badge badge-pill badge-scheduled">${product.status}</span>
                  </td>
                  <td class="text-end">
                    <a href="#" class="text-decoration-none text-primary fw-bold">Sửa</a>
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
</body>
</html>