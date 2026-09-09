<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa danh mục</title>
</head>
<body>
  <div class="card shadow-sm" style="max-width:520px;">
    <div class="card-body p-4">
      <c:choose>
        <c:when test="${fn:startsWith(category.icon, 'http')}">
          <c:set var="imgUrl" value="${category.icon}"/>
        </c:when>
        <c:otherwise>
          <c:url value="/image" var="imgUrl">
            <c:param name="fname" value="${category.icon}"/>
          </c:url>
        </c:otherwise>
      </c:choose>
      <img class="thumb-square-sm mb-3" style="width:100px;height:100px;" src="${imgUrl}" alt="">

      <c:if test="${param.error == 'validation'}">
        <div class="alert alert-danger">Dữ liệu không hợp lệ, vui lòng kiểm tra lại các trường bắt buộc.</div>
      </c:if>
      <form action="<c:url value='/admin/category/edit'/>" method="post" enctype="multipart/form-data"
            class="needs-validation" novalidate>
        <input type="hidden" name="id" value="${category.id}">
        <div class="mb-3">
          <label >Tên danh mục</label>
          <input type="text" class="form-control" value="${category.name}" name="name" required minlength="2" maxlength="255">
          <div class="invalid-feedback">Vui lòng nhập tên danh mục (ít nhất 2 ký tự).</div>
        </div>
        <div class="mb-3">
          <label >Ảnh đại diện (chọn ảnh mới nếu muốn thay đổi)</label>
          <input type="file" name="icon" class="form-control" accept="image/*">
        </div>
        <div class="d-flex">
          <button type="submit" class="btn btn-primary mr-2">Cập nhật</button>
          <button type="reset" class="btn btn-outline-secondary">Reset</button>
        </div>
      </form>
      <a class="d-inline-block mt-3 small" href="<c:url value='/admin/category/list'/>">&larr; Quay lại danh sách</a>
    </div>
  </div>
</body>
</html>
