<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Hồ sơ của tôi - Shopping</title>
</head>
<body>
  <div class="container py-4" style="max-width:600px;">
    <h2 class="mb-3">Hồ sơ của tôi</h2>

    <c:if test="${param.success == '1'}">
      <div class="alert alert-success">Cập nhật hồ sơ thành công!</div>
    </c:if>
    <c:if test="${param.error == 'upload'}">
      <div class="alert alert-danger">
        Có lỗi xảy ra khi lưu ảnh đại diện. Vui lòng thử lại với ảnh nhỏ hơn hoặc kiểm tra kết nối mạng.
      </div>
    </c:if>

    <div class="card shadow-sm">
      <div class="card-body p-4">
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
        <img class="avatar-circle mb-3" src="${avatarUrl}" alt="Avatar">

        <form action="<c:url value='/profile'/>" method="post" enctype="multipart/form-data"
              class="needs-validation" novalidate>
          <div class="mb-3">
            <label >Tài khoản</label>
            <input type="text" class="form-control" value="${user.userName}" disabled>
          </div>
          <div class="mb-3">
            <label >Email</label>
            <input type="text" class="form-control" value="${user.email}" disabled>
          </div>
          <div class="mb-3">
            <label >Họ và tên</label>
            <input type="text" name="fullname" class="form-control" value="${user.fullName}"
                   maxlength="255" placeholder="Nhập họ tên">
          </div>
          <div class="mb-3">
            <label >Số điện thoại</label>
            <input type="tel" name="phone" class="form-control" value="${user.phone}"
                   pattern="[0-9]{9,11}" placeholder="09xxxxxxxx">
            <div class="invalid-feedback">Số điện thoại gồm 9-11 chữ số (để trống nếu không muốn đổi).</div>
          </div>
          <div class="mb-3">
            <label >Ảnh đại diện (chọn ảnh mới nếu muốn thay đổi)</label>
            <input type="file" name="avatar" class="form-control" accept="image/*">
          </div>
          <button type="submit" class="btn btn-primary">Cập nhật</button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
