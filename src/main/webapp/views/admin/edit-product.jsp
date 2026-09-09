<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
=======
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa sản phẩm</title>
</head>
<body>
<<<<<<< HEAD
  <div class="card shadow-sm" style="max-width:600px;">
    <div class="card-body p-4">
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
      <img class="thumb-square-sm mb-3" style="width:100px;height:100px;" src="${imgUrl}" alt="">

      <c:if test="${param.error == 'validation'}">
        <div class="alert alert-danger">Dữ liệu không hợp lệ, vui lòng kiểm tra lại các trường bắt buộc.</div>
      </c:if>
      <form action="<c:url value='/admin/product/edit'/>" method="post" enctype="multipart/form-data"
            class="needs-validation" novalidate>
        <input type="hidden" name="id" value="${product.id}">
        <div class="mb-3">
          <label >Tên sản phẩm</label>
          <input type="text" class="form-control" value="${product.name}" name="name" required minlength="2" maxlength="255">
          <div class="invalid-feedback">Vui lòng nhập tên sản phẩm.</div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label >Giá (VNĐ)</label>
            <input class="form-control" type="number" min="0" step="1000" value="${product.price}" name="price" required>
            <div class="invalid-feedback">Giá phải >= 0.</div>
          </div>
          <div class="col-md-6 mb-3">
            <label >Số lượng tồn kho</label>
            <input class="form-control" type="number" min="0" step="1" value="${product.quantity}" name="quantity" required>
            <div class="invalid-feedback">Số lượng phải >= 0.</div>
          </div>
        </div>
        <div class="mb-3">
          <label >Danh mục</label>
=======
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
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
          <select class="form-control" name="cateId" required>
            <c:forEach items="${cateList}" var="cate">
              <option value="${cate.id}" ${cate.id == product.category.id ? 'selected' : ''}>${cate.name}</option>
            </c:forEach>
          </select>
        </div>
<<<<<<< HEAD
        <div class="mb-3">
          <label >Mô tả sản phẩm</label>
          <textarea class="form-control" name="description" rows="4">${product.description}</textarea>
        </div>
        <div class="mb-3">
          <label >Hình ảnh (chọn ảnh mới nếu muốn thay đổi)</label>
          <input type="file" name="image" class="form-control" accept="image/*">
        </div>
        <div class="d-flex">
          <button type="submit" class="btn btn-primary mr-2">Cập nhật</button>
          <button type="reset" class="btn btn-outline-secondary">Reset</button>
        </div>
      </form>
      <a class="d-inline-block mt-3 small" href="<c:url value='/admin/product/list'/>">&larr; Quay lại danh sách</a>
=======
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
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
    </div>
  </div>
</body>
</html>
