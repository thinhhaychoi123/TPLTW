<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Xem sản phẩm - Dashboard</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
 
   <link href="${pageContext.request.contextPath}/css/admin/productlist.css" rel="stylesheet" type="text/css">
</head>

<body>
  <div class="app">
    <!-- Sidebar -->
    <jsp:include page="dashboard_menu.jsp" />
    
    <!-- Main -->
    <main class="main">
      <!-- Page header -->
      <div class="page-header">
        <h1 class="page-title">Xem sản phẩm</h1>
      </div>
      
      <section class="panel">
        <div class="panel-head">
          <h5>Thông tin sản phẩm ID: ${product.productId}</h5>
         <button class="btn btn-outline-secondary" type="button">
            <i class="bi bi-arrow-left me-2"></i> Trở về
          </button>
          <button class="btn btn-primary" type="submit" >
                <i class="bi bi-save me-1"></i> Lưu
          </button>
        </div>

        <div class="p-3 p-md-4">
          <form id="addProductForm">
            <div class="row g-3">
              <div class="col-12 col-md-6">
                <div>
                  <label class="form-label" for="name">Tên sản phẩm</label>
                  <input id="name" class="form-control" value ="${product.name}" required >
                </div>
              </div>

              <div class="col-12 col-md-6">
                <div>
                  <label class="form-label" for="sku">SKU</label>
                  <input id="sku" class="form-control" placeholder="Ví dụ: TSH-001" required />
                </div>
              </div>

              <div class="col-12 col-md-6">
                <div>
                  <label class="form-label" for="category">Thể loại</label>
                  
                  <select id="category" class="form-select" required>
                   <c:forEach var="category" items="${categorys}">
                    <option value="${category.categoryId}"  ${category.categoryId == product.categoryId ? 'selected' : ''} >${category.name}</option>
                    </c:forEach>
                  </select>
                  <div class="help mt-1">Demo: danh sách giả lập, bạn có thể thay bằng dữ liệu thật.</div>
                </div>
              </div>

              <div class="col-12 col-md-3">
                <div>
                  <label class="form-label" for="price">Giá</label>
                  <input id="price" type="number" step="0.01" class="form-control" placeholder="79.80" required />
                </div>
              </div>

              <div class="col-12 col-md-3">
                <div>
                  <label class="form-label" for="stock">Hàng còn lại</label>
                  <input id="stock" type="number" class="form-control" placeholder="79" required />
                </div>
              </div>

              <div class="col-12 col-md-4">
                <div>
                  <label class="form-label" for="status">Trạng thái</label>
                  <select id="status" class="form-select" required>
                    <option value="Active">Active</option>
                    <option value="Scheduled">Scheduled</option>
                    <option value="Draft">Draft</option>
                  </select>
                </div>
              </div>

              <div class="col-12 col-md-8">
                <div>
                  <label class="form-label" for="description">Mô tả</label>
                  <textarea id="description" class="form-control" rows="3">${product.description}</textarea>
                </div>
              </div>
            </div>

           

            <div class="alert alert-success mt-3 d-none" id="successAlert" role="alert">
              Lưu thành công.
            </div>
          </form>
        </div>
      </section>
    </main>
    
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>