<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      <a href="<c:url value='/forgot-password'/>">&larr; Gửi lại mã OTP</a>
    </p>
  </div>
</div>
</body>
</html>
