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
	<h2>조달계획 등록</h2>
	<hr>
	<div class="input-container">
		<form action="obtainInsert" method="post" id="obtainInsertForm" name="obtainInsertForm">
			<div>
			<h3>생산계획 상세</h3>
				<input name ="bom_ma_amount" id = "bom_ma_amount" type="hidden" readonly onclick="openobtain_maModal()" oninput="calnum()">
			</div>
			<div class="input-group">
				<label>생산계획코드</label> <input name="production_no" id="production_no" type="number" value="${pro.production_no}" readonly><br>
				<label>생산량</label> <input name="production_quantity" id="production_quantity" type="number" value="${pro.production_quantity}" oninput="calnum()" readonly><br>
			</div>
			<div class="input-group">
				<label>생산납기일</label><input name="production_deliveryDate" id="production_deliveryDate" type="date"  value="${pro.production_deliveryDate}" readonly>
			</div>
			<hr>
			<div>
				<h3>조달자재 상세</h3>
			</div>
			<div class="input-group">
				<label>자재코드</label> <input name="ma_id" id="ma_id" type="number" placeholder="자재선택" onclick="openobtain_maModal()"><br>
				<label>자재분류</label> <input name="ma_category" id="ma_category" type="text" placeholder="자재선택" onclick="openobtain_maModal()"><br> 
			</div>
			<div class="input-group">	
				<label>자재명</label> <input name="ma_name" id="ma_name" type="text" placeholder="자재선택" onclick="openobtain_maModal()"><br>
				<label>자재원산지</label> <input name="ma_origin" id="ma_origin" type="text" placeholder="자재선택" onclick="openobtain_maModal()"><br>
			</div>
			<div class="input-group">	
				<label>자재단가</label> <input name="ma_price" id="ma_price" type="number" placeholder="자재선택"  oninput="calculate()"><br>
				<label>자재최소필요량</label> <input name="ma_min" id="ma_min" type="number" value="0" onkeyup="calnum()" readonly>
			</div>
			<hr>
			<div>
			<h3>조달게획 상세</h3>
			</div>
			<div class="input-group">	
				<label>자재조달량</label> <input name="obtain_quantity" id="obtain_quantity" type="number" oninput="calculate()"><br>
				<label>조달계획가격</label> <input name="obtain_price" id="obtain_price" type="number" onkeyup="calculate()" readonly><br>
			</div>
			<div class="input-group">		
				<label>조달계획납기일</label> <input name="obtain_deliveryDate" id="obtain_deliveryDate" type="date" onchange="checkdate()">
			</div>
			<hr>
			<div>
			<h3>조달계획 협력회사 상세정보</h3>
			</div>
			<div class="input-group">	
				<label>협력회사 사업자번호</label> <input name="partner_taxid" id="partner_taxid" type="text" placeholder="협력회사선택" onclick="openpartnerModal()"><br> 
				<label>협력회사 회사명</label> <input name="partner_companyname" id="partner_companyname" type="text" placeholder="협력회사선택" onclick="openpartnerModal()"><br>
			</div>
			<div class="input-group">		
				<label>협력회사 대표자명</label> <input name="partner_ownername" id="partner_ownername" type="text" placeholder="협력회사선택" onclick="openpartnerModal()"><br> 
				<label>협력회사 전화번호</label> <input name="partner_number" id="partner_number" type="text" placeholder="협력회사선택" onclick="openpartnerModal()"><br>
			</div>
			<div class="input-group">		
				<label>협력회사 이메일</label> <input name="partner_email" id="partner_email" type="text" placeholder="협력회사선택" onclick="openpartnerModal()">
			</div>
			<hr>
			<div>
				<h3>조달계획 담당자</h3> <input name="user_id" id="user_id" type="hidden"> 
			</div>
			<div class="input-group">	
				<label>담당자명</label><input name="user_name" id="user_name" type="text" placeholder="담당자선택" onclick="openuserModal('구매부서')"><br> 
				<label>담당자 이메일</label> <input name="user_email" id="user_email" type="text" placeholder="담당자선택" onclick="openuserModal('구매부서')"><br> 
			</div>
			<div class="input-group">		
				<label>담당자 전화번호</label> <input name="user_number" id=user_number type="text" placeholder="담당자선택" onclick="openuserModal('구매부서')"><br> 
				<label>담당자 부서</label> <input name="user_department" id=user_department type="text" placeholder="담당자선택" onclick="openuserModal('구매부서')">
			</div>
			<hr>
			<div style="text-align: right;">
				<button type="button"class="addbutton" onclick="btnsumbit()">조달계획등록</button>
				<button type="reset" class="addbutton">초기화</button>
			</div>
		</form>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
