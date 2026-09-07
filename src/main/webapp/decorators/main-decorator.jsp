<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><decorator:title default="Shopping.iotstar.vn"/></title>
<%@ include file="/common/shared-style.jsp"%>
<decorator:head/>
</head>
<body>
  <div class="shop-navbar">
    <div class="brand"><a href="<c:url value='/home'/>" style="color:inherit;text-decoration:none;">🛍️ Shopping.iotstar.vn</a></div>
    <div class="nav-right">
      <a href="<c:url value='/home'/>">Trang chủ</a>
      <a href="<c:url value='/product'/>">Tất cả sản phẩm</a>
      <c:if test="${sessionScope.account != null}">
        <a href="<c:url value='/profile'/>">Hồ sơ của tôi</a>
        <span>Xin chào, <b>${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.userName}</b></span>
        <a href="<c:url value='/logout'/>">Đăng xuất</a>
      </c:if>
    </div>
  </div>

  <decorator:body/>
</body>
</html>
