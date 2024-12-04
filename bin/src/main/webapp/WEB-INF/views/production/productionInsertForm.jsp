<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
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
	<h2>생산계획등록</h2>
	<hr>
	<div class="input-container">
		<form action="productionInsert" method="post" name="productionInsertForm" id="productionInsertForm">
			<div>
				<h3>계약 상세내역</h3>
			</div>
			<div class="input-group">
				<label>계약코드</label> <input name="contracts_no" id="contracts_no" type="number" placeholder="계약선택" onclick="opencontractsModal()"><br>
			</div>
			<div class="input-group">	
				<label>계약물품코드</label> <input name="item_no" id="item_no" type="number" placeholder="계약선택" onclick="opencontractsModal()"><br>
				<label>계약물품명</label> <input name="item_name" id="item_name" type="text" placeholder="계약선택" onclick="opencontractsModal()"><br>
			</div>
			<div class="input-group">	
				<label>계약물품제조소요일(일)</label> <input style="height: 45px;, margin-top: 10px;" name="bom_schedule" id="bom_schedule" type="number" placeholder="계약선택" onclick="opencontractsModal()"><br>
				<label>계약수량</label> <input style="height: 45px;, margin-top: 10px;" name="contracts_quantity" id="contracts_quantity" type="number" placeholder="계약선택" onclick="opencontractsModal()"><br>
			</div>
			<div class="input-group">	
				<label>계약가격</label> <input name="contracts_price" id="contracts_price" type="number" placeholder="계약선택" onclick="opencontractsModal()"><br> 
				<label>계약납기일</label> <input name="contracts_deliveryDate" id="contracts_deliveryDate" type="date" placeholder="계약선택" onclick="opencontractsModal()" readonly>
			</div>
			<hr>
			<div>
				<h3>생산계획 상세정보</h3>
			</div>
			<div class="input-group">	
				<label>생산수량</label> <input name="production_quantity" id="production_quantity" type="number"><br>
				<label>생산납기일</label> <input name="production_deliveryDate" id="production_deliveryDate" type="date" onchange="checkdate()">
			</div>
			<hr>
			<div>
				<h3>생산계획 담당자</h3><input name="user_id" id="user_id" type="hidden"> 
			</div>
			<div class="input-group">
				<label>담당자명</label> <input name="user_name" id="user_name" type="text" placeholder="담당자선택" onclick="openuserModal('생산부서')"><br> 
				<label>담당자 이메일</label> <input name="user_email" id="user_email" type="text" placeholder="담당자선택" onclick="openuserModal('생산부서')"><br> 
			</div>
			<div class="input-group">
				<label>담당자 전화번호</label> <input name="user_number" id=user_number type="text" placeholder="담당자선택" onclick="openuserModal('생산부서')"><br>
				<label>담당자 부서</label> <input name="user_department" id=user_department type="text" placeholder="담당자선택" onclick="openuserModal('생산부서')">
			</div>
			<hr>
			<div style="text-align: right;">
				<button class="addbutton" type="button" onclick="btnsumbit()">생산계획등록</button>
				<button class="addbutton" type="reset">초기화</button>
			</div>
		</form>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
<!-- 계약 모달창 -->
<jsp:include page="../contracts/contractsModal.jsp" />
<!-- 담당자 모달창 -->
<jsp:include page="../user/userModal.jsp" />
<script>

	function alertprint(message, element) {
		alert(message + "을(를) 입력해주세요.");
		document.getElementById(element).focus();
	}//end

	function alertAndReset(inputField, message) {
	    alert(message);
	    inputField.value = "";
	    inputField.focus();
	}//alertAndReset

	function checkdate() {
	    var form = document.getElementById("productionInsertForm");
	    var production_deliveryDate = new Date(form.production_deliveryDate.value);
	    var contracts_deliveryDate = new Date(form.contracts_deliveryDate.value);
	    
	    var contracts_no = document.getElementById("contracts_no").value;
	    var bom_schedule = parseInt(form.bom_schedule.value, 10); // 숫자로 변환
	    if (!contracts_no) {
	        alertAndReset(form.production_deliveryDate, "계약코드를 선택해주세요.");
	        return;
	    }
	    
	    var today = new Date();
	    today.setHours(0, 0, 0, 0);
	    
	    // 납기일이 오늘 이후인지 확인
	    if (production_deliveryDate < today) {
	        alertAndReset(form.production_deliveryDate, "납기일은 오늘 이후의 날짜여야 합니다.");
	        return;
	    }
	    
	    // 제작 소요일에 따라 오늘 날짜를 업데이트
	    today.setDate(today.getDate() + bom_schedule);
	    // 납기일이 제작 소요일 이후인지 확인
	    if (production_deliveryDate < today) {
	        alertAndReset(form.production_deliveryDate, "제작소요일인 " + today.toLocaleDateString() + " 이후의 날짜여야 합니다.");
	        return;
	    }
	    
	    // 계약 날짜와 비교 (contracts_deliveryDate와 비교해야 함)
	    if (production_deliveryDate > contracts_deliveryDate) {
	        alertAndReset(form.production_deliveryDate, "계약날짜 이전의 날짜여야 합니다.");
	        return;
	    }
	    
	    //계약날짜보다 3일전에 생산완료
	    const threeDaysBeforeContractDate = new Date(contracts_deliveryDate);
	    threeDaysBeforeContractDate.setDate(threeDaysBeforeContractDate.getDate() - 4);
	    if (production_deliveryDate > threeDaysBeforeContractDate) {
	        alertAndReset(form.production_deliveryDate, "계약날짜 3일 전까지의 날짜여야 합니다.");
	        return;
	    }
	    
	}//checkdate
	
	
	
	function btnsumbit() {
		var contracts_no = document.getElementById("contracts_no").value;
		if(contracts_no===""){
			alertprint("계약코드", "contracts_no");
			return;
		}//end
		
		var production_quantity = parseInt(document.getElementById("production_quantity").value, 10); // 정수로 변환
	    var contracts_quantity = parseInt(document.getElementById("contracts_quantity").value, 10); // 정수로 변환
		
	    if (isNaN(production_quantity) || production_quantity <= 0) { // 생산 수량이 숫자가 아니거나 0 이하인지 확인
	        alertprint("생산수량", "production_quantity");
	        return;
	    }//end
	    
	    if (production_quantity > contracts_quantity) {
	        alertprint("계약수량보다 많습니다. 생산수량", "production_quantity");
	        return;
	    }//end
		
		var production_deliveryDate = document.getElementById("production_deliveryDate").value;
		if(production_deliveryDate===""){
			alertprint("계약납기일", "production_deliveryDate");
			return;
		}//end
		
		var user_id = document.getElementById("user_id").value;
		if(user_id===""){
			alertprint("생산계획 담당자", "user_id");
			return;
		}//end

		if (!confirm('생산계획을 등록하시겠습니까?')) {
			alert("생산계획등록이 취소되었습니다.");
			location.href = "/production/productionAll";
			return;
		}//end
		
		document.getElementById("productionInsertForm").submit();
		alert("생산계획등록이 완료되었습니다. 승인 여부를 확인해주세요.");
	}//btnsumbit
</script>