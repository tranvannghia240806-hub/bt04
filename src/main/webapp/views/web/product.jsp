<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
=======
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
<html>
<head>
<meta charset="UTF-8">
<title>${not empty category ? category.name : 'Tất cả sản phẩm'} - Shopping</title>
</head>
<body>
<<<<<<< HEAD
  <div class="bg-light py-3">
    <div class="container">
      <div class="row">
        <div class="col-md-12 mb-0">
          <a href="<c:url value='/home'/>">Trang chủ</a> <span class="mx-2 mb-0">/</span>
          <strong class="text-black">${not empty category ? category.name : 'Tất cả sản phẩm'}</strong>
        </div>
      </div>
    </div>
  </div>

  <div class="site-section">
    <div class="container">
      <div class="row mb-5">
        <div class="col-md-12 mb-4">
          <div class="float-md-left mb-2">
            <h2 class="text-black h5">${not empty category ? category.name : 'Tất cả sản phẩm'}</h2>
            <p class="text-muted small mb-0">Trang ${currentPage} / ${totalPages > 0 ? totalPages : 1}</p>
          </div>
          <c:if test="${not empty category}">
            <div class="float-md-right"><a href="<c:url value='/product'/>">&larr; Xem tất cả sản phẩm</a></div>
          </c:if>
        </div>
      </div>

      <c:choose>
        <c:when test="${not empty productList}">
          <div class="row mb-5">
            <c:forEach items="${productList}" var="p">
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

          <div class="row">
            <div class="col-md-12 text-center">
              <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                  <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                    <a class="page-link" href="<c:url value='/product'><c:param name='page' value='${currentPage - 1}'/><c:if test='${not empty category}'><c:param name='cateId' value='${category.id}'/></c:if></c:url>">&laquo;</a>
                  </li>
                  <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                      <a class="page-link" href="<c:url value='/product'><c:param name='page' value='${i}'/><c:if test='${not empty category}'><c:param name='cateId' value='${category.id}'/></c:if></c:url>">${i}</a>
                    </li>
                  </c:forEach>
                  <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                    <a class="page-link" href="<c:url value='/product'><c:param name='page' value='${currentPage + 1}'/><c:if test='${not empty category}'><c:param name='cateId' value='${category.id}'/></c:if></c:url>">&raquo;</a>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
        </c:when>
        <c:otherwise>
          <div class="alert alert-secondary text-center">Chưa có sản phẩm nào trong danh mục này.</div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
=======
  <div class="shop-hero">
    <h1>${not empty category ? category.name : 'Tất cả sản phẩm'}</h1>
    <p>Trang ${currentPage} / ${totalPages > 0 ? totalPages : 1}</p>
    <c:if test="${not empty category}">
      <p><a href="<c:url value='/product'/>" style="color:#fff;text-decoration:underline;">&larr; Xem tất cả sản phẩm</a></p>
    </c:if>
  </div>

  <c:choose>
    <c:when test="${not empty productList}">
      <div class="product-grid">
        <c:forEach items="${productList}" var="p">
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

      <div class="pagination">
        <c:choose>
          <c:when test="${currentPage <= 1}">
            <span class="disabled">&laquo; Trước</span>
          </c:when>
          <c:otherwise>
            <a href="<c:url value='/product'><c:param name='page' value='${currentPage - 1}'/><c:if test='${not empty category}'><c:param name='cateId' value='${category.id}'/></c:if></c:url>">&laquo; Trước</a>
          </c:otherwise>
        </c:choose>

        <c:forEach begin="1" end="${totalPages}" var="i">
          <c:choose>
            <c:when test="${i == currentPage}">
              <span class="active">${i}</span>
            </c:when>
            <c:otherwise>
              <a href="<c:url value='/product'><c:param name='page' value='${i}'/><c:if test='${not empty category}'><c:param name='cateId' value='${category.id}'/></c:if></c:url>">${i}</a>
            </c:otherwise>
          </c:choose>
        </c:forEach>

        <c:choose>
          <c:when test="${currentPage >= totalPages}">
            <span class="disabled">Sau &raquo;</span>
          </c:when>
          <c:otherwise>
            <a href="<c:url value='/product'><c:param name='page' value='${currentPage + 1}'/><c:if test='${not empty category}'><c:param name='cateId' value='${category.id}'/></c:if></c:url>">Sau &raquo;</a>
          </c:otherwise>
        </c:choose>
      </div>
    </c:when>
    <c:otherwise>
      <div class="empty-state">Chưa có sản phẩm nào trong danh mục này.</div>
    </c:otherwise>
  </c:choose>
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
</body>
</html>
