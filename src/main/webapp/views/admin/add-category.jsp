<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm danh mục</title>
</head>
<body>
    <div class="container">
    <div class="form-card">
      <form role="form" action="<c:url value='/admin/category/add'/>" method="post" enctype="multipart/form-data">
        <div class="form-group">
          <label>Tên danh mục</label>
          <input class="form-control" placeholder="Nhập tên danh mục" name="name" required>
        </div>
        <div class="form-group">
          <label>Ảnh đại diện</label>
          <input type="file" name="icon">
        </div>
        <div class="btn-row">
          <button type="submit" class="btn btn-primary">Thêm mới</button>
          <button type="reset" class="btn btn-secondary">Hủy</button>
        </div>
      </form>
      <a class="back-link" href="<c:url value='/admin/category/list'/>">&larr; Quay lại danh sách</a>
    </div>
  </div>
</body>
</html>
