<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa sản phẩm</title>
</head>
<body>
    <div class="container">
    <div class="form-card" style="max-width:560px;">
      <c:url value="/admin/product/edit" var="editUrl"></c:url>
      <form role="form" action="${editUrl}" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${product.id}">

        <c:choose>
          <c:when test="${fn:startsWith(product.image, 'http')}">
            <c:set var="imgUrl" value="${product.image}"/>
          </c:when>
          <c:otherwise>
            <c:url value="/image" var="imgUrl">
              <c:param name="fname" value="${product.image}"/>
            </c:url>
          </c:otherwise>
        </c:choose>
        <img class="preview-img" width="140" src="${imgUrl}" alt="">

        <div class="form-group">
          <label>Tên sản phẩm</label>
          <input type="text" class="form-control" value="${product.name}" name="name" required>
        </div>
        <div class="form-group">
          <label>Giá (VNĐ)</label>
          <input class="form-control" type="number" min="0" step="1000" value="${product.price}" name="price" required>
        </div>
        <div class="form-group">
          <label>Số lượng tồn kho</label>
          <input class="form-control" type="number" min="0" step="1" value="${product.quantity}" name="quantity" required>
        </div>
        <div class="form-group">
          <label>Danh mục</label>
          <select class="form-control" name="cateId" required>
            <c:forEach items="${cateList}" var="cate">
              <option value="${cate.id}" ${cate.id == product.category.id ? 'selected' : ''}>${cate.name}</option>
            </c:forEach>
          </select>
        </div>
        <div class="form-group">
          <label>Mô tả sản phẩm</label>
          <textarea class="form-control" name="description" rows="4">${product.description}</textarea>
        </div>
        <div class="form-group">
          <label>Hình ảnh (chọn ảnh mới nếu muốn thay đổi)</label>
          <input type="file" name="image">
        </div>
        <div class="btn-row">
          <button type="submit" class="btn btn-primary">Cập nhật</button>
          <button type="reset" class="btn btn-secondary">Reset</button>
        </div>
      </form>
      <a class="back-link" href="<c:url value='/admin/product/list'/>">&larr; Quay lại danh sách</a>
    </div>
  </div>
</body>
</html>
