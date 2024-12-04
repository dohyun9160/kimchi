<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<script>
	function openproductionModal() {
		document.getElementById("productionModal").style.display = "flex";
	}//end
	function closeproductionModal() {
		document.getElementById("productionModal").style.display = "none";
	}//end
	//계약 정보가져오기
	function selectProduction(no, quantity, deliveryDate, contracts_no) {
		document.getElementById("production_no").value = no;
		document.getElementById("production_quantity").value = quantity;
		document.getElementById("production_deliveryDate").value = deliveryDate;
		document.getElementById("contracts_no").value = contracts_no;
		closeproductionModal(); // 모달 닫기
	}//end
</script>
<div id="productionModal" class="modal-long">
	<div class="modal-content">
		<div class="modal-header">
			<h3>생산계획 상세정보</h3>
		</div>
		<div class="modal-body">
			<table class="modal-table">
				<tr>
					<td>생산계획코드</td>
					<td>생산수량</td>
					<td>생산납기일</td>
				</tr>
				<c:forEach var="prolist" items="${prolist}">
					<c:if test="${prolist.production_status eq '생산계획확인완료'}">
						<tr
							onclick="selectProduction('${prolist.production_no}', '${prolist.production_quantity}', '${prolist.production_deliveryDate}', '${prolist.contracts_no}')">
							<td>${prolist.production_no}</td>
							<td>${prolist.production_quantity}</td>
							<td>${prolist.production_deliveryDate}</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<div class="modal-footer">
				<button type="button" class="filter-button" onclick="closeproductionModal()">닫기</button>
			</div>
		</div>
	</div>
</div>
