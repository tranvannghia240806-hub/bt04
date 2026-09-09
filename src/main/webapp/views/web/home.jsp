<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ - Shopping</title>
</head>
<body>
  <div class="hero-banner">
    <div class="container">
      <h1 class="mb-2">Khám phá danh mục sản phẩm</h1>
      <p class="mb-0">Chọn một danh mục bên dưới để bắt đầu mua sắm</p>
    </div>
  </div>

  <div class="site-section site-blocks-2">
    <div class="container">
      <c:choose>
        <c:when test="${not empty cateList}">
          <div class="row">
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
              <div class="col-sm-6 col-md-4 mb-4">
                <a class="block-2-item" href="<c:url value='/product'><c:param name='cateId' value='${cate.id}'/></c:url>">
                  <figure class="image">
                    <img src="${imgUrl}" alt="${cate.name}" class="img-fluid thumb-square">
                  </figure>
                  <div class="text">
                    <span class="text-uppercase">Danh mục</span>
                    <h3>${cate.name}</h3>
                  </div>
                </a>
              </div>
            </c:forEach>
          </div>
        </c:when>
        <c:otherwise>
          <div class="alert alert-secondary text-center">Chưa có danh mục sản phẩm nào. Vui lòng quay lại sau.</div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>

  <div class="site-section">
    <div class="container">
      <div class="row justify-content-between align-items-center mb-4">
        <div class="col-auto"><h2 class="text-black h5 mb-0">Sản phẩm mới nhất</h2></div>
        <div class="col-auto"><a href="<c:url value='/product'/>">Xem tất cả &rarr;</a></div>
      </div>
      <c:choose>
        <c:when test="${not empty latestProducts}">
          <div class="row mb-5">
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
              <div class="col-sm-6 col-lg-4 mb-4">
                <div class="block-4 text-center border">
                  <figure class="block-4-image">
                    <a href="<c:url value='/product/detail'><c:param name='id' value='${p.id}'/></c:url>">
                      <img src="${pImgUrl}" alt="${p.name}" class="img-fluid thumb-square">
                    </a>
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="<c:url value='/product/detail'><c:param name='id' value='${p.id}'/></c:url>">${p.name}</a></h3>
                    <p class="mb-0 text-muted small">${p.category.name}</p>
                    <p class="text-primary font-weight-bold"><fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/> đ</p>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </c:when>
        <c:otherwise>
          <div class="alert alert-secondary text-center">Chưa có sản phẩm nào. Vui lòng quay lại sau.</div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</body>
</html>
