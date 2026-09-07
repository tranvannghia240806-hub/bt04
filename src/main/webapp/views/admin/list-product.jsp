<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý sản phẩm</title>
</head>
<body>
    <div class="container">
    <c:if test="${param.error == 'upload'}">
      <div class="alert alert-danger" style="margin-bottom:16px;">
        Có lỗi xảy ra khi lưu ảnh (upload ImgBB thất bại hoặc quá thời gian chờ). Vui lòng thử lại
        với ảnh nhỏ hơn, hoặc kiểm tra kết nối mạng / cấu hình IMGBB_API_KEY.
      </div>
    </c:if>
    <a class="btn-add" href="<c:url value='/admin/product/add'/>">+ Thêm sản phẩm mới</a>
    <table>
      <thead>
        <tr>
          <th style="width:50px;">STT</th>
          <th style="width:110px;">Hình ảnh</th>
          <th>Tên sản phẩm</th>
          <th style="width:120px;">Giá</th>
          <th style="width:90px;">Tồn kho</th>
          <th style="width:140px;">Danh mục</th>
          <th style="width:140px;">Hành động</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${productList}" var="p" varStatus="STT">
          <tr>
            <td>${STT.index + 1}</td>
            <c:choose>
              <c:when test="${fn:startsWith(p.image, 'http')}">
                <c:set var="imgUrl" value="${p.image}"/>
              </c:when>
              <c:otherwise>
                <c:url value="/image" var="imgUrl">
                  <c:param name="fname" value="${p.image}"/>
                </c:url>
              </c:otherwise>
            </c:choose>
            <td><img class="thumb" height="60" width="60" src="${imgUrl}" /></td>
            <td>${p.name}</td>
            <td><span class="price"><fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/> đ</span></td>
            <td>${p.quantity}</td>
            <td>${p.category.name}</td>
            <td>
              <a class="action-link" href="<c:url value='/admin/product/edit'><c:param name='id' value='${p.id}'/></c:url>">Sửa</a>
              <a class="action-link danger" href="<c:url value='/admin/product/delete'><c:param name='id' value='${p.id}'/></c:url>"
                 onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">Xóa</a>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty productList}">
          <tr><td colspan="7" style="text-align:center;color:var(--muted);">Chưa có sản phẩm nào.</td></tr>
        </c:if>
      </tbody>
    </table>
  </div>
</body>
</html>
