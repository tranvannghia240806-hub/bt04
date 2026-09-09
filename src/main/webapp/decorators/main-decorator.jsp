<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
  Giao diện dựa trên template "Shoppers" (Colorlib / ThemeWagon free eCommerce templates) - dùng tự do phi thương mại
  Nguồn: ThemeWagon eCommerce Free Templates - thư mục Shoppers
-->
<!doctype html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><sitemesh:write property='title'/></title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="<c:url value='/assets/theme-shoppers/fonts/icomoon/style.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/theme-shoppers/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/theme-shoppers/css/owl.carousel.min.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/theme-shoppers/css/owl.theme.default.min.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/theme-shoppers/css/aos.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/theme-shoppers/css/style.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/site.css'/>">
<sitemesh:write property='head'/>
</head>
<body>

<div class="site-wrap">
  <header class="site-navbar" role="banner">
    <div class="site-navbar-top">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-12 col-md-4 order-1 text-center text-md-left">
            <div class="site-logo">
              <a href="<c:url value='/home'/>" class="js-logo-clone">🛍️ Shopping.iotstar.vn</a>
            </div>
          </div>
          <div class="col-12 col-md-8 order-2 text-center text-md-right">
            <div class="site-top-icons">
              <ul class="list-inline mb-0" style="display:inline-flex;gap:16px;align-items:center;">
                <c:choose>
                  <c:when test="${sessionScope.account != null}">
                    <li class="list-inline-item small text-muted">
                      Xin chào, <b>${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.userName}</b>
                    </li>
                    <li class="list-inline-item"><a href="<c:url value='/profile'/>"><span class="icon icon-person"></span> Hồ sơ</a></li>
                    <li class="list-inline-item"><a href="<c:url value='/logout'/>">Đăng xuất</a></li>
                  </c:when>
                  <c:otherwise>
                    <li class="list-inline-item"><a href="<c:url value='/login'/>"><span class="icon icon-person"></span> Đăng nhập</a></li>
                  </c:otherwise>
                </c:choose>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <nav class="site-navigation text-right text-md-center" role="navigation">
      <div class="container">
        <ul class="site-menu js-clone-nav d-none d-md-block">
          <li><a href="<c:url value='/home'/>">Trang chủ</a></li>
          <li><a href="<c:url value='/product'/>">Tất cả sản phẩm</a></li>
        </ul>
      </div>
    </nav>
  </header>

  <sitemesh:write property='body'/>

  <footer class="site-footer border-top">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center py-4">
          <p class="mb-0 small text-muted">
            &copy; 2026 Shopping.iotstar.vn — Giao diện: template "Shoppers" (Colorlib / ThemeWagon Free eCommerce Templates)
          </p>
        </div>
      </div>
    </div>
  </footer>
</div>

<script src="<c:url value='/assets/theme-shoppers/js/jquery-3.3.1.min.js'/>"></script>
<script src="<c:url value='/assets/theme-shoppers/js/jquery-ui.js'/>"></script>
<script src="<c:url value='/assets/theme-shoppers/js/popper.min.js'/>"></script>
<script src="<c:url value='/assets/theme-shoppers/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/theme-shoppers/js/owl.carousel.min.js'/>"></script>
<script src="<c:url value='/assets/theme-shoppers/js/aos.js'/>"></script>
<script src="<c:url value='/assets/theme-shoppers/js/main.js'/>"></script>
<script src="<c:url value='/assets/js/validation.js'/>"></script>
</body>
</html>
