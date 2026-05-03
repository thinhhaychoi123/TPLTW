<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Dashboard</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/css/admin/dashboard.css" rel="stylesheet" type="text/css" >
</head>

<body>
 <div class="app">
  <jsp:include page="dashboard_menu.jsp" />
    <main class="main">
      <div class="page-header">
        <h1 class="page-title">Dashboard</h1>

     
      </div>

      <!-- KPI row -->
      <div class="row g-3 mb-3">
        <div class="col-12 col-md-6 col-lg-3">
          <div class="stat-card">
            <div class="label">Total Products</div>
            <div class="kpi">1,284</div>
            <div class="trend up mt-2"><i class="bi bi-arrow-up-short"></i> +8.2% (7d)</div>
          </div>
        </div>

        <div class="col-12 col-md-6 col-lg-3">
          <div class="stat-card">
            <div class="label">Active Products</div>
            <div class="kpi">842</div>
            <div class="trend up mt-2"><i class="bi bi-arrow-up-short"></i> +3.1% (7d)</div>
          </div>
        </div>

        <div class="col-12 col-md-6 col-lg-3">
          <div class="stat-card">
            <div class="label">Draft Products</div>
            <div class="kpi">214</div>
            <div class="trend down mt-2"><i class="bi bi-arrow-down-short"></i> -1.4% (7d)</div>
          </div>
        </div>

        <div class="col-12 col-md-6 col-lg-3">
          <div class="stat-card">
            <div class="label">Monthly Revenue</div>
            <div class="kpi">$58,920</div>
            <div class="trend up mt-2"><i class="bi bi-arrow-up-short"></i> +6.0% (30d)</div>
          </div>
        </div>
      </div>

      <!-- Main table -->
      <section class="panel">
        <div class="panel-head">
          <h5>Recent Products</h5>
          <div class="d-flex gap-2">
            <button class="btn btn-outline-secondary btn-sm" type="button">
              <i class="bi bi-arrow-clockwise me-1"></i> Refresh
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
                  <th>Product</th>
                  <th>Category</th>
                  <th style="width:140px;">Price</th>
                  <th style="width:120px;">Stock</th>
                  <th style="width:160px;">Status</th>
                  <th class="text-end" style="width:120px;">Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                  <td><div class="fw-bold">T-Shirt</div></td>
                  <td>Women Cloths</td>
                  <td>$79.80</td>
                  <td>79</td>
                  <td><span class="badge rounded-pill text-bg-success-subtle border border-success-subtle text-success fw-bold">Active</span></td>
                  <td class="text-end"><a class="text-decoration-none fw-bold text-primary" href="#">Det</a></td>
                </tr>
                <tr>
                  <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                  <td><div class="fw-bold">Shirt</div></td>
                  <td>Man Cloths</td>
                  <td>$76.89</td>
                  <td>86</td>
                  <td><span class="badge rounded-pill text-bg-primary-subtle border border-primary-subtle text-primary fw-bold">Scheduled</span></td>
                  <td class="text-end"><a class="text-decoration-none fw-bold text-primary" href="#">Det</a></td>
                </tr>
                <tr>
                  <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                  <td><div class="fw-bold">Pant</div></td>
                  <td>Kid Cloths</td>
                  <td>$86.65</td>
                  <td>74</td>
                  <td><span class="badge rounded-pill text-bg-warning-subtle border border-warning-subtle text-warning fw-bold">Draft</span></td>
                  <td class="text-end"><a class="text-decoration-none fw-bold text-primary" href="#">Det</a></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </section>
    </main>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>