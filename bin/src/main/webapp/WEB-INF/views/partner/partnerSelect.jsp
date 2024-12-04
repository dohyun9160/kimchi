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
		<h3>협력회사 상세보기</h3>
		<table class="table">
			<tr>
				<td>협력회사 사업자번호</td>
				<td>${part.partner_taxid }</td>
			</tr>
			<tr>
				<td>협력회사명</td>
				<td>${part.partner_companyname }</td>
			</tr>
			<tr>
				<td>협력회사 전화번호</td>
				<td>${part.partner_number }</td>
			</tr>
			<tr>
				<td>협력회사 대표자명</td>
				<td>${part.partner_ownername }</td>
			</tr>
			<tr>
				<td>협력회사 fax</td>
				<td>${part.partner_fax }</td>
			</tr>
			<tr>
				<td>협력회사 email</td>
				<td>${part.partner_email }</td>
			</tr>
			<tr>
				<td>협력회사 사업장주소</td>
				<td>${part.partner_add }</td>
			</tr>
			<tr>
				<td>협력회사 승인여부</td>
				<td><c:if test="${part.partner_approval eq 0 }">
							승인필요
						</c:if>
						<c:if test="${part.partner_approval eq 1 }">
							승인됨
					</c:if></td>
			</tr>
		</table>
		<div class="button-container">
			<a class="addbutton" href="${contextPath}/partner/partnerUpdateForm?partner_taxid=${part.partner_taxid }">협력회사수정</a>
			<a  class="addbutton" href="${contextPath}/partner/partnerAll">목록</a>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
<!-- Required vendors -->
<script>
	function checkApproval(partner_approval) {
		document.getElementById("partner_approval").value = partner_approval;
		document.getElementById("partnerApprovalForm").submit();
	}//end
</script>