<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ - Shopping</title>
</head>
<body>
  <div class="shop-hero">
    <h1>Khám phá danh mục sản phẩm</h1>
    <p>Chọn một danh mục bên dưới để bắt đầu mua sắm</p>
  </div>

  <c:choose>
    <c:when test="${not empty cateList}">
      <div class="cate-grid">
        <c:forEach items="${cateList}" var="cate">
          <c:choose>
            <c:when test="${fn:startsWith(cate.icon, 'http')}">
              <c:set var="imgUrl" value="${cate.icon}"/>
            </c:when>
            <c:otherwise>
              <c:url value="/image" var="imgUrl">
                <c:param name="fname" value="${cate.icon}"/>
              </c:url>
            </c:otherwise>
          </c:choose>
          <a class="cate-card" href="<c:url value='/product'><c:param name='cateId' value='${cate.id}'/></c:url>">
            <div class="cate-thumb-wrap">
              <img src="${imgUrl}" alt="${cate.name}">
            </div>
            <div class="cate-name">${cate.name}</div>
          </a>
        </c:forEach>
      </div>
    </c:when>
    <c:otherwise>
      <div class="empty-state">Chưa có danh mục sản phẩm nào. Vui lòng quay lại sau.</div>
    </c:otherwise>
  </c:choose>

  <div class="section-title">
    <h2>Sản phẩm mới nhất</h2>
    <a href="<c:url value='/product'/>">Xem tất cả &rarr;</a>
  </div>
  <c:choose>
    <c:when test="${not empty latestProducts}">
      <div class="product-grid">
        <c:forEach items="${latestProducts}" var="p">
          <c:choose>
            <c:when test="${fn:startsWith(p.image, 'http')}">
              <c:set var="pImgUrl" value="${p.image}"/>
            </c:when>
            <c:otherwise>
              <c:url value="/image" var="pImgUrl">
                <c:param name="fname" value="${p.image}"/>
              </c:url>
            </c:otherwise>
          </c:choose>
          <a class="product-card" href="<c:url value='/product/detail'><c:param name='id' value='${p.id}'/></c:url>">
            <div class="product-thumb-wrap">
              <img src="${pImgUrl}" alt="${p.name}">
            </div>
            <div class="product-info">
              <p class="product-name">${p.name}</p>
              <div class="product-price"><fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/> đ</div>
              <div class="product-cate">${p.category.name}</div>
            </div>
          </a>
        </c:forEach>
      </div>
    </c:when>
    <c:otherwise>
      <div class="empty-state">Chưa có sản phẩm nào. Vui lòng quay lại sau.</div>
    </c:otherwise>
  </c:choose>
</body>
</html>
