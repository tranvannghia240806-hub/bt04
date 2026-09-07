<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý danh mục</title>
</head>
<body>
    <div class="container">
    <c:if test="${param.error == 'upload'}">
      <div class="alert alert-danger" style="margin-bottom:16px;">
        Có lỗi xảy ra khi lưu ảnh (upload ImgBB thất bại hoặc quá thời gian chờ). Vui lòng thử lại
        với ảnh nhỏ hơn, hoặc kiểm tra kết nối mạng / cấu hình IMGBB_API_KEY.
      </div>
    </c:if>
    <a class="btn-add" href="<c:url value='/admin/category/add'/>">+ Thêm danh mục mới</a>
    <table>
      <thead>
        <tr>
          <th style="width:60px;">STT</th>
          <th style="width:140px;">Hình ảnh</th>
          <th>Tên danh mục</th>
          <th style="width:140px;">Hành động</th>
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
            <td><img class="thumb" height="70" width="90" src="${imgUrl}" /></td>
            <td>${cate.name}</td>
            <td>
              <a class="action-link" href="<c:url value='/admin/category/edit'><c:param name='id' value='${cate.id}'/></c:url>">Sửa</a>
              <a class="action-link danger" href="<c:url value='/admin/category/delete'><c:param name='id' value='${cate.id}'/></c:url>"
                 onclick="return confirm('Bạn có chắc muốn xóa danh mục này?');">Xóa</a>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty cateList}">
          <tr><td colspan="4" style="text-align:center;color:var(--muted);">Chưa có danh mục nào.</td></tr>
        </c:if>
      </tbody>
    </table>
  </div>
</body>
</html>
