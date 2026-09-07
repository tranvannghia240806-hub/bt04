<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
<%@ include file="/common/shared-style.jsp"%>
</head>
<body>
<div class="auth-wrapper">
  <div class="auth-box" style="max-width:440px;">
    <h2>Tạo tài khoản mới</h2>
    <c:if test="${alert != null}">
      <div class="alert alert-danger">${alert}</div>
    </c:if>
    <form action="<c:url value='/register'/>" method="post">
      <input type="text" placeholder="Tài khoản" name="username" class="form-control" required>
      <input type="text" placeholder="Họ tên" name="fullname" class="form-control">
      <input type="email" placeholder="Email" name="email" class="form-control" required>
      <input type="text" placeholder="Số điện thoại" name="phone" class="form-control">
      <input type="password" placeholder="Mật khẩu" name="password" class="form-control" required>
      <input type="password" placeholder="Nhập lại mật khẩu" name="repassword" class="form-control" required>
      <button type="submit" class="btn btn-primary">Tạo tài khoản</button>
    </form>
    <p class="footer-link">
      Đã có tài khoản? <a href="<c:url value='/login'/>">Đăng nhập</a>
    </p>
  </div>
</div>
</body>
</html>
