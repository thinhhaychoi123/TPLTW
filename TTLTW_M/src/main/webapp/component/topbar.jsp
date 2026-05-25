<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
     
<div class="container-fluid px-5 d-none border-bottom d-lg-block">
        <div class="row gx-0 align-items-center">
            <div class="col-lg-4 text-center text-lg-start mb-lg-0">
                <div class="d-inline-flex align-items-center" style="height: 45px;">
                    <a href="#" class="text-muted me-2"> Hỗ trợ</a><small> / </small>
                    <a href="#" class="text-muted mx-2"> Chính sách</a><small> / </small>
                    <a href="#" class="text-muted ms-2"> Liên hệ</a>
                </div>
            </div>
            <div class="col-lg-4 text-center d-flex align-items-center justify-content-center">
                <small class="text-dark"></small>
            </div>
            <div class="col-lg-4 text-center text-lg-end">
                <div class="d-inline-flex align-items-center" style="height: 45px;">
                    <div class="dropdown">
                        <a href="#" class="dropdown-toggle text-muted ms-2" data-bs-toggle="dropdown">
                        <small><i class="fa fa-home me-2"></i>
                        <c:choose>
                       	<c:when test="${not empty currentUser}">
                        	 Xin chào, ${currentUser.userName}
                         </c:when> 
                         <c:otherwise>
                         Tài khoản
                         </c:otherwise>
                        </c:choose>
                         </small></a>
                        <div class="dropdown-menu rounded">
                        	<c:if test="${empty currentUser}">
								<a href="${pageContext.request.contextPath}/login" class="dropdown-item"> Đăng nhập</a>
							</c:if>
                           
                         
                            <c:if test="${not empty currentUser}">
                            	 <c:if test="${sessionScope.currentUser.roleId == 2}">
                                	<a href="${pageContext.request.contextPath}/admin/dashboard" class="dropdown-item"> Admin Dashboard</a>
                				</c:if>
								<a href="${pageContext.request.contextPath}/logout" class="dropdown-item"> Đăng xuất</a>
							</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid px-5 py-4 d-none d-lg-block">
        <div class="row gx-0 align-items-center text-center">
            <div class="col-md-4 col-lg-3 text-center text-lg-start">
                <div class="d-inline-flex align-items-center">
                    <a href="/" class="navbar-brand d-flex align-items-center p-0">
    					<img src="img/logo.png" alt="Logo" style="height: 50px;" class="me-2">
    						<span class="fs-3 text-primary">
        						<i class="fas text-secondary me-2"></i>BVTV
    						</span>
					</a>
                </div>
            </div>
            <div class="col-md-4 col-lg-6 text-center">
                <div class="position-relative ps-4">
                    <div class="d-flex border rounded-pill">
                        <input class="form-control border-0 rounded-pill w-100 py-3" type="text"
                            data-bs-target="#dropdownToggle123" placeholder="Tìm thuốc trừ sâu, trừ cỏ... ">
                        <select class="form-select text-dark border-0 border-start rounded-0 p-3" style="width: 200px;">
                            <option value="All Category">Các danh mục</option>
                            <option value="Pest Control-2">Thuốc trừ sâu</option>
                            <option value="Pest Control-3">Thuốc trừ cỏ</option>
                            <option value="Pest Control-4">Thuốc trừ bệnh</option>
                        </select>
                        <button type="button" class="btn btn-primary rounded-pill py-3 px-5" style="border: 0;"><i
                                class="fas fa-search"></i></button>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 text-center text-lg-end">
                <div class="d-inline-flex align-items-center">
                    <a href="#" class="text-muted d-flex align-items-center justify-content-center me-3"><span
                            class="rounded-circle btn-md-square border"><i class="fas fa-random"></i></a>
                    <a href="#" class="text-muted d-flex align-items-center justify-content-center me-3"><span
                            class="rounded-circle btn-md-square border"><i class="fas fa-heart"></i></a>
                    <a href="${pageContext.request.contextPath}/cart" class="text-muted d-flex align-items-center justify-content-center"><span
                            class="rounded-circle btn-md-square border"><i class="fas fa-shopping-cart"></i></span>
                        <span class="text-dark ms-2">$0.00</span></a>
                </div>
            </div>
        </div>
    </div>