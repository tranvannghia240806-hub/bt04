<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Đăng nhập - Shopping.iotstar.vn</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/site.css'/>">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height:100vh;">
<div class="card shadow-sm" style="max-width:400px;width:100%;">
  <div class="card-body p-4">
    <h3 class="text-center mb-3">🛍️ Đăng nhập</h3>
    <c:if test="${alert != null}">
      <div class="alert alert-danger py-2">${alert}</div>
    </c:if>
    <form action="<c:url value='/login'/>" method="post" class="needs-validation" novalidate>
      <div class="mb-3">
        <label class="form-label">Tài khoản</label>
        <input type="text" name="username" class="form-control" required minlength="3" maxlength="100">
        <div class="invalid-feedback">Vui lòng nhập tài khoản (ít nhất 3 ký tự).</div>
      </div>
      <div class="mb-3">
        <label class="form-label">Mật khẩu</label>
        <input type="password" name="password" class="form-control" required minlength="6">
        <div class="invalid-feedback">Mật khẩu phải có ít nhất 6 ký tự.</div>
      </div>
      <div class="d-flex justify-content-between align-items-center mb-3">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" name="remember" id="remember">
          <label class="form-check-label" for="remember">Nhớ tôi</label>
        </div>
        <a href="<c:url value='/forgot-password'/>" class="small">Quên mật khẩu?</a>
      </div>
      <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
    </form>
    <p class="text-center mt-3 mb-0 small">
      Chưa có tài khoản? <a href="<c:url value='/register'/>">Đăng ký ngay</a>
    </p>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="<c:url value='/assets/js/validation.js'/>"></script>
</body>
</html>
