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
		<h3>사용자 상세정보</h3>
		<table class="table">
			<tr>
				<td>사용자 email</td>
				<td>${user.user_email }</td>
			</tr>
			<tr>
				<td>사용자명</td>
				<td>${user.user_name }</td>
			</tr>
			<tr>
				<td>사용자 전화번호</td>
				<td>${user.user_number }</td>
			</tr>
			<tr>
				<td>사용자 부서</td>
				<td>${user.user_department }</td>
			</tr>
			<tr>
				<td>사용자 승인여부</td>
				<td><c:if test="${user.user_approval eq 0 }">
							승인필요
						</c:if>
						<c:if test="${user.user_approval eq 1 }">
							승인됨
					</c:if></td>
			</tr>
		</table>
		<div class="button-container">
			<a class="addbutton" href="${contextPath}/user/userUpdateForm?user_id=${user.user_id}">사원수정</a>
			<a  class="addbutton" href="${contextPath}/user/userAll">목록</a>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
<!-- Required vendors -->
<script src="${contextPath}/resources/vendor/global/global.min.js"></script>
<script src="${contextPath}/resources/js/quixnav-init.js"></script>
<script src="${contextPath}/resources/js/custom.min.js"></script>
<script
	src="${contextPath}/resources/vendor/highlightjs/highlight.pack.min.js"></script>
