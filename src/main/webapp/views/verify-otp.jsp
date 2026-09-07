<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kích hoạt tài khoản</title>
<%@ include file="/common/shared-style.jsp"%>
</head>
<body>
<div class="auth-wrapper">
  <div class="auth-box">
    <h2>Kích hoạt tài khoản</h2>
    <c:if test="${alert != null}">
      <div class="alert ${alert.contains('thành công') || alert.contains('Đã gửi lại') ? 'alert-success' : 'alert-danger'}">${alert}</div>
    </c:if>
    <p style="font-size:13px;color:var(--muted);margin-top:-8px;">
      Mã OTP kích hoạt đã được gửi tới email đăng ký của tài khoản <b>${username}</b>.
      Vui lòng kiểm tra hộp thư (kể cả mục Spam) và nhập mã bên dưới.
    </p>
    <form action="<c:url value='/verify-otp'/>" method="post">
      <input type="hidden" name="username" value="${username}">
      <input type="text" placeholder="Mã OTP (6 số)" name="otp" class="form-control" maxlength="6" required>
      <button type="submit" class="btn btn-primary">Xác thực</button>
    </form>
    <p class="footer-link">
      Không nhận được mã?
      <a href="<c:url value='/verify-otp'><c:param name="username" value="${username}"/><c:param name="resend" value="1"/></c:url>">Gửi lại mã OTP</a>
    </p>
    <p class="footer-link">
      <a href="<c:url value='/login'/>">&larr; Quay lại đăng nhập</a>
    </p>
  </div>
</div>
</body>
</html>
