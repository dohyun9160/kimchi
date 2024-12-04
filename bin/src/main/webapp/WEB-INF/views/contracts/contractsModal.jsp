<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<link href="<c:url value="${contextPath}/resources/css/mystyle.css"/>"
	rel='stylesheet' />
<script>
	function opencontractsModal() {
		document.getElementById("contractsModal").style.display = "flex";
	}//end
	function closecontractsModal() {
		document.getElementById("contractsModal").style.display = "none";
	}//end
	//계약 정보가져오기
	function selectContracts(cno, ino, name, schedule, quantity, price,
			deliveryDate) {
		document.getElementById("contracts_no").value = cno;
		document.getElementById("item_no").value = ino;
		document.getElementById("item_name").value = name;
		document.getElementById("bom_schedule").value = schedule;
		document.getElementById("contracts_quantity").value = quantity;
		document.getElementById("contracts_price").value = price;
		document.getElementById("contracts_deliveryDate").value = deliveryDate;
		closecontractsModal(); // 모달 닫기
	}//end
</script>
<div id="contractsModal" class="modal-long">
	<div class="modal-content">
		<div class="modal-header">
			<h3>계약 목록</h3>
		</div>
		<div class="modal-body">
			<table class="modal-table">
				<tr>
					<td>계약코드</td>
					<td>계약물품코드</td>
					<td>게약물품명</td>
					<td>게약물품 제조소요일(일)</td>
					<td>계약수량</td>
					<td>계약가격</td>
					<td>계약납기일</td>
				</tr>
				<c:forEach var="conlist" items="${conlist}">
					<c:if test="${conlist.contracts_status eq '계약승인'}">
						<c:forEach var="itemlist" items="${itemlist}">
							<c:if test="${conlist.item_no == itemlist.item_no}">
								<tr
									onclick="selectContracts('${conlist.contracts_no}','${conlist.item_no}','${itemlist.item_name}','${itemlist.bomVO.bom_schedule}', '${conlist.contracts_quantity}', '${conlist.contracts_price}', '${conlist.contracts_deliveryDate}' )">
									<td>${conlist.contracts_no}</td>
									<td>${conlist.item_no}</td>
									<td>${itemlist.item_name}</td>
									<td>${itemlist.bomVO.bom_schedule}일</td>
									<td>${conlist.contracts_quantity}</td>
									<td>${conlist.contracts_price}</td>
									<td>${conlist.contracts_deliveryDate}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</table>
			<div class="modal-footer">
				<button type="button" class="filter-button"
					onclick="closecontractsModal()">닫기</button>
			</div>
		</div>
	</div>
</div>