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
	margin: 20px 10%; /* 상하 여백 20px, 좌우 자동 여백으로 중앙 정렬 */
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
		<h3>물품상세보기</h3>
		<table class="table">
			<tr>
				<td>물품 코드</td>
				<td>${item.item_no}</td>
			</tr>
			<tr>
				<td>물룸 분류</td>
				<td>${item.item_category}</td>
			</tr>
			<tr>
				<td>물품명</td>
				<td>${item.item_name}</td>
			</tr>
			<tr>
				<td>물품 단가</td>
				<td>${item.item_price}</td>
			</tr>
			<tr>
				<td>물품 단위</td>
				<td>${item.item_unit}</td>
			</tr>
			<tr>
				<td>물품 무게</td>
				<td>${item.item_weight}</td>
			</tr>
			<tr>
				<td>물품 규격</td>
				<td>${item.item_specifications}</td>
			</tr>
			<tr>
				<td>물품 재고수량</td>
				<td>${item.item_stockquantity}</td>
			</tr>
			<tr>
				<td>물품 가용재고</td>
				<td>${item.item_availablestock}</td>
			</tr>
			<tr>
				<td>물품 기본재고</td>
				<td>${item.item_basicstock}</td>
			</tr>
			<tr>
				<td>물품 저장고</td>
				<td>${item.item_storage}</td>
			</tr>
			<tr>
				<td>물품 생산일</td>
				<td>${item.item_productionDate}</td>
			</tr>
		</table>
	</div>
	<hr>
	<c:choose>
		<c:when test="${item.item_bomRegistered == 1}">
			<div>
				<h3>bom 스케줄정보</h3>
				<table class="table">
					<tr>
						<td>제품생산 소요시간</td>
						<td>${bom.bom_schedule}일</td>
					</tr>
					<c:if test="${bom.bom_other != null}">
						<tr>
							<td colspan="2">제품생산 기타내용</td>
						</tr>
						<tr>
							<td colspan="2">${bom.bom_other}</td>
						</tr>
					</c:if>
				</table>
			</div>
			<hr>
			<div>
				<h3>bom 상세정보</h3>
				<table class="table">
					<tr>
						<td>구분</td>
						<td>자재코드</td>
						<td>분류</td>
						<td>자재명</td>
						<td>자재단위</td>
						<td>자재무게</td>
						<td>소요자재량</td>
						<td>생산과정</td>
					</tr>
					<c:set var="rowcount" value="0" />
					<c:forEach var="bom_malist" items="${bom_malist}">
						<tr>
							<td>${rowcount + 1}</td>
							<td>${bom_malist.ma_id}</td>
							<c:forEach var="malist" items="${malist}">
								<c:if test="${malist.ma_id == bom_malist.ma_id}">
									<td>${malist.ma_category}</td>
									<td>${malist.ma_name}</td>
									<td>${malist.ma_unit}</td>
									<td>${malist.ma_weight}</td>
									<c:set var="rowcount" value="${rowcount + 1}" />
								</c:if>
							</c:forEach>
							<td>${bom_malist.bom_ma_amount}</td>
							<td>${bom_malist.bom_ma_process}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="button-container">
				<button class="addbutton" onclick="openbomUpdateModal(${rowcount})">bom수정</button>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<label style="font-size: 24px; text-align: center; display: block;">BOM정보가 존재하지 않습니다.</label>
			</div>
			<hr>
			<div class="button-container">
				<button class="addbutton" onclick="openbomInsertModal()">bom추가</button>
			</div>
		</c:otherwise>
	</c:choose>
	<div class="button-container">
		<a class="addbutton" href="${contextPath}/item/itemUpdateForm?item_no=${item.item_no}">자재정보 수정</a>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
<!-- bom모달창 -->
<jsp:include page="../bom/bomModal.jsp" />
<!-- 자재모달창 -->
<jsp:include page="../material/maModal.jsp" />