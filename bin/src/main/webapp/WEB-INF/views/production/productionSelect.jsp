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
		<h3>계약정보 상세보기</h3>
		<table class="table">
			<tr>
				<td>계약코드</td>
				<td>${con.contracts_no }</td>
			</tr>
			<tr><td colspan="2"></td></tr>
			<tr>
				<td>계약물품코드</td>
				<td>계약물품명</td>
			</tr>
			<tr>
				<td>${con.item_no}</td>
				<td>${item.item_name}</td>
			</tr>
			<tr><td colspan="2"></td></tr>
			<tr>
				<td>계약수량</td>
				<td>${con.contracts_quantity }</td>
			</tr>
			<tr>
				<td>계약가격</td>
				<td>${con.contracts_price }</td>
			</tr>
			<tr>
				<td>계약납기일</td>
				<td>${con.contracts_deliveryDate }</td>
			</tr>
		</table>
		<hr>
		<h3>생산계획 상세정보</h3>
		<table class="table">
			<tr>
				<td>생산계획코드</td>
				<td>${pro.production_no}</td>
			</tr>
			<tr>
				<td>생산수량</td>
				<td>${pro.production_quantity}</td>
			</tr>
			<tr>
				<td>생산납기일</td>
				<td>${pro.production_deliveryDate}</td>
			</tr>
			<tr>
				<td>생산계획 상태</td>
				<td>${pro.production_status}</td>
			</tr>
			<tr>
				<td>생산계획 등록일</td>
				<td>${pro.production_registrationDate}</td>
			</tr>
		</table>
	</div>
	<hr>
	<div>
		<h3>담당자정보</h3>
		<table class="table">
			<tr>
				<td>담당자명</td>
				<td>담당자email</td>
				<td>담당자전화번호</td>
				<td>담당자부서</td>
			</tr>
			<tr>
				<td>${user.user_name}</td>
				<td>${user.user_email}</td>
				<td>${user.user_number}</td>
				<td>${user.user_department}</td>
			</tr>
		</table>
	</div>
	<div class="button-container">
		<a class="addbutton" href="${contextPath}/contracts/contractsSelect?contracts_no=${pro.contracts_no}">계약상세보기</a>
		<c:choose>
		    <c:when test="${pro.production_status eq '생산계획확인중'}">
		        <a class="addbutton" href="${contextPath}/production/productionUpdateForm?production_no=${pro.production_no}">생산계획 수정</a>
		        <form action="productionCheck" method="post" id="checkForm" name="checkForm">
		            <input type="hidden" name="production_no" id="production_no" value="${pro.production_no}">
		            <input type="hidden" name="production_status" id="production_status" value="">
		            <button class="addbutton" type="button" onclick="submitCheck('생산계획확인완료')">생산계획 승인</button>
		            <button class="addbutton" type="button" onclick="submitCheck('생산계획취소')">생산계획 취소</button>
		        </form>
		    </c:when>
		    <c:when test="${pro.production_status eq '생산계획확인완료'}">
		        <a class="addbutton" href="${contextPath}/obtain/obtainInsertForm?production_no=${pro.production_no}">자재조달하기</a>
			</c:when>
		</c:choose>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
<script>
	function submitCheck(production_status) {
		
		if (!confirm(production_status+'하시겠습니까?')) {
	        location.href = "${contextPath}/production/productionSelect?production_no="+${pro.production_no};
	        return;
	    }//end
		
		document.getElementById("production_status").value = production_status;
		document.getElementById("checkForm").submit();
	}//end
</script>