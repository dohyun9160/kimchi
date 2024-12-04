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
	margin-top: 10%; /* 원하는 간격으로 조정 */
}
</style>
<%@include file="../include/header.jsp"%>
<div class="content-body">
	<div style="margin-left: 20px;">
		<h3>조달계획 상세보기</h3>
		<table class="table">
			<tr>
				<td>조달계획코드</td>
				<td colspan="2">${obtain.obtain_no}</td>
			</tr>
			<tr><td colspan="3"></td></tr>
			<tr>
				<td>조달계획 자재코드</td>
				<td>조달계획 자재명</td>
				<td>조달계획 자재단가</td>
			</tr>
			<tr>
				<td>${obtain.ma_id}</td>
				<td>${ma.ma_name}</td>
				<td>${ma.ma_price}</td>
			</tr>
			<tr><td colspan="3"></td></tr>
			<tr>
				<td>조달계획 자재조달량</td>
				<td colspan="2">${obtain.obtain_quantity}</td>
			</tr>
			<tr>
				<td>조달계획가격</td>
				<td colspan="2">${obtain.obtain_price}</td>
			</tr>
			<tr>
				<td>조달계획납기일</td>
				<td colspan="2">${obtain.obtain_deliveryDate}</td>
			</tr>
			<tr>
				<td>조달계획상태</td>
				<td colspan="2">${obtain.obtain_status}</td>
			</tr>
			<tr><td colspan="3"></td></tr>
			<tr>
				<td>생산계획코드</td>
				<td>생산량</td>
				<td>생산납기일</td>
			</tr>
			<tr>
				<td>${obtain.production_no}</td>
				<td>${pro.production_quantity}</td>
				<td>${pro.production_deliveryDate}</td>
			</tr>
		</table>
	</div>
	<hr>
	<div>
		<h3>조달계획 협력회사 상세정보</h3>
		<table class="table">
			<tr>
				<td>혁력회사 사업자번호</td>
				<td>${obtain.partner_taxid}</td>
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
			<c:if test="${obtain.obtain_status eq '조달계획확인중'}">
					<a style="padding: 7px 10px; margin-top: 0px;" class="addbutton" href="${contextPath}/obtain/obtainUpdateForm?obtain_no=${obtain.obtain_no}">조달계획수정</a>
					<a style="padding: 7px 10px; margin-top: 0px;" class="addbutton" href="${contextPath}/production/productionSelect?production_no=${obtain.production_no}">생산계획보기</a>
					<form action="obtainCheck" method="post" id="checkForm" name="checkForm">
						<input type="hidden" name="obtain_no" id="obtain_no" value="${obtain.obtain_no}">
						 <input type="hidden" name="obtain_status" id="obtain_status" value="">
						<button class="addbutton" type="button" onclick="submitCheck('조달계획확인완료')">조달계획승인</button>
						<button class="addbutton" type="button" onclick="submitCheck('조달계획취소')">조달계획취소</button>
					</form>
			</c:if>
			<c:if test="${obtain.obtain_document eq 1}">
				<a style="padding: 7px 10px; margin-top:0px;" class="addbutton" href="${contextPath}/production/productionSelect?production_no=${obtain.production_no}">생산계획보기</a>
				<form id="documentForm" action="${contextPath}/obtain/documentView" method="get">
					<input name="ca_id" id="ca_id" type="hidden" value="2"> 
					<input name="pa_referenceNo" id="pa_referenceNo" type="hidden" value="${obtain.obtain_no}">
					<button type="submit" class="addbutton">거래명세서확인</button>
				</form>
			</c:if>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
<script>
	//조달계획확인 & 취소
	function submitCheck(obtain_status) {
		
		if (!confirm(obtain_status+'하시겠습니까?')) {
	        location.href = "/obtain/obtainSelect?obtain_no="+${obtain.obtain_no};
	        return;
	    }//end
		
		document.getElementById("obtain_status").value = obtain_status;
		document.getElementById("checkForm").submit();
	}//end
</script>