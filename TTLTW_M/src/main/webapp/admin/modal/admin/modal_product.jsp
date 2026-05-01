<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="modalAddProduct" tabindex="-1">
  <div class="modal-dialog modal-lg"> <!-- thêm modal-lg cho đẹp -->
    <div class="modal-content">
      
      <form>
        
        <div class="modal-header">
          <h5 class="modal-title">Thêm sản phẩm</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>

        <div class="modal-body">
          <div class="row g-3">

            <div class="col-12 col-md-6">
              <label class="form-label">Tên sản phẩm</label>
              <input class="form-control" required />
            </div>

            <div class="col-12 col-md-6">
            <label class="form-label">Thể loại</label>
              <select class="form-select">
                <option>Women Cloths</option>
              </select>
              
            </div>

            <div class="col-12 col-md-6">
              <label class="form-label">Hình ảnh</label>
              <input class="form-control" required />
            </div>

            <div class="col-12 col-md-3">
              <label class="form-label">Giá</label>
              <input type="number" class="form-control" />
            </div>

            <div class="col-12 col-md-3">
              <label class="form-label">Số lượng</label>
              <input type="number" class="form-control" />
            </div>
            
			<div class="col-12 col-md-3">
              <label class="form-label">Trạng thái</label>
              <input type="number" class="form-control" />
            </div>
            
            <div class="col-12">
              <label class="form-label">Mô tả</label>
              <textarea class="form-control"></textarea>
            </div>

          </div>

          <div class="alert alert-success mt-3 d-none" id="successAlert">
            Lưu thành công
          </div>
        </div>

        <div class="modal-footer">
          <button type="reset" class="btn btn-outline-secondary me-auto">Reset</button>
          <button type="submit" class="btn btn-primary">Lưu sản phẩm</button>
        </div>

      </form>

    </div>
  </div>
</div>

