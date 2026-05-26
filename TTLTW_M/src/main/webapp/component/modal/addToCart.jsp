<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="addToCartModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow rounded-4">

            <!-- HEADER -->
            <div class="modal-header border-0">
                <h5 class="modal-title fw-bold">
                    Thêm vào giỏ hàng
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>
            </div>

            <!-- BODY -->
            <div class="modal-body">

                <div class="row align-items-center">

                    <!-- IMAGE -->
                    <div class="col-4">
                        <img id="modalProductImage"
                             src=""
                             class="img-fluid rounded"
                             alt=""
                             style="height: 140px; width: 100%; object-fit: cover;">
                    </div>

                    <!-- INFO -->
                    <div class="col-8">

                        <h5 id="modalProductName" class="fw-bold mb-3">
                            Tên sản phẩm
                        </h5>

                        <div class="text-danger fw-bold fs-4 mb-3"
                             id="modalProductPrice">
                            0đ
                        </div>

                        <!-- QUANTITY -->
                        <div class="d-flex align-items-center">

                            <span class="me-3 fw-semibold">
                                Số lượng:
                            </span>

                            <div class="input-group" style="width: 140px;">

                                <button class="btn btn-outline-secondary"
                                        type="button"
                                        id="decreaseQty">
                                    -
                                </button>

                                <input type="text"
                                       class="form-control text-center"
                                       id="productQty"
                                       value="1">

                                <button class="btn btn-outline-secondary"
                                        type="button"
                                        id="increaseQty">
                                    +
                                </button>

                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                         <span class="me-3 fw-semibold">
                                Tổng tạm tính:
                            </span>
 						<div class="text-primary fw-bold fs-4" id="modalTotalPrice">
                            0d
                        </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- FOOTER -->
            <div class="modal-footer border-0">

                <button type="button"
                        class="btn btn-light rounded-pill px-4"
                        data-bs-dismiss="modal">
                    Hủy
                </button>

                <button type="button"
                        class="btn btn-primary rounded-pill px-4"
                        id="confirmAddToCart">
                    <i class="fa fa-shopping-cart me-2"></i>
                    Thêm vào giỏ
                </button>

            </div>
        </div>
    </div>
</div>

<script>

    let currentProductId = null;
    
    let currentProductPrice = 0;

    const addToCartButtons = document.querySelectorAll('.add-to-cart-btn');

    
    function updateTotalPrice() {

        const quantity =
            parseInt(document.getElementById('productQty').value);

        const total =
            currentProductPrice * quantity;

        document.getElementById('modalTotalPrice').innerText = total;
    }
    function beginAddToCart(quantity) {
    	fetch("${pageContext.request.contextPath}/cart?action=add&pid="+currentProductId+"&quantity="+quantity, {
            method: "POST"
        })
        .then(res => res.json())
        .then(data => {
        	console.log("Type message: "+data.type);
        	console.log("Message: "+data.message);
        })
        .catch(() => {
        	console.log("Error throw for POST ADD ITEM");
        });
    }
    addToCartButtons.forEach(button => {

        button.addEventListener('click', function () {

            currentProductId = this.dataset.productId;
            
            currentProductPrice = this.dataset.productPrice;

            document.getElementById('modalProductName').innerText =
                this.dataset.productName;

            document.getElementById('modalProductPrice').innerText =
                this.dataset.productPrice + 'đ';

            document.getElementById('modalProductImage').src =
                this.dataset.productImage;

            document.getElementById('productQty').value = 1;
            
            updateTotalPrice();
        });

    });

    // Tăng số lượng
    document.getElementById('increaseQty')
        .addEventListener('click', function () {

            const qtyInput = document.getElementById('productQty');

            qtyInput.value = parseInt(qtyInput.value) + 1;
            
            updateTotalPrice();
        });

    // Giảm số lượng
    document.getElementById('decreaseQty')
        .addEventListener('click', function () {

            const qtyInput = document.getElementById('productQty');

            let qty = parseInt(qtyInput.value);

            if (qty > 1) {
                qtyInput.value = qty - 1;
            }
            
            updateTotalPrice();
        });

    // Confirm add cart
    document.getElementById('confirmAddToCart')
        .addEventListener('click', function () {

            const quantity =
                document.getElementById('productQty').value;

            console.log({
                productId: currentProductId,
                quantity: quantity
            });
            if(!quantity || quantity <= 0){
            	console.log("The quantity to low: "+quantity);
            	return;
            }
            beginAddToCart(quantity);
            // Đóng modal
            const modal =
                bootstrap.Modal.getInstance(
                    document.getElementById('addToCartModal')
                );

            modal.hide();
        });

</script>