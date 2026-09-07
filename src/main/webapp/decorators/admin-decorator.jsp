<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</body>
</html>
