<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<link href="<c:url value="${contextPath}/resources/css/mystyle.css"/>" rel='stylesheet' />
<script>
	function openobtain_maModal() {
		document.getElementById("obtain_maModal").style.display = "flex";
	}//end
	function closeobtain_maModal() {
		document.getElementById("obtain_maModal").style.display = "none";
	}//end
	//계약 정보가져오기
	function selectMaterial(id, category, name, origin, price, amount) {
		document.getElementById("ma_id").value = id;
		document.getElementById("ma_category").value = category;
		document.getElementById("ma_name").value = name;
		document.getElementById("ma_origin").value = origin;
		document.getElementById("ma_price").value = price;
		document.getElementById("bom_ma_amount").value = amount;
		calnum();
		closeobtain_maModal(); // 모달 닫기
	}//end
</script>
<div id="obtain_maModal" class="modal-long">
	<div class="modal-content">
		<div class="modal-header">
			<h3>자재 조회</h3>
		</div>
		<div class="modal-body">
			<table class="modal-table">
				<tr>
					<td>자재코드</td>
					<td>분류</td>
					<td>자재명</td>
					<td>원산지</td>
					<td>단가</td>
				</tr>
				<c:forEach var="malist" items="${malist}">
					<c:forEach var="bom_malist" items="${bom_malist}">
						<c:if test="${bom_malist.ma_id == malist.ma_id}">
							<tr
								onclick="selectMaterial('${malist.ma_id}', '${malist.ma_category}', '${malist.ma_name}', '${malist.ma_origin}','${malist.ma_price}','${bom_malist.bom_ma_amount}')">
								<td>${malist.ma_id}</td>
								<td>${malist.ma_category}</td>
								<td>${malist.ma_name}</td>
								<td>${malist.ma_origin}</td>
								<td>${malist.ma_price}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</table>
			<div class="modal-footer">
				<button type="button" class="filter-button"
					onclick="closeobtain_maModal()">닫기</button>
			</div>
		</div>
	</div>
</div>