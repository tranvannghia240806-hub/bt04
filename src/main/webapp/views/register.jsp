<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Đăng ký - Shopping.iotstar.vn</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/site.css'/>">
</head>
<body class="bg-light d-flex align-items-center justify-content-center py-4" style="min-height:100vh;">
<div class="card shadow-sm" style="max-width:460px;width:100%;">
  <div class="card-body p-4">
    <h3 class="text-center mb-3">🛍️ Tạo tài khoản mới</h3>
    <c:if test="${alert != null}">
      <div class="alert alert-danger py-2">${alert}</div>
    </c:if>
    <form action="<c:url value='/register'/>" method="post" class="needs-validation" novalidate>
      <div class="mb-3">
        <label class="form-label">Tài khoản</label>
        <input type="text" name="username" class="form-control" required minlength="3" maxlength="100"
               pattern="[a-zA-Z0-9_]+" placeholder="VD: nguyenvana">
        <div class="invalid-feedback">Tài khoản chỉ gồm chữ, số, dấu gạch dưới, tối thiểu 3 ký tự.</div>
      </div>
      <div class="mb-3">
        <label class="form-label">Họ tên</label>
        <input type="text" name="fullname" class="form-control" maxlength="255" placeholder="Nguyễn Văn A">
      </div>
      <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" name="email" class="form-control" required placeholder="ban@gmail.com">
        <div class="invalid-feedback">Vui lòng nhập email hợp lệ.</div>
      </div>
      <div class="mb-3">
        <label class="form-label">Số điện thoại</label>
        <input type="tel" name="phone" class="form-control" pattern="[0-9]{9,11}" placeholder="09xxxxxxxx">
        <div class="invalid-feedback">Số điện thoại gồm 9-11 chữ số.</div>
      </div>
      <div class="mb-3">
        <label class="form-label">Mật khẩu</label>
        <input type="password" name="password" id="password" class="form-control" required minlength="6">
        <div class="invalid-feedback">Mật khẩu phải có ít nhất 6 ký tự.</div>
      </div>
      <div class="mb-3">
        <label class="form-label">Nhập lại mật khẩu</label>
        <input type="password" name="repassword" id="repassword" class="form-control" required minlength="6">
        <div class="invalid-feedback">Mật khẩu nhập lại không khớp.</div>
      </div>
      <button type="submit" class="btn btn-primary w-100">Tạo tài khoản</button>
    </form>
    <p class="text-center mt-3 mb-0 small">
      Đã có tài khoản? <a href="<c:url value='/login'/>">Đăng nhập</a>
    </p>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="<c:url value='/assets/js/validation.js'/>"></script>
<script>
  // Kiểm tra 2 mật khẩu khớp nhau (client-side), server vẫn kiểm tra lại lần nữa cho chắc.
  var pw = document.getElementById('password');
  var repw = document.getElementById('repassword');
  function checkPasswordMatch() {
    if (pw.value !== repw.value) {
      repw.setCustomValidity('Mật khẩu nhập lại không khớp');
    } else {
      repw.setCustomValidity('');
    }
  }
  pw.addEventListener('input', checkPasswordMatch);
  repw.addEventListener('input', checkPasswordMatch);
</script>
</body>
</html>
