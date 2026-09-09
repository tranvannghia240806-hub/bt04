<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý danh mục</title>
</head>
<body>
  <c:if test="${param.error == 'upload'}">
    <div class="alert alert-danger">
      Có lỗi xảy ra khi lưu ảnh (upload ImgBB thất bại hoặc quá thời gian chờ). Vui lòng thử lại
      với ảnh nhỏ hơn, hoặc kiểm tra kết nối mạng / cấu hình IMGBB_API_KEY.
    </div>
  </c:if>

  <div class="d-flex justify-content-end mb-3">
    <a class="btn btn-primary" href="<c:url value='/admin/category/add'/>">+ Thêm danh mục mới</a>
  </div>

  <div class="card shadow-sm">
    <div class="table-responsive">
      <table class="table table-hover align-middle mb-0">
        <thead class="table-light">
          <tr>
            <th style="width:60px;">STT</th>
            <th style="width:120px;">Hình ảnh</th>
            <th>Tên danh mục</th>
            <th style="width:160px;">Hành động</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${cateList}" var="cate" varStatus="STT">
            <tr>
              <td>${STT.index + 1}</td>
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
              <td><img class="thumb-square-sm" src="${imgUrl}" alt=""></td>
              <td>${cate.name}</td>
              <td>
                <a class="btn btn-sm btn-outline-primary" href="<c:url value='/admin/category/edit'><c:param name='id' value='${cate.id}'/></c:url>">Sửa</a>
                <a class="btn btn-sm btn-outline-danger" href="<c:url value='/admin/category/delete'><c:param name='id' value='${cate.id}'/></c:url>"
                   onclick="return confirm('Bạn có chắc muốn xóa danh mục này?');">Xóa</a>
              </td>
            </tr>
          </c:forEach>
          <c:if test="${empty cateList}">
            <tr><td colspan="4" class="text-center text-muted py-4">Chưa có danh mục nào.</td></tr>
          </c:if>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
