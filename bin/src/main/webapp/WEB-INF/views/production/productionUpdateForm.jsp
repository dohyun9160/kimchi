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
	<h2>생산계획 수정</h2>
	<hr>
	<div class="input-container">
		<form action="productionUpdate" method="post" name="productionUpdateForm" id="productionUpdateForm">
			<div>
				<h3>계약 상세내역</h3>
			</div>
			<div class="input-group">
				<label>계약코드</label> <input name="contracts_no" id="contracts_no" type="number" value="${con.contracts_no }" readonly><br> 
			</div>
			<div class="input-group">
				<label>계약물품코드</label> <input name="item_no" id="item_no" type="number" value = "${con.item_no}" readonly> <br>
				<label>계약물품명</label> <input name="item_name" id="item_name" type="text" value = "${item.item_name}" readonly> <br>
			</div>
			<div class="input-group">
				<label>계약물품제조소요일(일)</label> <input style="height: 45px;, margin-top: 10px;" name="bom_schedule" id="bom_schedule" type="number" value="${item.bomVO.bom_schedule}" readonly><br>
				<label>계약수량</label> <input style="height: 45px;, margin-top: 10px;" name="contracts_quantity" id="contracts_quantity" type="number" value ="${con.contracts_quantity }" readonly> <br>
			</div>
			<div class="input-group">	
				<label>계약가격</label> <input name="contracts_price" id="contracts_price" type="number" value ="${con.contracts_price }" readonly><br>
				<label>계약납기일</label> <input name="contracts_deliveryDate" id="contracts_deliveryDate" type="date" value = "${con.contracts_deliveryDate }" readonly><br>
			</div>
			<hr>
			<div>
				<h3>생산계획 상세정보</h3>
			</div>
			<div class="input-group">
				<label>생산계획코드</label> <input name = "production_no" id = "production_no" type ="number" value ="${pro.production_no}" readonly><br>
				<label>생산수량</label> <input name="production_quantity" id="production_quantity" type="number" value ="${pro.production_quantity}"> <br>
			</div>
			<div class="input-group">	
				<label>생산납기일</label> <input name="production_deliveryDate" id="production_deliveryDate" type="date" value ="${pro.production_deliveryDate}" onchange="checkdate()">
			</div>
			<hr>
			<div>
				<h3>생산계획 담당자</h3><input name="user_id" id="user_id" type="hidden" value ="${user.user_id}" readonly>
			</div>
			<div class="input-group">
				<label>담당자명</label><input name="user_name" id="user_name" type="text" value ="${user.user_name}" readonly><br>
				<label>담당자 이메일</label> <input name="user_email" id="user_email" type="text" value ="${user.user_email}" readonly><br> 
			</div>
			<div class="input-group">	
				<label>담당자 전화번호</label> <input name="user_number" id=user_number type="text" value ="${user.user_number}" readonly><br> 
				<label>담당자 부서</label><input name="user_department" id=user_department type="text" value ="${user.user_department}" readonly>
			</div>
			<hr>
			<div style="text-align: right;">
			<button class="addbutton" type="button" onclick="btnsumbit()">생산계획수정</button>
			<button class="addbutton" type="reset">초기화</button>
			</div>
		</form>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
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

	window.onload = function() {
	    originalValue = document.getElementById("production_deliveryDate").value;
	};

	function checkdate() {
	    var form = document.getElementById("productionUpdateForm");
	    
	    // 날짜 문자열을 Date 객체로 변환
	    var production_deliveryDate = new Date(form.production_deliveryDate.value);
	    var contracts_deliveryDate = new Date(form.contracts_deliveryDate.value);
	    var maxDate = contracts_deliveryDate;
	    
	    // 날짜 유효성 검사
	    if (isNaN(production_deliveryDate.getTime()) || isNaN(contracts_deliveryDate.getTime())) {
	        alert("날짜 형식이 올바르지 않습니다.");
	        return;
	    }

	    var bom_schedule = parseInt(form.bom_schedule.value, 10); // 숫자로 변환
	    
	    var today = new Date();
	    today.setHours(0, 0, 0, 0);
	    
	    // 납기일이 오늘 이후인지 확인
	    if (production_deliveryDate < today) {
	    	alert("생산계획납기일은 오늘 이후의 날짜여야 합니다.");
	        form.production_deliveryDate.value=originalValue;
	        form.production_deliveryDate.focus();
	        return;
	    }
	    
	    today.setDate(today.getDate() + bom_schedule);
	    maxDate.setDate(maxDate.getDate() - 4);
	    
	    // 제작 소요일에 따라 오늘 날짜를 업데이트 계약일보다 3일 전까지 생산완료
	    if (!(today < production_deliveryDate && production_deliveryDate < maxDate)) {
	    	alert("제조일인"+today.toLocaleDateString()+"에서 계약3일전인" + maxDate.toLocaleDateString() + " 사이의 날짜여야 합니다.");
	        form.production_deliveryDate.value=originalValue;
	        form.production_deliveryDate.focus();
	        return;
	    }
	}//end
	
	
	function btnsumbit() {
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

		if (!confirm('생산계획을 수정하시겠습니까?')) {
			alert("생산계획수정이 취소되었습니다.");
			location.href = "/production/productionSelect?production_no="+${pro.production_no};
			return;
		}//end
		
		document.getElementById("productionUpdateForm").submit();
		alert("생산계획등록이 수정되었습니다.");
	}//btnsumbit
</script>