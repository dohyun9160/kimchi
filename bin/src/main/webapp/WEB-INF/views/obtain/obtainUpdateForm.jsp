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
	<h2>조달계획 수정화면</h2>
	<hr>
	<div class="input-container">
		<form action="obtainUpdate" method="post" id="obtainUpdateForm" name="obtainUpdateForm">
			<div>
				<h3>생산계획 상세</h3>
			</div>
			<div class="input-group">
				<label>생산계획코드</label> <input name="production_no" id="production_no" type="number" value="${obtain.production_no}" readonly><br>
				<label>생산량</label> <input name="production_quantity" id="production_quantity" type="number" value="${pro.production_quantity }" readonly><br>
			</div>
			<div class="input-group">
				<label>생산납기일</label> <input name="production_deliveryDate" id="production_deliveryDate" type="date" value="${pro.production_deliveryDate }" readonly>
			</div>
			<hr>
			<div>
				<h3>조달자재 상세</h3><input name ="bom_ma_amount" id = "bom_ma_amount" type="hidden" readonly value ="${bom_ma.bom_ma_amount}">
			</div>
			<div class="input-group">
				<label>자재코드</label> <input name="ma_id" id="ma_id" type="number" value = "${ma.ma_id }" readonly><br>
				<label>자재분류</label> <input name="ma_category" id="ma_category" type="text" value = "${ma.ma_category }" readonly><br>
			</div>
			<div class="input-group">	
				<label>자재명</label> <input name="ma_name" id="ma_name" type="text" value = "${ma.ma_name}" readonly><br> 
				<label>자재원산지</label> <input name="ma_origin" id="ma_origin" type="text" value = "${ma.ma_origin}" readonly><br>
			</div>
			<div class="input-group">
				<label>자재단가</label> <input name="ma_price" id="ma_price" type="number" value = "${ma.ma_price }" readonly><br>
				<label>자재최소필요량</label> <input name="ma_min" id="ma_min" type="number" value="0" readonly><br>
			</div>
			<hr>
			<div>
				<h3>조달계획 상세</h3>
			</div>
			<div class="input-group">
				<label>조달계획코드</label> <input name="obtain_no" id="obtain_no" type="number" value="${obtain.obtain_no}" readonly><br>
				<label>자재조달량</label> <input name="obtain_quantity" id="obtain_quantity" type="number" value="${obtain.obtain_quantity}" oninput="calculate()"><br>
			</div>
			<div class="input-group">	
				<label>조달계획가격</label><input name="obtain_price" id="obtain_price" type="number" value="${obtain.obtain_price}" onkeyup="calculate()" readonly><br>
				<label>조달계획납기일</label> <input name="obtain_deliveryDate" id="obtain_deliveryDate" type="date" value="${obtain.obtain_deliveryDate}" onchange="checkdate()">
			</div>
			<hr>
			<div>
				<h3>조달계획 협력회사 상세정보</h3>
			</div>
			<div class="input-group">
				<label>협력회사 사업자번호</label> <input name="partner_taxid" id="partner_taxid" type="text" value="${obtain.partner_taxid }" readonly><br>
				 <label>협력회사 회사명</label> <input name="partner_companyname" id="partner_companyname" type="text"value="${partner.partner_companyname }" readonly><br>
			</div>
			<div class="input-group">	
				<label>협력회사 대표자명</label> <input name="partner_ownername" id="partner_ownername" type="text" value="${partner.partner_ownername }" readonly><br>
				 <label>협력회사 전화번호</label> <input name="partner_number" id="partner_number" type="text" value="${partner.partner_number }" readonly><br> 
			</div>
			<div class="input-group"> 
				 <label>협력회사 이메일</label> <input name="partner_email" id="partner_email" type="text" value="${partner.partner_email }" readonly>
			</div>
			<hr>
			<div>
				<h3>계약담당자</h3><input name="user_id" id="user_id" type="hidden">
			</div>
			<div class="input-group">
				<label>담당자명</label> <input name="user_name" id="user_name" type="text" value="${user.user_name }" readonly><br> 
				<label>담당자 이메일</label> <input name="user_email" id="user_email" type="text" value="${user.user_email }" readonly><br>
			</div>
			<div class="input-group">
				<label>담당자 전화번호</label> <input name="user_number" id=user_number type="text" value="${user.user_number }" readonly><br>
				<label>담당자 부서</label> <input name="user_department" id=user_department type="text" value="${user.user_department }" readonly>
			</div>
			<hr>
			<div style="text-align: right;">
				<button type="button" class="addbutton" onclick="btnsumbit()">조달계획수정</button>
				<button type="reset" class="addbutton">초기화</button>
			</div>
		</form>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
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
	}

	// DOMContentLoaded 이벤트 리스너
	document.addEventListener('DOMContentLoaded', function() {
	    // 초기 값으로 calnum 호출
	    calnum();
	});
	
	function calculate() {
		var ma_price = document.getElementById("ma_price").value;
		var obtain_quantity = document.getElementById("obtain_quantity").value;
		// 입력값을 숫자로 변환
		ma_price = parseFloat(ma_price);
		obtain_quantity = parseInt(obtain_quantity);
		// contracts_price 계산
		var obtain_price = ma_price * obtain_quantity;
		// 결과를 화면에 표시 (소수점 없이)
		if (!isNaN(obtain_price)) {
			document.getElementById("obtain_price").value = Math.floor(obtain_price);
		} else {
			console.error("obtain_price는 유효한 숫자가 아닙니다.");
		}
	}//end

	window.onload = function() {
		originalValue = document.getElementById("obtain_deliveryDate").value;
	};

	function checkdate() {
		var form = document.getElementById("obtainUpdateForm");
		var production_deliveryDate = new Date(
				form.production_deliveryDate.value);
		var obtain_deliveryDate = new Date(form.obtain_deliveryDate.value);

		var today = new Date();
		today.setHours(0, 0, 0, 0);

		// 납기일이 오늘 이후인지 확인
		if (obtain_deliveryDate < today) {
			alert("납기일은 오늘 이후의 날짜여야 합니다.");
			form.obtain_deliveryDate = originalValue;
			form.obtain_deliveryDate.focus();
			return;
		}

		// 계약 날짜와 비교 (contracts_deliveryDate와 비교해야 함)
		if (obtain_deliveryDate > production_deliveryDate) {
			alert("생산계획 이전의 날짜여야 합니다.");
			form.obtain_deliveryDate = originalValue;
			form.obtain_deliveryDate.focus();
			return;
		}

		// 제작 소요일에 따라 오늘 날짜를 업데이트
		today.setDate(today.getDate() + 5);

		if (obtain_deliveryDate > today) {
			let formattedDate = today.toISOString().split('T')[0]; // YYYY-MM-DD 형식
			alert(formattedDate + "이내에 조달해야합니다.");
			form.obtain_deliveryDate = originalValue;
			form.obtain_deliveryDate.focus();
			return;
		}

	}//checkdate

	function btnsumbit() {
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

		var ma_min = document.getElementById("ma_min").value;
		var obtain_quantity = document.getElementById("obtain_quantity").value;
		if (obtain_quantity < ma_min) {
			if (!confirm('자재조달량이 자재최소필요량보다 적습니다. 이대로 조달하겠습니까?')) {
				obtain_quantity == "";
				alertprint("자재조달량", "obtain_quantity");
				return;
			}
		}//end

		if (!confirm('조달계획을 수정하시겠습니까?')) {
			alert("조달계획수정이 취소되었습니다.");
			location.href = "/obtain/obtainSelect?obtain_no=" + ${obtain.obtain_no};
			return;
		}//end

		document.getElementById("obtainUpdateForm").submit();
		alert("조달계획등록이 수정되었습니다.");

	}//end
</script>