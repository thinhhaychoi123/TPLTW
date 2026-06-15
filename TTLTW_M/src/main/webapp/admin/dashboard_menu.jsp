<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <aside class="sidebar">
      <div class="brand">
        <div class="brand-badge">CO</div>
        <div>
          <div style="font-weight:900; font-size:18px;">Spodut</div>
          <div style="font-size:12px; color:#6b7280;">Trang Admin</div>
        </div>
      </div>

      <div class="nav-section-title">Menu</div>

      <a class="nav-item  ${activeMenu == 'dashboard' ? 'active' : ''}" 
      href="${pageContext.request.contextPath}/admin/dashboard">
        <i class="bi bi-grid-3x3-gap"></i>
        <span>Dashboard</span>
      </a>

      <a class="nav-item">
        <i class="bi bi-database"></i>
        <span>Quản lý</span>
      </a>

	  <a class="nav-item ${activeMenu == 'category' ? 'active' : ''} ms-3" href="${pageContext.request.contextPath}/admin/category-list" style="margin-top:-2px;">
        <i class="bi bi-tag"></i>
        <span>Thể loại</span>
      </a>

      <a class="nav-item ${activeMenu == 'product' ? 'active' : ''} ms-3" 
      href="${pageContext.request.contextPath}/admin/product-list" style="margin-top:-2px;">
        <i class="bi bi-bag"></i>
        <span>Sản phẩm</span>
      </a>
      
	 <a class="nav-item ${activeMenu == 'order' ? 'active' : ''} ms-3" 
      href="${pageContext.request.contextPath}/admin/order-list" style="margin-top:-2px;">
        <i class="bi bi-receipt"></i>
        <span>Đơn hàng</span>
      </a>
      
     <a class="nav-item ${activeMenu == 'customer' ? 'active' : ''} ms-3"
      	href="${pageContext.request.contextPath}/admin/customer-list" style="margin-top:-2px;">
        <i class="bi bi-people"></i>
        <span>Khách hàng</span>
      </a>
      
	 <a class="nav-item ${activeMenu == 'discount' ? 'active' : ''} ms-3" 
		href="${pageContext.request.contextPath}/admin/product-list?action=add" style="margin-top:-2px;">
        <i class="bi bi-percent"></i>
        <span>Mã giảm giá</span>
      </a>
      
      
      <div class="nav-section-title mt-2">Others</div>

      <a class="nav-item" href="#">
        <i class="bi bi-graph-up-arrow"></i>
        <span>Thống kê</span>
      </a>

      <a class="nav-item" href="#">
        <i class="bi bi-bell"></i>
        <span>Thông báo</span>
      </a>

      <a class="nav-item" href="#">
        <i class="bi bi-gear"></i>
        <span>Cài đặt</span>
      </a>
      <a class="nav-item" href="${pageContext.request.contextPath}/home">
        <i class="bi bi-arrow-left"></i>
        <span>Về trang chủ</span>
      </a>
    </aside>
