<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<style>
/* 모달창 스타일 */
#outModal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: flex-end; /* 오른쪽 정렬 flex-end */
    align-items: center; /* 수직 중앙 정렬 */
}

.modal-content {
    background-color: white;
    padding: 5px;
    width: 80%; /* 모달 너비를 80%로 설정 */
    max-height: 90%; /* 최대 높이 조정 */
    overflow-y: auto;
    border-radius: 8px;
    text-align: right; /* 오른쪽 정렬 추가 */
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 10px;
    border: 1px solid #ccc;
    text-align: center; /* 가운데 정렬 추가 */
}

button {
    margin-top: 40px;
}
</style>

<script>
	function openoutModal() {
		document.getElementById("outModal").style.display = "flex";
	}

	function closeoutModal() {
		document.getElementById("outModal").style.display = "none";
	}

	// 계약 정보 가져오기
	function selectMaterial(maid, macategory, maname, obtainId) {
		alert("출고처리를 하시겠습니까?")
		document.getElementById("ma_id").value = maid; // 자재 ID 설정
		document.getElementById("ma_category").value = macategory; // 자재 이름 설정
		document.getElementById("ma_name").value = maname; // 조달 ID 설정 
		document.getElementById("obtain_no").value = obtainId; // 조달 ID 설정 
		closeoutModal(); // 모달 닫기
	}
</script>
<div id="outModal">
	<div class="modal-content">
		<h2><center>[  자재 조회  ]</center></h2>
		
		<div style="text-align: right;">
			가용재고: 예약 및 출고대기 제외<br>
			기본재고: 최소 유지 수량
		</div>
		
		<div style="text-align: left;">
    		자재명을 선택해주세요
		</div>
		
		<table>
			<tr>
				<th>조달코드</th>
				<th>자재코드</th>
				<th>분류</th>
				<th>자재명</th>
				<th>원산지</th>
				<th>자재단위</th>
				<th>자재무게</th>
				<th>재고수량</th>
				<th>가용재고량</th>
				<th>기본재고량</th>				
				<th>자재단가</th>
				<th>자재규격</th>
			</tr>
			<c:forEach var="obj" items="${obList}">
				<tr>
					<td>${obj.obtain_no}</td>
					<c:forEach var="ma" items="${malist}">
						<c:if test="${ma.ma_id == obj.ma_id}">
							<td>${ma.ma_id}</td>
							<td>${ma.ma_category}</td>
							<td><a href="javascript:selectMaterial('${obj.ma_id}', '${ ma.ma_category}', '${ma.ma_name}', '${obj.obtain_no}')">${ma.ma_name}</a></td>
							<td>${ma.ma_origin}</td>
							<td>${ma.ma_unit}</td>
							<td>${ma.ma_weight}</td>
							<td>${ma.ma_stockQuantity}</td>
							<td>${ma.ma_availableStock }</td>
							<td>${ma.ma_basicStock }</td>
							<td>${ma.ma_price}</td>
							<td>${ma.ma_specifications}</td>
						</c:if>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
		<button onclick="closeoutModal()">닫기</button>
	</div>
</div>
