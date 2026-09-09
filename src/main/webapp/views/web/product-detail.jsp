<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.name} - Shopping</title>
</head>
<body>
  <div class="bg-light py-3">
    <div class="container">
      <div class="row">
        <div class="col-md-12 mb-0">
          <a href="<c:url value='/home'/>">Trang chủ</a> <span class="mx-2 mb-0">/</span>
          <a href="<c:url value='/product'/>">Sản phẩm</a> <span class="mx-2 mb-0">/</span>
          <strong class="text-black">${product.name}</strong>
        </div>
      </div>
    </div>
  </div>

  <div class="site-section">
    <div class="container">
      <c:choose>
        <c:when test="${fn:startsWith(product.image, 'http')}">
          <c:set var="pImgUrl" value="${product.image}"/>
        </c:when>
        <c:otherwise>
          <c:url value="/image" var="pImgUrl">
            <c:param name="fname" value="${product.image}"/>
          </c:url>
        </c:otherwise>
      </c:choose>
      <div class="row">
        <div class="col-md-6">
          <img src="${pImgUrl}" alt="${product.name}" class="img-fluid thumb-square">
        </div>
        <div class="col-md-6">
          <h2 class="text-black">${product.name}</h2>
          <p class="text-muted mb-2">
            Danh mục: <b>${product.category.name}</b> &nbsp;|&nbsp; Còn lại: <b>${product.quantity}</b> sản phẩm
          </p>
          <p><strong class="text-primary h4"><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> đ</strong></p>
          <p style="white-space:pre-line;">
            <c:choose>
              <c:when test="${not empty product.description}">${product.description}</c:when>
              <c:otherwise>Chưa có mô tả cho sản phẩm này.</c:otherwise>
            </c:choose>
          </p>
          <p><a href="<c:url value='/product'/>" class="btn btn-sm btn-outline-primary">&larr; Quay lại danh sách sản phẩm</a></p>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
