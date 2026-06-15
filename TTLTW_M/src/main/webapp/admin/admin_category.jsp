<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Phân loại - Dashboard</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/css/admin/categorylist.css" rel="stylesheet" type="text/css" >
</head>

<body>
  <div class="app">
     <!-- Sidebar -->
    <jsp:include page="dashboard_menu.jsp" />
	
    <!-- Main -->
    <main class="main">
      <div class="page-header">
        <h1 class="page-title">Thể loại</h1>

        
      </div>

      <!-- Tree + table -->
      <div class="row g-3">
        

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
                      <th style="min-width:260px;">Thể loại</th>
                      <th style="width:160px;">Thể loại cha</th>
                      <th style="width:140px;">Số sản phẩm</th>
                      <th class="text-end" style="width:120px;">Hành động</th>
                    </tr>
                  </thead>
                  <tbody>                  
				  <c:forEach var="category" items="${categoryTree}">
                    <!-- level 2 -->
                    <tr>
                      <td><input class="form-check-input" type="checkbox" aria-label="Select row"></td>
                      <td>${category.name}</td>
                      <td>Shirts</td>
                      <td>0</td>
                      <td class="text-end">
                      <button type="button"
                    		class="btn btn-warning btnEditCategory"

                    		data-bs-toggle="modal"
                    		data-bs-target="#modalEditCategory"

                    		data-category-id="${category.categoryId}"
                    		data-category-name="${category.name}"
                    		data-category-description="${category.description}">
               				<i class="bi bi-pencil-square me-1"></i>
           					 </button>
           					 
           					 <button type="button"
        					class="btn btn-danger btnDeleteCategory"
        					data-category-id="${category.categoryId}"
        					data-category-name="${category.name}">
    						<i class="bi bi-trash me-1"></i>
							</button>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </section>
        </div>
        
        <div class="col-12 col-lg-4">
          <section class="panel h-100">
            <div class="panel-head">
              <h5>Cây Thể Loại</h5>
            </div>

           <div class="tree-wrap">
    			<t:category list="${categoryTree}" level="0" />
			</div>
          </section>
        </div>
      </div>
    </main>
    
    <!-- Modal -->
 	<jsp:include page="modal/admin/modal_category_add.jsp" />
 	<jsp:include page="modal/admin/modal_category_edit.jsp"/>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>

	document.querySelectorAll(".btnEditCategory")
    	.forEach(button => {

        button.addEventListener("click", function () {

            document.getElementById("editCategoryId").value =
                this.dataset.categoryId;

            document.getElementById("editCategoryName").value =
                this.dataset.categoryName;

            document.getElementById("editCategoryDescription").value =
                this.dataset.categoryDescription;
        });

    });
	
	document.querySelectorAll(".btnDeleteCategory")
    .forEach(button => {

        button.addEventListener("click", function () {

            const categoryId =
                this.dataset.categoryId;

            const categoryName =
                this.dataset.categoryName;

            const confirmDelete = confirm(
                "Bạn có chắc muốn xóa thể loại: "
                + categoryName + " ?"
            );

            if (confirmDelete) {
                window.location.href = "${pageContext.request.contextPath}/admin/category-list/delete?categoryId="+categoryId;
            }
        });

    });

</script>
</body>

</html>	