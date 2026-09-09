<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm sản phẩm</title>
</head>
<body>
  <div class="card shadow-sm" style="max-width:600px;">
    <div class="card-body p-4">
      <c:if test="${param.error == 'validation'}">
        <div class="alert alert-danger">Dữ liệu không hợp lệ, vui lòng kiểm tra lại các trường bắt buộc.</div>
      </c:if>
      <form action="<c:url value='/admin/product/add'/>" method="post" enctype="multipart/form-data"
            class="needs-validation" novalidate>
        <div class="mb-3">
          <label >Tên sản phẩm</label>
          <input class="form-control" name="name" required minlength="2" maxlength="255" placeholder="Nhập tên sản phẩm">
          <div class="invalid-feedback">Vui lòng nhập tên sản phẩm.</div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label >Giá (VNĐ)</label>
            <input class="form-control" type="number" min="0" step="1000" placeholder="VD: 199000" name="price" required>
            <div class="invalid-feedback">Giá phải >= 0.</div>
          </div>
          <div class="col-md-6 mb-3">
            <label >Số lượng tồn kho</label>
            <input class="form-control" type="number" min="0" step="1" value="0" name="quantity" required>
            <div class="invalid-feedback">Số lượng phải >= 0.</div>
          </div>
        </div>
        <div class="mb-3">
          <label >Danh mục</label>
          <select class="form-control" name="cateId" required>
            <option value="" disabled selected>-- Chọn danh mục --</option>
            <c:forEach items="${cateList}" var="cate">
              <option value="${cate.id}">${cate.name}</option>
            </c:forEach>
          </select>
<<<<<<< HEAD
          <div class="invalid-feedback">Vui lòng chọn danh mục.</div>
        </div>
        <div class="mb-3">
          <label >Mô tả sản phẩm</label>
          <textarea class="form-control" name="description" rows="4" placeholder="Mô tả chi tiết sản phẩm..."></textarea>
        </div>
        <div class="mb-3">
          <label >Hình ảnh</label>
          <input type="file" name="image" class="form-control" accept="image/*">
        </div>
        <div class="d-flex">
          <button type="submit" class="btn btn-primary mr-2">Thêm mới</button>
          <button type="reset" class="btn btn-outline-secondary">Hủy</button>
        </div>
      </form>
      <a class="d-inline-block mt-3 small" href="<c:url value='/admin/product/list'/>">&larr; Quay lại danh sách</a>
=======
        </div>
        <div class="form-group">
          <label>Mô tả sản phẩm</label>
          <textarea class="form-control" name="description" rows="4" placeholder="Mô tả chi tiết sản phẩm..."></textarea>
        </div>
        <div class="form-group">
          <label>Hình ảnh</label>
          <input type="file" name="image">
        </div>
        <div class="btn-row">
          <button type="submit" class="btn btn-primary">Thêm mới</button>
          <button type="reset" class="btn btn-secondary">Hủy</button>
        </div>
      </form>
      <a class="back-link" href="<c:url value='/admin/product/list'/>">&larr; Quay lại danh sách</a>
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
    </div>
  </div>
</body>
</html>
