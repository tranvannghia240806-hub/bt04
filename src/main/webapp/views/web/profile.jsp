<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hồ sơ của tôi - Shopping</title>
</head>
<body>
  <div class="container" style="max-width:640px;">
    <h2 style="margin-bottom:20px;">Hồ sơ của tôi</h2>

    <c:if test="${param.success == '1'}">
      <div class="alert alert-success" style="margin-bottom:16px;">Cập nhật hồ sơ thành công!</div>
    </c:if>
    <c:if test="${param.error == 'upload'}">
      <div class="alert alert-danger" style="margin-bottom:16px;">
        Có lỗi xảy ra khi lưu ảnh đại diện. Vui lòng thử lại với ảnh nhỏ hơn hoặc kiểm tra kết nối mạng.
      </div>
    </c:if>

    <div class="form-card" style="max-width:560px;">
      <c:choose>
        <c:when test="${fn:startsWith(user.avatar, 'http')}">
          <c:set var="avatarUrl" value="${user.avatar}"/>
        </c:when>
        <c:otherwise>
          <c:url value="/image" var="avatarUrl">
            <c:param name="fname" value="${user.avatar}"/>
          </c:url>
        </c:otherwise>
      </c:choose>
      <img class="preview-img" width="120" style="border-radius:50%;object-fit:cover;height:120px;"
           src="${avatarUrl}" alt="Avatar">

      <form action="<c:url value='/profile'/>" method="post" enctype="multipart/form-data">
        <div class="form-group">
          <label>Tài khoản</label>
          <input type="text" class="form-control" value="${user.userName}" disabled>
        </div>
        <div class="form-group">
          <label>Email</label>
          <input type="text" class="form-control" value="${user.email}" disabled>
        </div>
        <div class="form-group">
          <label>Họ và tên</label>
          <input type="text" name="fullname" class="form-control" value="${user.fullName}" placeholder="Nhập họ tên">
        </div>
        <div class="form-group">
          <label>Số điện thoại</label>
          <input type="text" name="phone" class="form-control" value="${user.phone}" placeholder="Nhập số điện thoại">
        </div>
        <div class="form-group">
          <label>Ảnh đại diện (chọn ảnh mới nếu muốn thay đổi)</label>
          <input type="file" name="avatar">
        </div>
        <div class="btn-row">
          <button type="submit" class="btn btn-primary">Cập nhật</button>
        </div>
      </form>
    </div>
  </div>
</body>
</html>
