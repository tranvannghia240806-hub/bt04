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
<title>Hồ sơ của tôi - Shopping</title>
</head>
<body>
<<<<<<< HEAD
  <div class="container py-4" style="max-width:600px;">
    <h2 class="mb-3">Hồ sơ của tôi</h2>

    <c:if test="${param.success == '1'}">
      <div class="alert alert-success">Cập nhật hồ sơ thành công!</div>
    </c:if>
    <c:if test="${param.error == 'upload'}">
      <div class="alert alert-danger">
=======
  <div class="container" style="max-width:640px;">
    <h2 style="margin-bottom:20px;">Hồ sơ của tôi</h2>

    <c:if test="${param.success == '1'}">
      <div class="alert alert-success" style="margin-bottom:16px;">Cập nhật hồ sơ thành công!</div>
    </c:if>
    <c:if test="${param.error == 'upload'}">
      <div class="alert alert-danger" style="margin-bottom:16px;">
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
        Có lỗi xảy ra khi lưu ảnh đại diện. Vui lòng thử lại với ảnh nhỏ hơn hoặc kiểm tra kết nối mạng.
      </div>
    </c:if>

<<<<<<< HEAD
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
=======
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
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
    </div>
  </div>
</body>
</html>
