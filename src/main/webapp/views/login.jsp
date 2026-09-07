<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<%@ include file="/common/shared-style.jsp"%>
</head>
<body>
<div class="auth-wrapper">
  <div class="auth-box">
    <h2>Đăng nhập hệ thống</h2>
    <c:if test="${alert != null}">
      <div class="alert alert-danger">${alert}</div>
    </c:if>
    <form action="<c:url value='/login'/>" method="post">
      <input type="text" placeholder="Tài khoản" name="username" class="form-control" required>
      <input type="password" placeholder="Mật khẩu" name="password" class="form-control" required>
      <div class="between-link">
        <label style="display:flex;align-items:center;gap:6px;">
          <input type="checkbox" name="remember"> Nhớ tôi
        </label>
        <a href="<c:url value='/forgot-password'/>">Quên mật khẩu?</a>
      </div>
      <button type="submit" class="btn btn-primary">Đăng nhập</button>
    </form>
    <p class="footer-link">
      Chưa có tài khoản? <a href="<c:url value='/register'/>">Đăng ký ngay</a>
    </p>
  </div>
</div>
</body>
</html>
