<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="modalEditCategory" tabindex="-1">
  <div class="modal-dialog modal-lg"> <!-- thêm modal-lg cho đẹp -->
    <div class="modal-content">
      
      <form action="${pageContext.request.contextPath}/admin/category-list/update" method="post">
        
        <div class="modal-header">
          <h5 class="modal-title">Thêm thể loại</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>

        <div class="modal-body">
          <div class="row g-3">

            <div class="col-12 col-md-6">
              <label class="form-label">Tên thể loại</label>
              <input name= "categoryName" id="editCategoryName" class="form-control" required />
              
              
            </div>
            
            <div class="col-12 col-md-6">
             	<label class="form-label">Id: </label>
             	 <input type="text"
                           name="categoryId"
                           id="editCategoryId"
                           class="form-control border-0 shadow-none bg-transparent p-0"
                           readonly/>
             </div>

            <div class="col-12">
              <label class="form-label">Mô tả</label>
              <textarea name= "categoryDescription"  id="editCategoryDescription" class="form-control"></textarea>
            </div>

          </div>

          <div class="alert alert-success mt-3 d-none" id="successAlert">
            Lưu thành công
          </div>
        </div>

        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Sửa thể loại</button>
        </div>

      </form>

    </div>
  </div>
</div>

