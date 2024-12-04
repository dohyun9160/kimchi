<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<link href="<c:url value="${contextPath}/resources/css/mystyle.css"/>" rel='stylesheet' />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<style>
.content-body {
	border-radius: 8px;
	padding: 20px;
	margin: auto;
}

.content-body h2 {
	margin: 0 15%;
}
</style>
<%@include file="../include/header.jsp"%>
<div class="contracts">
<div class="content-body">
	<h2>계약 수정화면</h2>
	<hr>
	<div class="input-container">
		<form action="contractsUpdate" method="post" name="contractsUpdateForm" id="contractsUpdateForm">
			<div>
				<h3>물품 상세</h3>
			</div>
			<div class="input-group">
				<label>계약코드</label><input name="contracts_no" id="contracts_no" type="number" value="${con.contracts_no}" readonly>
				<label>계약물품코드</label><input name="item_no" id="item_no" type="number" value="${con.item_no}" readonly><br>
			</div>
			<div class="input-group">
				<label>계약물품분류</label><input name="item_category" id="item_category" type="text" value="${item.item_category}" readonly><br>
				<label>계약물품명</label><input name="item_name" id="item_name" type="text" value="${item.item_name}" readonly><br>
			</div>
			<div class="input-group">	
				<label>계약물품단가</label><input name="item_price" id="item_price" type="number" value="${item.item_price}" readonly><br>
				<label>물품제조소요일(일)</label><input name="bom_schedule" id="bom_schedule" type="number" value="${item.bomVO.bom_schedule}" readonly>
			</div>
			<hr>
			<div>
				<h3>계약정보</h3>
			</div>
			<div class="input-group">
				<label>계약수량</label>
				<input name="contracts_quantity" id="contracts_quantity" type="number" value="${con.contracts_quantity}" oninput="calculate()">
				<label>계약가격</label> 
				<input name="contracts_price" id="contracts_price" type="number" value="${con.contracts_price}" onkeyup="calculate()" readonly>
			</div>
			<div class="input-group">
				<label>계약납기일</label>
				<input name="contracts_deliveryDate" id="contracts_deliveryDate" type="date" value="${con.contracts_deliveryDate}" onchange="checkdate()">
				<label>계약상세</label>
				<textarea id="contracts_details" name="contracts_details">${con.contracts_details}</textarea>
			</div>
			<hr>
			<div>
				<h3>계약협력회사 상세정보</h3>
			</div>
			<div class="input-group">
				<label>협력회사 사업자번호</label> <input name="partner_taxid" id="partner_taxid" type="text" value="${con.partner_taxid}" readonly><br>
				<label>협력회사 회사명</label> <input name="partner_companyname" id="partner_companyname" type="text" value="${partner.partner_companyname }" readonly><br>
			</div>
			<div class="input-group">
				<label>협력회사 대표자명</label> <input name="partner_ownername" id="partner_ownername" type="text" value="${partner.partner_ownername }" readonly><br>
				<label>협력회사 전화번호</label> <input name="partner_number" id="partner_number" type="text" value="${partner.partner_number }" readonly><br> 
			</div>
			<div class="input-group">
				<label>협력회사 이메일</label><input name="partner_email" id="partner_email" type="text" value="${partner.partner_email }" readonly>
			</div>
			<div>
				<h3>계약담당자</h3>
			</div>
			<div class="input-group">
				<label>담당자명</label><input name="user_name" id="user_name" type="text" value="${user.user_email}" readonly><br>
				<label>담당자 이메일</label><input name="user_email" id="user_email" type="text" value="${user.user_name}" readonly><br>
			</div>
			<div class="input-group">
				<label>담당자 전화번호</label><input name="user_number" id="user_number" type="text" value="${user.user_number}" readonly><br>
				<label>담당자 부서</label><input name="user_id" id="user_id" type="text" value="${con.user_id}" readonly><br>
			</div>
			<hr>
			<div style="text-align: right;">
				<button type="button" class="addbutton" onclick="btnsumbit()">계약수정</button>
				<button type="reset" class="addbutton">초기화</button>
			</div>
		</form>
	</div>
</div>
</div>

<%@include file="../include/footer.jsp"%>
<script>
	function alertprint(message, element) {
		alert(message + "을 입력해주세요.");
		document.getElementById(element).focus();
	}//end
	function calculate() {
		var item_price = document.getElementById("item_price").value;
		var contracts_quantity = document.getElementById("contracts_quantity").value;
		// 입력값을 숫자로 변환
		item_price = parseFloat(item_price);
		contracts_quantity = parseInt(contracts_quantity);
		// contracts_price 계산
		var contracts_price = item_price * contracts_quantity;
		// 결과를 화면에 표시 (소수점 없이)
		document.getElementById("contracts_price").value = Math
				.floor(contracts_price); // 소수점 제거
	}//end
	
	window.onload = function() {
	    originalValue = document.getElementById("contracts_deliveryDate").value;
	};

	function checkdate() {
	    var form = document.getElementById("contractsUpdateForm");
	    var contracts_deliveryDate = new Date(form.contracts_deliveryDate.value);
				
	    var bom_schedule = parseInt(form.bom_schedule.value, 10); // 숫자로 변환
	    var today = new Date();
	    today.setHours(0, 0, 0, 0);
	    
	    if (contracts_deliveryDate < today) {
	        alert("계약일은 오늘 이후의 날짜여야 합니다."); // 오늘 이전 날짜 선택 시 경고
	        form.contracts_deliveryDate.value = originalValue; // 입력값 초기화
	        form.contracts_deliveryDate.focus(); // 계약일 필드에 포커스
	        return;
	    }

	    // bom_schedule이 숫자일 경우 today에 더하기
	    today.setDate(today.getDate() + bom_schedule+10);
	    

	    if (contracts_deliveryDate < today) {
	    	let formattedDate = today.toISOString().split('T')[0]; // YYYY-MM-DD 형식
	        alert("제조소요일부터 10일후인 "+formattedDate+"이후를 선택해야합니다."); // 오늘 이전 날짜 선택 시 경고
	        form.contracts_deliveryDate.value = originalValue; // 입력값 초기화
	        form.contracts_deliveryDate.focus(); // 계약일 필드에 포커스
	        return;
	    }
	}//checkdate
	

	function btnsumbit() {
		var contracts_quantity = document.getElementById("contracts_quantity").value;
		if (contracts_quantity === "" || contracts_quantity == null) {
			alertprint("계약수량", "contracts_quantity");
			return;
		}//end

		if (!confirm('계약을 수정하시겠습니까?')) {
			alert("계약수정이 취소되었습니다.");
			location.href = "/contracts/contractsSelect?contracts_no=" + ${con.contracts_no};
		} else {
			document.getElementById("contractsUpdateForm").submit();
			alert("계약수정이 완료되었습니다.");
		}//end

	}//btnsumbit
</script>