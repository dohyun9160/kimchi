<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<style>
/* 모달창 스타일 */
#obtainModal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	justify-content: center;
	align-items: center; /* 수직 중앙 정렬 */
}

.modal-content {
	background-color: white;
	padding: 20px;
	width: 70%; /* 모달 너비를 50%로 설정 */
	max-height: 100%; /* 최대 높이 조정 */
	overflow-y: auto;
	border-radius: 8px;
	margin-left: 20%;
	margin-right: 10%; /* 오른쪽 여백 추가 */
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	border: 1px solid #ccc;
}

button {
	margin-top: 40px;
}
</style>
<script>
	function openobtainModal() {
		document.getElementById("obtainModal").style.display = "flex";
	}//end
	function closeobtainModal() {
		document.getElementById("obtainModal").style.display = "none";
	}//end
	function selectObtain(no, id, deliveryDate, status) {
		document.getElementById("obtain_no").value = no;
		document.getElementById("ma_id").value = id;
		document.getElementById("obtain_deliveryDate").value = deliveryDate;
		document.getElementById("obtain_status").value = status;
		closeobtainModal();
	}//end
</script>
<div id="obtainModal">
	<div class="modal-content">
		<h3>조달계획 목록</h3>
		<table>
			<tr>
				<td>조달계획코드</td>
				<td>조달계획물품</td>
				<td>조달계획납기일</td>
				<td>조달계획상태</td>
			</tr>
			<c:forEach var="oblist" items="${oblist}">
				<c:if test="${oblist.obtain_status eq '조달중'}">
					<tr class="selectObtain('${oblist.obtain_no}', '${oblist.ma_id}', '${oblist.obtain_deliveryDate}', '>${oblist.obtain_status}')">
						<td>${oblist.obtain_no}</td>
						<td>${oblist.ma_id}</td>
						<td>${oblist.obtain_deliveryDate}</td>
						<td>${oblist.obtain_status}</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
</div>
