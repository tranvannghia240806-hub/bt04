<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa danh mục</title>
</head>
<body>
    <div class="container">
    <div class="form-card">
      <c:url value="/admin/category/edit" var="editUrl"></c:url>
      <form role="form" action="${editUrl}" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${category.id}">

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
        <img class="preview-img" width="140" src="${imgUrl}" alt="">

        <div class="form-group">
          <label>Tên danh mục</label>
          <input type="text" class="form-control" value="${category.name}" name="name" required>
        </div>
        <div class="form-group">
          <label>Ảnh đại diện (chọn ảnh mới nếu muốn thay đổi)</label>
          <input type="file" name="icon">
        </div>
        <div class="btn-row">
          <button type="submit" class="btn btn-primary">Cập nhật</button>
          <button type="reset" class="btn btn-secondary">Reset</button>
        </div>
      </form>
      <a class="back-link" href="<c:url value='/admin/category/list'/>">&larr; Quay lại danh sách</a>
    </div>
  </div>
</body>
</html>
