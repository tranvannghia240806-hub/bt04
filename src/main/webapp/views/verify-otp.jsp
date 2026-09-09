<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Kích hoạt tài khoản - Shopping.iotstar.vn</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/site.css'/>">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height:100vh;">
<div class="card shadow-sm" style="max-width:420px;width:100%;">
  <div class="card-body p-4">
    <h3 class="text-center mb-3">📧 Kích hoạt tài khoản</h3>
    <c:if test="${alert != null}">
      <div class="alert py-2 ${alert.contains('thành công') || alert.contains('Đã gửi lại') ? 'alert-success' : 'alert-danger'}">${alert}</div>
    </c:if>
    <p class="small text-muted">
      Mã OTP kích hoạt đã được gửi tới email đăng ký của tài khoản <b>${username}</b>.
      Vui lòng kiểm tra hộp thư (kể cả mục Spam) và nhập mã bên dưới.
    </p>
    <form action="<c:url value='/verify-otp'/>" method="post" class="needs-validation" novalidate>
      <input type="hidden" name="username" value="${username}">
      <div class="mb-3">
        <label class="form-label">Mã OTP (6 số)</label>
        <input type="text" name="otp" class="form-control" maxlength="6" minlength="6" pattern="[0-9]{6}" required
               inputmode="numeric" placeholder="123456">
        <div class="invalid-feedback">Nhập đúng 6 chữ số.</div>
      </div>
      <button type="submit" class="btn btn-primary w-100">Xác thực</button>
    </form>
    <p class="text-center mt-3 mb-1 small">
      Không nhận được mã?
      <a href="<c:url value='/verify-otp'><c:param name="username" value="${username}"/><c:param name="resend" value="1"/></c:url>">Gửi lại mã OTP</a>
    </p>
    <p class="text-center mb-0 small">
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
