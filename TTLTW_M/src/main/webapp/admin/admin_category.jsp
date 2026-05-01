<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
    
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Categories - Dashboard</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/css/admin/categorylist.css" rel="stylesheet" type="text/css" >
</head>

<body>
  <div class="app">
     <!-- Sidebar -->
    <jsp:include page="dashboard_menu.jsp" />
	<!-- Modal -->
 	<jsp:include page="modal/admin/modal_category.jsp" />
    <!-- Main -->
    <main class="main">
      <div class="page-header">
        <h1 class="page-title">Thể loại</h1>

        <div class="d-flex align-items-center gap-2">
          <button class="btn btn-outline-secondary btn-sm rounded-circle" type="button" aria-label="Search">
            <i class="bi bi-search"></i>
          </button>
          <button class="btn btn-outline-secondary btn-sm rounded-circle" type="button" aria-label="User">
            <i class="bi bi-person"></i>
          </button>
        </div>
      </div>

      <!-- Tree + table -->
      <div class="row g-3">
        <div class="col-12 col-lg-4">
          <section class="panel h-100">
            <div class="panel-head">
              <h5>Cây Thể Loại</h5>
              <button class="btn btn-sm btn-outline-secondary" type="button">
                <i class="bi bi-plus-lg me-1"></i> Thêm
              </button>
            </div>

           <div class="tree-wrap">
    			<t:category list="${categoryTree}" level="0" />
			</div>
          </section>
        </div>

        <div class="col-12 col-lg-8">
          <section class="panel">
            <div class="panel-head">
              <h5>Thể loại</h5>
              <div class="d-flex gap-2">
                <button class="btn btn-outline-secondary btn-sm" type="button">
                  <i class="bi bi-funnel me-1"></i> Lọc
                </button>
                <button class="btn btn-primary btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#modalAddCategory">
                  <i class="bi bi-plus-lg me-1"></i> Thêm thể loại
                </button>
              </div>
            </div>

            <div class="p-2 px-2">
              <div class="table-responsive">
                <table class="table align-middle mb-0">
                  <thead>
                    <tr>
                      <th style="width:44px;">
                        <input class="form-check-input" type="checkbox" aria-label="Select all">
                      </th>
                      <th style="min-width:260px;">Category</th>
                      <th style="width:160px;">Parent</th>
                      <th style="width:140px;">Level</th>
                      <th style="width:140px;">Products</th>
                      <th class="text-end" style="width:120px;">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- level 0 -->
                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td><span class="fw-bold">Women Cloths</span></td>
                      <td class="text-muted">—</td>
                      <td>0</td>
                      <td>12</td>
                      <td class="text-end"><a href="#" class="text-decoration-none fw-bold text-primary">Det</a></td>
                    </tr>
                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td><span class="fw-bold">Man Cloths</span></td>
                      <td class="text-muted">—</td>
                      <td>0</td>
                      <td>10</td>
                      <td class="text-end"><a href="#" class="text-decoration-none fw-bold text-primary">Det</a></td>
                    </tr>

                    <!-- level 1 -->
                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td>Shirts</td>
                      <td>Women Cloths</td>
                      <td>1</td>
                      <td>5</td>
                      <td class="text-end"><a href="#" class="text-decoration-none fw-bold text-primary">Det</a></td>
                    </tr>
                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td>Outerwear</td>
                      <td>Women Cloths</td>
                      <td>1</td>
                      <td>7</td>
                      <td class="text-end"><a href="#" class="text-decoration-none fw-bold text-primary">Det</a></td>
                    </tr>

                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td>Pants</td>
                      <td>Man Cloths</td>
                      <td>1</td>
                      <td>4</td>
                      <td class="text-end"><a href="#" class="text-decoration-none fw-bold text-primary">Det</a></td>
                    </tr>
                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td>Tops</td>
                      <td>Man Cloths</td>
                      <td>1</td>
                      <td>6</td>
                      <td class="text-end"><a href="#" class="text-decoration-none fw-bold text-primary">Det</a></td>
                    </tr>

                    <!-- level 2 -->
                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td>T-Shirt</td>
                      <td>Shirts</td>
                      <td>2</td>
                      <td>3</td>
                      <td class="text-end"><a href="#" class="text-decoration-none fw-bold text-primary">Det</a></td>
                    </tr>
                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td>Half Shirt</td>
                      <td>Shirts</td>
                      <td>2</td>
                      <td>2</td>
                      <td class="text-end"><a href="#" class="text-decoration-none fw-bold text-primary">Det</a></td>
                    </tr>

                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td>Light Jacket</td>
                      <td>Outerwear</td>
                      <td>2</td>
                      <td>4</td>
                      <td class="text-end"><a href="#" class="text-decoration-none fw-bold text-primary">Det</a></td>
                    </tr>
                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td>Sweater</td>
                      <td>Outerwear</td>
                      <td>2</td>
                      <td>3</td>
                      <td class="text-end"><a href="#" class="text-decoration-none fw-bold text-primary">Det</a></td>
                    </tr>

                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td>Pant</td>
                      <td>Pants</td>
                      <td>2</td>
                      <td>4</td>
                      <td class="text-end"><a href="#" class="text-decoration-none fw-bold text-primary">Det</a></td>
                    </tr>
                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td>Shirt</td>
                      <td>Tops</td>
                      <td>2</td>
                      <td>3</td>
                      <td class="text-end"><a href="#" class="text-decoration-none fw-bold text-primary">Det</a></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </section>
        </div>
      </div>
    </main>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>	