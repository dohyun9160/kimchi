<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@include file="../include/header.jsp"%>

<div class="content-body">

	<div style="margin-left: 20px;">
		<h2>출고 품목 조회</h2>

		<form action="${contextPath}/out/outList" method="get" class="search-form">
			<input type="text" name="io_id" placeholder="조회하실 출고코드를 입력하시오" value="${param.io_id}" class="search-input" />
			<button type="submit" class="search-button">검색</button>
		</form>
		
	</div>

	<c:if test="${empty list}">
		<p>출고된 자재가 없습니다.</p>
		<table>
			<tr>
				<td colspan="5" style="text-align: left; padding-left: 20px;">
					<a href="${contextPath}/out/outAdd" class="link-button">출고등록</a>
				</td>
			</tr>
		</table>
	</c:if>

	<c:if test="${not empty list}">
		<table class="table">
			<tr>
				<th>출고 코드</th>
				<th>자재명</th>
				<th>출고 수량</th>
				<th>출고일</th>
				<th>거래명세서 발행여부</th>
			</tr>

			<c:forEach var="out" items="${list}">
				<tr>
					<td>${out.io_id}</td>
					<td><a href="outView?io_id=${out.io_id}">${out.ma_name}</a></td>
					<td class="ma_stockQuantity">${out.io_quantity}</td>
					<td>${out.io_date}</td>
					<td>${out.invoice_issuance_status}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" style="text-align: left; padding-left: 20px;">
					<a href="${contextPath}/out/outAdd" class="link-button">출고등록</a>
				</td>
			</tr>
		</table>
	</c:if>

	<!-- Pagination -->
	<div class="pagination">
		<c:if test="${currentPage > 1}">
			<a href="?pageNum=${currentPage - 1}&ma_name=${param.ma_name}">이전</a>
		</c:if>

		<c:forEach var="page" begin="1" end="${totalPages}">
			<c:choose>
				<c:when test="${page == currentPage}">
					<strong>${page}</strong>
				</c:when>
				<c:otherwise>
					<a href="?pageNum=${page}&ma_name=${param.ma_name}">${page}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${currentPage < totalPages}">
			<a href="?pageNum=${currentPage + 1}&ma_name=${param.ma_name}">다음</a>
		</c:if>
	</div>
</div>

<script>
    $(document).ready(function() {
        // 천 단위 구분 적용
        $('.ma_stockQuantity').each(function() {
            let text = $(this).text();
            if ($.isNumeric(text)) {
                $(this).text(Number(text).toLocaleString()); 
            }
        });
    });
</script>

<%@include file="../include/footer.jsp"%>
