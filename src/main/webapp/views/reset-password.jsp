<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Đặt lại mật khẩu - Shopping.iotstar.vn</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/site.css'/>">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height:100vh;">
<div class="card shadow-sm" style="max-width:420px;width:100%;">
  <div class="card-body p-4">
    <h3 class="text-center mb-3">🔑 Nhập mã OTP</h3>
    <c:if test="${alert != null}">
      <div class="alert alert-danger py-2">${alert}</div>
    </c:if>
    <p class="small text-muted">
      Mã OTP đã được gửi tới email của tài khoản <b>${username}</b>. Mã có hiệu lực trong ít phút,
      nhập mã cùng mật khẩu mới bên dưới.
    </p>
    <form action="<c:url value='/reset-password'/>" method="post" class="needs-validation" novalidate>
      <input type="hidden" name="username" value="${username}">
      <div class="mb-3">
        <label class="form-label">Mã OTP (6 số)</label>
        <input type="text" name="otp" class="form-control" maxlength="6" minlength="6" pattern="[0-9]{6}" required
               inputmode="numeric" placeholder="123456">
        <div class="invalid-feedback">Nhập đúng 6 chữ số.</div>
      </div>
      <div class="mb-3">
        <label class="form-label">Mật khẩu mới</label>
        <input type="password" name="newpassword" id="newpassword" class="form-control" required minlength="6">
        <div class="invalid-feedback">Mật khẩu phải có ít nhất 6 ký tự.</div>
      </div>
      <div class="mb-3">
        <label class="form-label">Nhập lại mật khẩu mới</label>
        <input type="password" name="renewpassword" id="renewpassword" class="form-control" required minlength="6">
        <div class="invalid-feedback">Mật khẩu nhập lại không khớp.</div>
      </div>
      <button type="submit" class="btn btn-primary w-100">Đặt lại mật khẩu</button>
    </form>
    <p class="text-center mt-3 mb-0 small">
=======
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt lại mật khẩu</title>
<%@ include file="/common/shared-style.jsp"%>
</head>
<body>
<div class="auth-wrapper">
  <div class="auth-box">
    <h2>Nhập mã OTP</h2>
    <c:if test="${alert != null}">
      <div class="alert alert-danger">${alert}</div>
    </c:if>
    <p style="font-size:13px;color:var(--muted);margin-top:-8px;">
      Mã OTP đã được gửi tới email của tài khoản <b>${username}</b>. Mã có hiệu lực trong ít phút,
      nhập mã cùng mật khẩu mới bên dưới.
    </p>
    <form action="<c:url value='/reset-password'/>" method="post">
      <input type="hidden" name="username" value="${username}">
      <input type="text" placeholder="Mã OTP (6 số)" name="otp" class="form-control" maxlength="6" required>
      <input type="password" placeholder="Mật khẩu mới" name="newpassword" class="form-control" required>
      <input type="password" placeholder="Nhập lại mật khẩu mới" name="renewpassword" class="form-control" required>
      <button type="submit" class="btn btn-primary">Đặt lại mật khẩu</button>
    </form>
    <p class="footer-link">
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
      <a href="<c:url value='/forgot-password'/>">&larr; Gửi lại mã OTP</a>
    </p>
  </div>
</div>
<<<<<<< HEAD
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="<c:url value='/assets/js/validation.js'/>"></script>
<script>
  var pw = document.getElementById('newpassword');
  var repw = document.getElementById('renewpassword');
  function checkMatch() {
    repw.setCustomValidity(pw.value !== repw.value ? 'Mật khẩu nhập lại không khớp' : '');
  }
  pw.addEventListener('input', checkMatch);
  repw.addEventListener('input', checkMatch);
</script>
=======
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
</body>
</html>
