<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.name} - Shopping</title>
</head>
<body>
  <div class="detail-wrapper">
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
    <div class="detail-card">
      <div class="detail-img-wrap">
        <img src="${pImgUrl}" alt="${product.name}">
      </div>
      <div>
        <h1>${product.name}</h1>
        <div class="detail-price"><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> đ</div>
        <div class="detail-meta">
          Danh mục: <b>${product.category.name}</b> &nbsp;|&nbsp;
          Còn lại: <b>${product.quantity}</b> sản phẩm
        </div>
        <div class="detail-desc">
          <c:choose>
            <c:when test="${not empty product.description}">${product.description}</c:when>
            <c:otherwise>Chưa có mô tả cho sản phẩm này.</c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
    <p class="back-link"><a href="<c:url value='/product'/>">&larr; Quay lại danh sách sản phẩm</a></p>
  </div>
</body>
</html>
