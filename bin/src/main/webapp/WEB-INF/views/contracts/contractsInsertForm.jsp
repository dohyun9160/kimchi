<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<link href="<c:url value="${contextPath}/resources/css/mystyle.css"/>" rel='stylesheet' />
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
<div class="content-body">
	<h2>계약 등록</h2>
	<hr>
	<div class="input-container">
		<form action="contractsInsert" method="post" name="contractsInsertForm" id="contractsInsertForm">
			<div>
				<h3>물품 상세</h3>
			</div>
			<div class="input-group">
				<label for="item_no">계약물품코드</label> <input name="item_no" id="item_no" type="number" placeholder="물품선택" onclick="openitemModal()">
				<label for="item_category">계약물품분류</label> <input name="item_category" id="item_category" type="text" placeholder="물품선택" onclick="openitemModal()">
			</div>
			<div class="input-group">
				<label for="item_name">계약물품명</label> <input name="item_name" id="item_name" type="text" placeholder="물품선택" onclick="openitemModal()">
				<label for="item_price">계약물품단가</label> <input name="item_price" id="item_price" type="number" placeholder="물품선택" onclick="openitemModal()" oninput="calculate()">
			</div>
			<div class="input-group">	
				<label for="bom_schedule">물품제조소요일(일)</label> <input name="bom_schedule" id="bom_schedule" type="number" placeholder="물품선택" onclick="openitemModal()">
			</div>
			<hr>
			<div>
				<h3>계약정보</h3>
			</div>
			<div class="input-group">
				<label for="contracts_quantity">계약수량</label> <input name="contracts_quantity" id="contracts_quantity" type="number" oninput="calculate()">
				<label for="contracts_price">계약가격</label> <input name="contracts_price" id="contracts_price" type="number" onkeyup="calculate()" readonly>
			</div>
			<div class="input-group">
				<label for="contracts_deliveryDate">계약납기일</label> <input name="contracts_deliveryDate" id="contracts_deliveryDate" type="date" onchange="checkdate()">
				<label for="contracts_details">계약상세내역</label>
				<textarea style="margin-left: 40px;" id="contracts_details" name="contracts_details" placeholder="계약상세내역"></textarea>
			</div>
			<hr>
			<div>
				<h3>계약협력회사 상세정보</h3>
			</div>
			<div class="input-group">
				<label for="partner_taxid">협력회사 사업자번호</label> <input name="partner_taxid" id="partner_taxid" type="text" placeholder="협력회사선택" onclick="openpartnerModal()"><br> 
				<label for="partner_companyname">협력회사 회사명</label> <input name="partner_companyname" id="partner_companyname" type="text" placeholder="협력회사선택" onclick="openpartnerModal()"><br>
			</div>
			<div class="input-group">
				<label for="partner_ownername">협력회사 대표자명</label> <input name="partner_ownername" id="partner_ownername" type="text" placeholder="협력회사선택" onclick="openpartnerModal()"><br>
				<label for="partner_number">협력회사 전화번호</label> <input name="partner_number" id="partner_number" type="text" placeholder="협력회사선택" onclick="openpartnerModal()"><br>
			</div>
			<div class="input-group">
				<label for="partner_email">협력회사 이메일</label> <input name="partner_email" id="partner_email" type="text" placeholder="협력회사선택" onclick="openpartnerModal()">
			</div>
			<hr>
			<div>
			<h3>계약담당자</h3>
				<input name="user_id" id="user_id" type="hidden">
			</div>
			<div class="input-group">
				<label for="user_name">담당자명</label> <input name="user_name" id="user_name" type="text" placeholder="담당자선택" onclick="openuserModal('생산부서')"><br> 
				<label for="user_email">담당자 이메일</label> <input name="user_email" id="user_email" type="text" placeholder="담당자선택" onclick="openuserModal('생산부서')"><br> 
			</div>
			<div class="input-group">
				<label for="user_number">담당자 전화번호</label> <input name="user_number" id=user_number type="text" placeholder="담당자선택" onclick="openuserModal('생산부서')"><br>
				<label for="user_department">담당자 부서</label> <input name="user_department" id=user_department type="text" placeholder="담당자선택" onclick="openuserModal('생산부서')">
			</div>
			<hr>
			<div style="text-align: right;">
				<button type="button" class="addbutton" onclick="btnsumbit()">계약등록</button>
				<button type="reset" class="addbutton">초기화</button>
			</div>
		</form>
	</div>
</div>
<!-- 물품 모달창 -->
<jsp:include page="../item/itemModal.jsp" />
<!-- 협력회사 모달창 -->
<jsp:include page="../partner/partnerModal.jsp" />
<!-- 담당자 모달창 -->
<jsp:include page="../user/userModal.jsp" />
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

	function checkdate() {
		var form = document.getElementById("contractsInsertForm");
		var contracts_deliveryDate = new Date(form.contracts_deliveryDate.value);

		var item_no = document.getElementById("item_no").value;
		if (item_no === "" || item_no == null) {
			alertprint("계약물품", "item_no");
			form.contracts_deliveryDate.value = "";
			return;
		}//end

		var bom_schedule = parseInt(form.bom_schedule.value, 10); // 숫자로 변환
		var today = new Date();
		today.setHours(0, 0, 0, 0);

		if (contracts_deliveryDate < today) {
			alert("계약일은 오늘 이후의 날짜여야 합니다."); // 오늘 이전 날짜 선택 시 경고
			form.contracts_deliveryDate.value = ""; // 입력값 초기화
			form.contracts_deliveryDate.focus(); // 계약일 필드에 포커스
			return;
		}

		// bom_schedule이 숫자일 경우 today에 더하기
		today.setDate(today.getDate() + bom_schedule + 10);

		if (contracts_deliveryDate < today) {
			let formattedDate = today.toISOString().split('T')[0]; // YYYY-MM-DD 형식
			alert("제조소요일부터 10일후인 " + formattedDate + "이후를 선택해야합니다."); // 오늘 이전 날짜 선택 시 경고
			form.contracts_deliveryDate.value = ""; // 입력값 초기화
			form.contracts_deliveryDate.focus(); // 계약일 필드에 포커스
			return;
		}
	}//checkdate

	function btnsumbit() {
		var item_no = document.getElementById("item_no").value;
		if (item_no === "" || item_no == null) {
			alertprint("계약물품", "item_no");
			return;
		}//end

		var contracts_quantity = document.getElementById("contracts_quantity").value;
		if (contracts_quantity === "" || contracts_quantity == null) {
			alertprint("계약수량", "contracts_quantity");
			return;
		}//end

		var contracts_deliveryDate = document
				.getElementById("contracts_deliveryDate").value;
		if (contracts_deliveryDate === "" || contracts_deliveryDate == null) {
			alertprint("계약납기일", "contracts_deliveryDate");
			return;
		}//end

		var partner_taxid = document.getElementById("partner_taxid").value;
		if (partner_taxid === "" || partner_taxid == null) {
			alertprint("협력회사", "partner_taxid");
			return;
		}//end

		var user_id = document.getElementById("user_id").value;
		if (user_id === "" || user_id == null) {
			alertprint("계약담당자", "user_id");
			return;
		}//end

		if (!confirm('계약을 등록하시겠습니까?')) {
			alert("계약등록이 취소되었습니다.");
			location.href = "/contracts/contractsAll";
			return;
		}//end
		document.getElementById("contractsInsertForm").submit();
		alert("계약등록이 완료되었습니다. 승인 여부를 확인해주세요.");

	}//btnsumbit
</script>
<%@include file="../include/footer.jsp"%>