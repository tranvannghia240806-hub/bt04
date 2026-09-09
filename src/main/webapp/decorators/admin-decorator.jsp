<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--
  Giao diện dựa trên template "SB Admin 2" (Start Bootstrap) - MIT License
  Nguồn: https://github.com/StartBootstrap/startbootstrap-sb-admin-2
-->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><sitemesh:write property='title'/></title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,600,700,800,900" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/StartBootstrap/startbootstrap-sb-admin-2/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/assets/css/site.css'/>">
<sitemesh:write property='head'/>
</head>
<body id="page-top">

<div id="wrapper">
  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='/admin/home'/>">
      <div class="sidebar-brand-icon"><i class="fas fa-store"></i></div>
      <div class="sidebar-brand-text mx-3">Shopping <sup>Admin</sup></div>
    </a>
    <hr class="sidebar-divider my-0">

    <li class="nav-item ${fn:contains(pageContext.request.requestURI, '/category/') ? 'active' : ''}">
      <a class="nav-link" href="<c:url value='/admin/category/list'/>">
        <i class="fas fa-fw fa-list"></i>
        <span>Danh mục</span>
      </a>
    </li>
    <li class="nav-item ${fn:contains(pageContext.request.requestURI, '/product/') ? 'active' : ''}">
      <a class="nav-link" href="<c:url value='/admin/product/list'/>">
        <i class="fas fa-fw fa-box"></i>
        <span>Sản phẩm</span>
      </a>
    </li>
    <hr class="sidebar-divider d-none d-md-block">
  </ul>

  <div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
          <i class="fa fa-bars"></i>
        </button>
        <ul class="navbar-nav ml-auto">
          <div class="topbar-divider d-none d-sm-block"></div>
          <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.account.userName}</span>
              <i class="fas fa-user-circle fa-lg text-gray-400"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
              <a class="dropdown-item" href="<c:url value='/profile'/>">
                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Hồ sơ
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="<c:url value='/logout'/>">
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Đăng xuất
              </a>
            </div>
          </li>
        </ul>
      </nav>

      <div class="container-fluid">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 class="h3 mb-0 text-gray-800"><sitemesh:write property='title'/></h1>
        </div>

        <sitemesh:write property='body'/>
      </div>
    </div>

    <footer class="sticky-footer bg-white">
      <div class="container my-auto">
        <div class="copyright text-center my-auto">
          <span>Shopping.iotstar.vn &copy; 2026 - Giao diện: SB Admin 2 (Start Bootstrap)</span>
        </div>
      </div>
    </footer>
  </div>
</div>

<a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.easing/1.4.1/jquery.easing.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/StartBootstrap/startbootstrap-sb-admin-2/js/sb-admin-2.min.js"></script>
<script src="<c:url value='/assets/js/validation.js'/>"></script>
=======
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><decorator:title default="Quản trị"/></title>
<%@ include file="/common/shared-style.jsp"%>
<decorator:head/>
</head>
<body>
  <div class="topbar">
    <h2><decorator:title default="Quản trị"/></h2>
    <div class="user-info">
      Xin chào, <b>${sessionScope.account.userName}</b>
      &nbsp;|&nbsp; <a href="<c:url value='/profile'/>">Hồ sơ</a>
      &nbsp;|&nbsp; <a href="<c:url value='/logout'/>">Đăng xuất</a>
    </div>
  </div>

  <div class="admin-tabs">
    <a href="<c:url value='/admin/category/list'/>"
       class="${fn:contains(pageContext.request.requestURI, '/category/') ? 'active' : ''}">Danh mục</a>
    <a href="<c:url value='/admin/product/list'/>"
       class="${fn:contains(pageContext.request.requestURI, '/product/') ? 'active' : ''}">Sản phẩm</a>
  </div>

  <decorator:body/>
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
</body>
</html>
