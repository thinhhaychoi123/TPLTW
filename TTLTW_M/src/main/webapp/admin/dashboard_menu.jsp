
    <aside class="sidebar">
      <div class="brand">
        <div class="brand-badge">CO</div>
        <div>
          <div style="font-weight:900; font-size:18px;">Spodut</div>
          <div style="font-size:12px; color:#6b7280;">Admin Panel</div>
        </div>
      </div>

      <div class="nav-section-title">Menu</div>

      <a class="nav-item  ${activeMenu == 'dashboard' ? 'active' : ''}" 
      href="${pageContext.request.contextPath}/admin/dashboard">
        <i class="bi bi-grid-3x3-gap"></i>
        <span>Dashboard</span>
      </a>

      <a class="nav-item">
        <i class="bi bi-bag"></i>
        <span>Products</span>
      </a>

      <a class="nav-item ${activeMenu == 'product' ? 'active' : ''} ms-3" 
      href="${pageContext.request.contextPath}/admin/product-list" style="margin-top:-2px;">
        <i class="bi bi-list-check"></i>
        <span>Product List</span>
      </a>

      <a class="nav-item  ${activeMenu == 'category' ? 'active' : ''} ms-3" href="${pageContext.request.contextPath}/admin/category-list" style="margin-top:-2px;">
        <i class="bi bi-tag"></i>
        <span>Categories</span>
      </a>

      <div class="nav-section-title mt-2">Others</div>

      <a class="nav-item" href="#">
        <i class="bi bi-receipt"></i>
        <span>Sales</span>
      </a>

      <a class="nav-item" href="#">
        <i class="bi bi-people"></i>
        <span>Customers</span>
      </a>

      <a class="nav-item" href="#">
        <i class="bi bi-graph-up"></i>
        <span>Analytics</span>
      </a>

      <a class="nav-item" href="#">
        <i class="bi bi-bell"></i>
        <span>Notifications</span>
      </a>

      <a class="nav-item" href="#">
        <i class="bi bi-gear"></i>
        <span>Settings</span>
      </a>
    </aside>
