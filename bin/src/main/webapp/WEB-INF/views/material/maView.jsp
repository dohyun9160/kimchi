<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>

<%@include file="../include/header.jsp"%>

<style>

.list-button {
	display: inline-block;
	padding: 10px 10px;
	margin-top: 10px;
	margin-left: 10px; /* 좌측 */
	margin-right: 10px; /* 우측  */
	border: none;
	border-radius: 5px;
	background-color: #5892d1; /* 버튼 배경색 */
	color: white; /* 글자색 */
	cursor: pointer;
	transition: background-color 0.3s; /* 배경색 전환 효과 */
}
</style>

<div class="content-body">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="link-container">
						<a href="${contextPath}maList" class="list-button">목록</a>
					</div>
					<div class="card-header">
						<div class="col-12">
							<table class="table">
								<tr>
									<th>분류명</th>
									<th>재료명</th>
									<th>이미지</th>
									<th>원산지</th>
									<th>유통기한</th>
									<th>무게</th>
									<th>단위</th>
									<th>포장규격</th>
									<th>재고수량</th>
									<th>가용재고량</th>
									<th>기본재고량</th>
									<th>단가액</th>
									<th>총금액</th>
									<th>보관위치</th>
									<th>등록일자</th>
								</tr>
								<tr>
									<td>${ma.ma_category}</td>
									<td>${ma.ma_name}</td>
									<td><img src="${ma.attachmentLocation}" 
										 style="width: 100px; height: 100px;" /></td>
									<td>${ma.ma_origin}</td>
									<td>${ma.ma_expiryDate}</td>
									<td class="ma_weight">${ma.ma_weight}</td>
									<td>${ma.ma_unit}</td>
									<td>${ma.ma_specifications}</td>
									<td class="stockQuantity">${ma.ma_stockQuantity}</td>
									<td class="availableStock">${ma.ma_availableStock}</td>
									<td class="basicStock">${ma.ma_basicStock}</td>
									<td class="price">${ma.ma_price}</td>
									<td class="stockValue">${ma.ma_stockValue}</td>
									<td>${ma.ma_storage}</td>
									<td>${ma.ma_date}</td>
								</tr>
							</table>

							<div class="link-container" style="justify-content: flex-start; margin-top: 5px;">
								<a href="${contextPath}maUpdate?ma_id=${ma.ma_id}" class="link-button">수정</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%@include file="../include/footer.jsp"%>

<script>
	$(document).ready(function() {
		function formatCurrency(value) {
			if ($.isNumeric(value)) {return '₩ '+ Number(value).toLocaleString();}
			return value;
		}

		$('.price, .stockValue').each(function() { 
			let text = $(this).text();
			$(this).text(formatCurrency(text));
		});

		$('.stockQuantity, .availableStock, .basicStock, .ma_weight')
			.each(function() { 
				let text = $(this).text();
				if ($.isNumeric(text)) {$(this).text(Number(text).toLocaleString());}
			});
	});
</script>
</div>
</div>
</div>
</body>
</html>
