<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<style>
.content-body h3 {
	margin-left: 10%; /* 원하는 만큼 왼쪽으로 이동 */
}

.content-body .table {
	width: 80%; /* 테이블 너비 설정 */
	margin: 20px auto; /* 상하 여백 20px, 좌우 자동 여백으로 중앙 정렬 */
	border-collapse: collapse; /* 테두리 겹침 방지 */
}

.content-body .table th, .content-body .table td {
	border: 1px solid #cbc6c6; /* 진한 회색 테두리 */
	padding: 8px; /* 셀 안쪽 여백 */
	text-align: center; /* 텍스트 가운데 정렬 */
}

.content-body .button-container {
	display: flex; /* Flexbox 사용 */
	justify-content: flex-end; /* 오른쪽 정렬 */
	margin: 2% 10%; /* 상하 여백 20px, 좌우 자동 여백으로 중앙 정렬 */
}

.button-container {
	display: flex;
	flex-direction: column; /* 수직 정렬을 위해 방향을 세로로 설정 */
	align-items: flex-end; /* 왼쪽 정렬 */
	text-align: left; /* 텍스트 왼쪽 정렬 */
	margin-right: 20px; /* 오른쪽 간격 추가 */
}

.addbutton {
	margin-bottom: 10px; /* 버튼 간의 간격 추가 */
}
</style>
<%@include file="../include/header.jsp"%>
<div class="content-body">
	<div style="margin-left: 20px;">
		<h3>계약 상세정보</h3>
		<table class="table">
			<tr>
				<td>계약코드</td>
				<td colspan="3">${con.contracts_no}</td>
			</tr>
			<tr><td colspan="4"></td></tr>
			<tr>
				<td>계약물품코드</td>
				<td>게약물품분류</td>
				<td>게약물품명</td>
				<td>게약물품단가</td>
			</tr>
			<tr>
				<td>${con.item_no}</td>
				<td>${item.item_category}</td>
				<td>${item.item_name}</td>
				<td>${item.item_price}</td>
			</tr>
			<tr><td colspan="4"></td></tr>
			<tr>
				<td>계약수량</td>
				<td colspan="3">${con.contracts_quantity}</td>
			</tr>
			<tr>
				<td>계약가격</td>
				<td colspan="3">${con.contracts_price}</td>
			</tr>
			<tr>
				<td>계약납기일</td>
				<td colspan="3">${con.contracts_deliveryDate}</td>
			</tr>
			<tr>
				<td>계약상태</td>
				<td colspan="3">${con.contracts_status}</td>
			</tr>
			<tr>
				<td>계약상세</td>
				<td colspan="3">${con.contracts_details}</td>
			</tr>
			<tr>
				<td>계약등록일</td>
				<td colspan="3">${con.contracts_registrationDate}</td>
			</tr>
		</table>
	</div>
	<hr>
	<div>
		<h3>계약협력회사 상세정보</h3>
		<table class="table">
			<tr>
				<td>혁력회사 사업자번호</td>
				<td>${con.partner_taxid}</td>
			</tr>
			<tr>
				<td>혁력회사 명</td>
				<td>${partner.partner_companyname }</td>
			</tr>
			<tr>
				<td>협력회사 대표자명</td>
				<td>${partner.partner_ownername }</td>
			</tr>
			<tr>
				<td>협력회사 전화번호</td>
				<td>${partner.partner_number }</td>
			</tr>
			<tr>
				<td>협력회사 이메일</td>
				<td>${partner.partner_email }</td>
			</tr>
		</table>
	</div>
	<hr>
	<div>
		<h3>계약담당 상세정보</h3>
		<table class="table">
			<tr>
				<td>계약담당자 명</td>
				<td>${user.user_name}</td>
			</tr>
			<tr>
				<td>계약담당자 이메일</td>
				<td>${user.user_email}</td>
			</tr>
			<tr>
				<td>계약담당자 전화번호</td>
				<td>${user.user_number}</td>
			</tr>
		</table>
	</div>
	<div class="button-container">
		<!-- contracts_status : 계약확인중, 계약승인, 계약취소 -->
		<c:choose>
			<c:when test="${con.contracts_status eq '계약확인중'}">
				<a class="addbutton" href="${contextPath}/contracts/contractsUpdateForm?contracts_no=${con.contracts_no}">계약수정</a>
				<form action="contractsCheck" method="post" id="checkForm" name="checkForm">
					<input type="hidden" name="contracts_no" id="contracts_no" value="${con.contracts_no}"> 
					<input type="hidden" name="contracts_status" id="contracts_status" value="">
					<button class="addbutton" type="button" onclick="submitCheck('계약승인')">계약승인</button>
					<button class="addbutton" type="button" onclick="submitCheck('계약취소')">계약취소</button>
				</form>
			</c:when>
			<c:when test="${con.contracts_status ne'계약취소'}">
				<form id="documentForm" action="${contextPath}/contracts/documentView" method="get">
					<input name="ca_id" id="ca_id" type="hidden" value="1"> 
					<input name="pa_referenceNo" id="pa_referenceNo" type="hidden" value="${con.contracts_no}">
					<button type="submit" class="addbutton">계약서확인</button>
				</form>
			</c:when>
		</c:choose>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
<script>
	//계약승인 & 취소
	function submitCheck(contracts_status) {

		if (!confirm(contracts_status + ' 하시겠습니까?')) {
			location.href = "/contracts/contractsSelect?contracts_no=" + ${con.contracts_no};
			return;
		}//end

		document.getElementById("contracts_status").value = contracts_status;
		document.getElementById("checkForm").submit();
	}//end
</script>