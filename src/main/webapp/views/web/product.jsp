<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${not empty category ? category.name : 'Tất cả sản phẩm'} - Shopping</title>
</head>
<body>
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
</body>
</html>
