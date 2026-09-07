<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
<%@ include file="/common/shared-style.jsp"%>
</head>
<body>
<div class="auth-wrapper">
  <div class="auth-box">
    <h2>Quên mật khẩu</h2>
    <c:if test="${alert != null}">
      <div class="alert alert-danger">${alert}</div>
    </c:if>
    <p style="font-size:13px;color:var(--muted);margin-top:-8px;">
      Nhập đúng <b>tài khoản</b> và <b>email</b> đã đăng ký, hệ thống sẽ gửi mã OTP về email để bạn đặt lại mật khẩu.
    </p>
    <form action="<c:url value='/forgot-password'/>" method="post">
      <input type="text" placeholder="Tài khoản" name="username" class="form-control" required>
      <input type="email" placeholder="Email đã đăng ký" name="email" class="form-control" required>
      <button type="submit" class="btn btn-primary">Gửi mã OTP</button>
    </form>
    <p class="footer-link">
      <a href="<c:url value='/login'/>">&larr; Quay lại đăng nhập</a>
    </p>
  </div>
</div>
</body>
</html>
