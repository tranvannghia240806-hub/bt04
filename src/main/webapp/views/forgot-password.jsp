<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quên mật khẩu - Shopping.iotstar.vn</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/site.css'/>">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height:100vh;">
<div class="card shadow-sm" style="max-width:420px;width:100%;">
  <div class="card-body p-4">
    <h3 class="text-center mb-3">🔑 Quên mật khẩu</h3>
    <c:if test="${alert != null}">
      <div class="alert alert-danger py-2">${alert}</div>
    </c:if>
    <p class="small text-muted">
      Nhập đúng <b>tài khoản</b> và <b>email</b> đã đăng ký, hệ thống sẽ gửi mã OTP về email để bạn đặt lại mật khẩu.
    </p>
    <form action="<c:url value='/forgot-password'/>" method="post" class="needs-validation" novalidate>
      <div class="mb-3">
        <label class="form-label">Tài khoản</label>
        <input type="text" name="username" class="form-control" required minlength="3">
        <div class="invalid-feedback">Vui lòng nhập tài khoản.</div>
      </div>
      <div class="mb-3">
        <label class="form-label">Email đã đăng ký</label>
        <input type="email" name="email" class="form-control" required>
        <div class="invalid-feedback">Vui lòng nhập email hợp lệ.</div>
      </div>
      <button type="submit" class="btn btn-primary w-100">Gửi mã OTP</button>
    </form>
    <p class="text-center mt-3 mb-0 small">
      <a href="<c:url value='/login'/>">&larr; Quay lại đăng nhập</a>
    </p>
  </div>
</div>
<<<<<<< HEAD
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="<c:url value='/assets/js/validation.js'/>"></script>
=======
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
</body>
</html>
