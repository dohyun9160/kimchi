<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<link href="<c:url value="${contextPath}/resources/css/mystyle.css"/>"rel='stylesheet' />
<script>
	function openmaModal() {
		document.getElementById("maModal").style.display = "flex";
	}//end
	function closemaModal() {
		document.getElementById("maModal").style.display = "none";
	}//end
	//계약 정보가져오기
	function selectMaterial(id, category, name, origin, unit, weight, stockQuantity, price, specifications) {
		document.getElementById("ma_id").value = id;
		document.getElementById("ma_category").value = category;
		document.getElementById("ma_name").value = name;
		document.getElementById("ma_origin").value = origin;
		document.getElementById("ma_unit").value = unit;
		document.getElementById("ma_weight").value = weight;
		document.getElementById("ma_stockQuantity").value = stockQuantity;
		document.getElementById("ma_price").value = price;
		document.getElementById("ma_specifications").value = specifications;
		closemaModal(); // 모달 닫기
	}//end
	//bom_ma
	function openbom_maModal(index) {
		currentRowIndex = index; // 현재 행 인덱스를 설정
		document.getElementById("bom_maModal").style.display = "flex";
	}
	function closebom_maModal() {
		document.getElementById("bom_maModal").style.display = "none";
	}//end
	function selectBom_Ma(id, category, name, origin, unit, weight) {
		 // rowIndex가 1인 경우 중복 체크 제외
		 //모든 ma_id 입력 필드를 선택하고, 그 값들을 배열로 변환
	    if (currentRowIndex !== 1) {
	        const existingIds = Array.from(document.querySelectorAll('[id^="ma_id"]')).map(el => el.value);
	        
	        if (existingIds.includes(id)) {
	            alert("이미 선택한 자재입니다. 다른 ID를 선택해 주세요.");
	            return; // 중복된 경우 함수 종료
	        }
	    }//end
		
		// 중복이 아닐 경우 값 설정
		document.getElementById("ma_id[" + currentRowIndex + "]").value = id;
		document.getElementById("ma_category[" + currentRowIndex + "]").value = category;
		document.getElementById("ma_name[" + currentRowIndex + "]").value = name;
		document.getElementById("ma_origin[" + currentRowIndex + "]").value = origin;
		document.getElementById("ma_unit[" + currentRowIndex + "]").value = unit;
		document.getElementById("ma_weight[" + currentRowIndex + "]").value = weight;
		document.getElementById("btnAddRow_update").disabled = false; // 버튼 활성화
		document.getElementById("btnAddRow_insert").disabled = false; // 버튼 활성화
		closebom_maModal(); // 모달 닫기
	}
	
</script>
<div id="maModal" class="modal-long">
	<div class="modal-content">
		<div class="modal-header">
			<h3>자재 조회</h3>
		</div>
		<div class="modal-body">
			<table class="modal-table">
				<tr>
					<td>자재코드</td>
					<td>분류</td>
					<td>자재명</td>
					<td>원산지</td>
					<td>자재단위</td>
					<td>자재무게</td>
					<td>재고수량</td>
					<td>자재단가</td>
					<td>자재규격</td>
				</tr>
				<c:forEach var="malist" items="${malist}">
					<tr
						onclick="selectMaterial('${malist.ma_id}', '${malist.ma_category}', '${malist.ma_name}', '${malist.ma_origin}', '${malist.ma_unit }', '${malist.ma_weight }', '${malist.ma_stockQuantity}', '${malist.ma_price}', '${malist.ma_specifications}')">
						<td>${malist.ma_id}</td>
						<td>${malist.ma_category}</td>
						<td>${malist.ma_name}</td>
						<td>${malist.ma_origin}</td>
						<td>${malist.ma_unit }</td>
						<td>${malist.ma_weight }</td>
						<td>${malist.ma_stockQuantity}</td>
						<td>${malist.ma_price}</td>
						<td>${malist.ma_specifications }</td>
					</tr>
				</c:forEach>
			</table>
			<div class="modal-footer">
				<button type="button" class="filter-button" onclick="closemaModal()">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- bom 자재용 -->
<div id="bom_maModal" class="modal-long">
	<div class="modal-content">
		<div class="modal-header">
			<h3>생산자재 조회</h3>
		</div>
		<div class="modal-body">
			<table class="modal-table">
				<tr>
					<td>자재코드</td>
					<td>분류</td>
					<td>자재명</td>
					<td>원산지</td>
					<td>자재단위</td>
					<td>자재무게</td>
				</tr>
				<c:forEach var="malist" items="${malist}" varStatus="status">
					<tr
						onclick="selectBom_Ma('${malist.ma_id}', '${malist.ma_category}', '${malist.ma_name}', '${malist.ma_origin}', '${malist.ma_unit}', '${malist.ma_weight}')">
						<td>${malist.ma_id}</td>
						<td>${malist.ma_category}</td>
						<td>${malist.ma_name}</td>
						<td>${malist.ma_origin}</td>
						<td>${malist.ma_unit}</td>
						<td>${malist.ma_weight}</td>
					</tr>
				</c:forEach>
			</table>
			<div class="modal-footer">
				<button type="button" class="filter-button" onclick="closebom_maModal()">닫기</button>
			</div>
		</div>
	</div>
</div>