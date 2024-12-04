<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<div class="pagination">
		<c:if test="${currentPage > 1}">
			<a href="?pageNum=${currentPage - 1}">이전</a>
		</c:if>

		<c:forEach var="page" begin="1" end="${totalPages}">
			<c:choose>
				<c:when test="${page == currentPage}">
					<strong>${page}</strong>
				</c:when>
				<c:otherwise>
					<a href="?pageNum=${page}">${page}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${currentPage < totalPages}">
			<a href="?pageNum=${currentPage + 1}">다음</a>
		</c:if>
	</div>