<!-- 자재모달창 -->
<jsp:include page="obtain_maModal.jsp" />
<!-- 협력회사 모달창 -->
<jsp:include page="../partner/partnerModal.jsp" />
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

	function calnum() {
		var production_quantity = document.getElementById("production_quantity").value;
		production_quantity = parseFloat(production_quantity);
		var bom_ma_amount = document.getElementById("bom_ma_amount").value;
		bom_ma_amount = parseFloat(bom_ma_amount);

		if (!isNaN(production_quantity) && !isNaN(bom_ma_amount)) {
			var ma_min = production_quantity * bom_ma_amount;
			// 결과를 화면에 표시 (소수점 없이)
			document.getElementById("ma_min").value = Math.floor(ma_min); // 소수점 제거
		} else {
			document.getElementById("ma_min").value = ''; // 값이 없을 경우 비우기
		}
	}//calnum

	function calculate() {
		var ma_price = document.getElementById("ma_price").value;
		var obtain_quantity = document.getElementById("obtain_quantity").value;
		// 입력값을 숫자로 변환
		ma_price = parseFloat(ma_price);
		obtain_quantity = parseInt(obtain_quantity);
		// contracts_price 계산
		var obtain_price = ma_price * obtain_quantity;
		// 결과를 화면에 표시 (소수점 없이)
		document.getElementById("obtain_price").value = Math
				.floor(obtain_price); // 소수점 제거
	}//end
	
	function checkdate() {
	    var form = document.getElementById("obtainInsertForm");
	    var production_deliveryDate = new Date(form.production_deliveryDate.value);
	    var obtain_deliveryDate = new Date(form.obtain_deliveryDate.value);
	    
	    var today = new Date();
	    today.setHours(0, 0, 0, 0);
	    
	    // 납기일이 오늘 이후인지 확인
	    if (obtain_deliveryDate < today) {
	        alertAndReset(form.obtain_deliveryDate, "납기일은 오늘 이후의 날짜여야 합니다.");
	        return;
	    }
	    
	    // 계약 날짜와 비교 (contracts_deliveryDate와 비교해야 함)
	    if (obtain_deliveryDate > production_deliveryDate) {
	        alertAndReset(form.obtain_deliveryDate, "생산계획납기일 이전의 날짜여야 합니다.");
	        return;
	    }
	    
	    // 제작 소요일에 따라 오늘 날짜를 업데이트
	    today.setDate(today.getDate() + 5);
	    
	    if (obtain_deliveryDate > today) {
	    	let formattedDate = today.toISOString().split('T')[0]; // YYYY-MM-DD 형식
	        alertAndReset(form.obtain_deliveryDate, formattedDate+"이내에 조달해야합니다.");
	        return;
	    }
	    
	    
	}//checkdate

	function btnsumbit() {
		var ma_id = document.getElementById("ma_id").value;
		if (ma_id === "") {
			alertprint("자재코드", "ma_id");
			return;
		}//end
		
		var obtain_quantity = document.getElementById("obtain_quantity").value;
		if (obtain_quantity === "") {
			alertprint("자재조달량", "obtain_quantity");
			return;
		}//end
		
		var obtain_deliveryDate = document.getElementById("obtain_deliveryDate").value;
		if (obtain_deliveryDate === "") {
			alertprint("자재계획납기일", "obtain_deliveryDate");
			return;
		}//end
		
		var partner_taxid = document.getElementById("partner_taxid").value;
		if (partner_taxid === "") {
			alertprint("협력회사", "partner_taxid");
			return;
		}//end
		
		var user_id = document.getElementById("user_id").value;
		if (user_id === "") {
			alertprint("조달계획담당자", "user_name");
			return;
		}//end
		
		var ma_min = document.getElementById("ma_min").value;
		var obtain_quantity = document.getElementById("obtain_quantity").value;
		if(obtain_quantity < ma_min){
			if(!confirm('자재조달량이 자재최소필요량보다 적습니다. 이대로 조달하겠습니까?')){
				obtain_quantity =="";
				alertprint("자재조달량", "obtain_quantity");
				return;
			}
		}//end
		
		
		if (!confirm('조달계획을 등록하시겠습니까?')) {
			alert("조달계획등록이 취소되었습니다.");
			location.href = "/production/productionSelect?production_no="+${pro.production_no};
			return;
		}//end
		
		document.getElementById("obtainInsertForm").submit();
		alert("조달계획등록이 완료되었습니다. 조달 여부를 확인해주세요.");

	}//end
</script>