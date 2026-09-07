<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm sản phẩm</title>
</head>
<body>
    <div class="container">
    <div class="form-card" style="max-width:560px;">
      <form role="form" action="<c:url value='/admin/product/add'/>" method="post" enctype="multipart/form-data">
        <div class="form-group">
          <label>Tên sản phẩm</label>
          <input class="form-control" placeholder="Nhập tên sản phẩm" name="name" required>
        </div>
        <div class="form-group">
          <label>Giá (VNĐ)</label>
          <input class="form-control" type="number" min="0" step="1000" placeholder="VD: 199000" name="price" required>
        </div>
        <div class="form-group">
          <label>Số lượng tồn kho</label>
          <input class="form-control" type="number" min="0" step="1" value="0" name="quantity" required>
        </div>
        <div class="form-group">
          <label>Danh mục</label>
          <select class="form-control" name="cateId" required>
            <option value="" disabled selected>-- Chọn danh mục --</option>
            <c:forEach items="${cateList}" var="cate">
              <option value="${cate.id}">${cate.name}</option>
            </c:forEach>
          </select>
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
    </div>
  </div>
</body>
</html>
