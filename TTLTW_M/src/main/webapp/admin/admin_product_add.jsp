<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Thêm sản phẩm - Dashboard</title>

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

	<!-- Modal -->
 	<jsp:include page="modal/admin/modal_product.jsp" />
    <!-- Main -->
    <main class="main">
      <!-- Page header -->
      <div class="page-header">
        <h1 class="page-title">Thêm sản phẩm</h1>
      </div>
      
      <section class="panel">
        <div class="panel-head">
          <h5>Thông tin sản phẩm</h5>
         <button class="btn btn-outline-secondary rounded-pill px-4 py-2" type="button">
            <i class="bi bi-arrow-left me-2"></i> Trở về
          </button>
        </div>

        <div class="p-3 p-md-4">
          <form id="addProductForm">
            <div class="row g-3">
              <div class="col-12 col-md-6">
                <div>
                  <label class="form-label" for="name">Tên sản phẩm</label>
                  <input id="name" class="form-control" placeholder="Ví dụ: T-Shirt" required />
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
                  <label class="form-label" for="category">Category</label>
                  <select id="category" class="form-select" required>
                    <option value="Women Cloths">Women Cloths</option>
                    <option value="Shirts">Women Cloths / Shirts</option>
                    <option value="Tops">Man Cloths / Tops</option>
                    <option value="Outerwear">Women Cloths / Outerwear</option>
                    <option value="Kids Cloths">Kid Cloths</option>
                    <option value="Pants">Man Cloths / Pants</option>
                  </select>
                  <div class="help mt-1">Demo: danh sách giả lập, bạn có thể thay bằng dữ liệu thật.</div>
                </div>
              </div>

              <div class="col-12 col-md-3">
                <div>
                  <label class="form-label" for="price">Price</label>
                  <input id="price" type="number" step="0.01" class="form-control" placeholder="79.80" required />
                </div>
              </div>

              <div class="col-12 col-md-3">
                <div>
                  <label class="form-label" for="stock">Stock</label>
                  <input id="stock" type="number" class="form-control" placeholder="79" required />
                </div>
              </div>

              <div class="col-12 col-md-4">
                <div>
                  <label class="form-label" for="status">Status</label>
                  <select id="status" class="form-select" required>
                    <option value="Active">Active</option>
                    <option value="Scheduled">Scheduled</option>
                    <option value="Draft">Draft</option>
                  </select>
                </div>
              </div>

              <div class="col-12 col-md-8">
                <div>
                  <label class="form-label" for="description">Description</label>
                  <textarea id="description" class="form-control" rows="3" placeholder="Mô tả sản phẩm..."></textarea>
                </div>
              </div>
            </div>

            <div class="d-flex gap-2 justify-content-end mt-4">
              <button type="reset" class="btn btn-outline-secondary">
                <i class="bi bi-x-lg me-1"></i> Reset
              </button>
              <button type="submit" class="btn btn-primary">
                <i class="bi bi-save me-1"></i> Lưu
              </button>
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