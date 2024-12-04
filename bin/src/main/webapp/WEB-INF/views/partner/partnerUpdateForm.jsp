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
	<h2>협력회사 수정화면</h2>
	<hr>
	<div class="input-container">
		<form action="partnerUpdate" method="post" id="partnerUpdateForm" name="partnerUpdateForm">
			<div class="input-group">
				<label>협력회사 사업자번호</label> <input style="width: 80%;" name="partner_taxid" id="partner_taxid" type="text" value="${part.partner_taxid }" readonly>
			</div>
			<div class="input-group">
				<label>협력회사명</label> <input  style="width: 80%;" name="partner_companyname" id="partner_companyname" type="text"value="${part.partner_companyname }">
			</div>
			<div class="input-group">
				<label>협력회사 전화번호</label> <input  style="width: 80%;" name="partner_number" id="partner_number" type="text"value="${part.partner_number }" onkeyup="checkNumber(this)">
			</div>
			<div class="input-group">
				<label>협력회사 대표자명</label> <input style="width: 80%;" name="partner_ownername" id="partner_ownername" type="text"value="${part.partner_ownername }">
			</div>
			<div class="input-group">
				<label>협력회사 fax</label> <input style="width: 80%;" name="partner_fax" id="partner_fax" type="text"value="${part.partner_fax}" onkeyup="checkNumber(this)">
			</div>
			<div class="input-group">
				<label>협력회사 email</label> <input style="width: 80%;" name="partner_email" id="partner_email" type="text"value="${part.partner_email }">
			</div>
			<div class="input-group">
				<label>협력회사 사업장주소</label><input type="hidden" name="partner_add" id="partner_add" value="${part.partner_add }" onkeyup="setAddress()"readonly>
				<input type="text" id="postcode" placeholder="우편번호" style="width: 200px;" readonly onkeyup="setAddress()">
				<input type="text" id="address" placeholder="주소" style="width: 520px; margin-left: 20px;" readonly onkeyup="setAddress()">
				<input type="button" onclick="daumPost()" value="우편번호 찾기"  class="addbutton" style="height: 45px; margin-top: 5px;">
				<input type="text" id="detailAddress"  placeholder="상세주소" onkeyup="setAddress()"  oninput="inputpartadd()" style="margin-left:190px; width:740px;">
			</div>
			<hr>
			<div style="text-align: right;">
				<button  class="addbutton" type="button" onclick="btnsumbit()">협력회사 수정</button>
				<button  class="addbutton" type="reset">초기화</button>
			</div>
		</form>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
<!-- 주소 api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//window열자마자 바로 실행되게
window.onload = function() {
    setAddress();
};
//주소입력용
function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById('address').value = addr;
            document.getElementById('partner_add').value = data.zonecode + "," + addr+",";
            document.getElementById('detailAddress').value = "";
            document.getElementById('detailAddress').focus()
        }
    }).open();
}//end daumPost

function inputpartadd(){
	const detailAddress = document.getElementById('detailAddress').value;
	const partnerAdd = document.getElementById('partner_add');

		// 기존의 협력회사 사업장주소와 detailAddress를 합칩니다.
		partnerAdd.value = partnerAdd.value.split(',')[0]+','+partnerAdd.value.split(',')[1] + ',' + detailAddress;

	}//end inputpartadd
//주소 보여주는 용
function setAddress(){
	const partner_add = document.getElementById('partner_add').value;
	const [postcode, address, detailAddress] = partner_add.split(',');
	
	//공백자체를 넣기 않았기에 공백제거 없애기
	document.getElementById('postcode').value = postcode;
	document.getElementById('address').value = address;
	document.getElementById('detailAddress').value = detailAddress || '';//없으면 공백처리
	
}//end setAddress

//전화번호 입력
function checkNumber(InputNumber) {
	var telNumber = InputNumber.value;
	var length = telNumber.length;
	if (length >= 8) {
		let numbers = telNumber.replace(/[^0-9]/g, "").replace(
				/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		InputNumber.value = numbers;
	}
}//end checkNumber

//alert 공통으로 묶은 것
function showAlert(message, InputElement){
	alert(message);
	document.getElementById(InputElement).focus();
    document.getElementById(InputElement).value = "";
}//end

//제출검사용
function btnsumbit() {
    const partnerTaxId = document.getElementById("partner_taxid").value;
    const partnerCompanyName = document.getElementById("partner_companyname").value;
    const partnerNumber = document.getElementById("partner_number").value;
    const partnerOwnerName = document.getElementById("partner_ownername").value;
    const partnerFax = document.getElementById("partner_fax").value;
    const partnerEmail = document.getElementById("partner_email").value;
    const partnerAdd = document.getElementById("partner_add").value;

    const taxIdRegex = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/;
    const companyNameRegex = /^[가-힣a-zA-Z0-9\s]{1,50}$/;
    const numberRegex = /^\d{2,3}-\d{3,4}-\d{4}$/;
    const ownerNameRegex = /^[가-힣a-zA-Z\s]{1,30}$/;
    const faxRegex = /^\d{2,3}-\d{3,4}-\d{4}$/;
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (!companyNameRegex.test(partnerCompanyName)) {
    	showAlert("협력회사명은 1~50자리의 한글, 영문, 숫자, 공백으로 구성되어야 합니다.", "partner_companyname");
        return;
    }
    if (!numberRegex.test(partnerNumber)) {
    	showAlert("전화번호 형식이 올바르지 않습니다.", "partner_number");
        return;
    }
    if (!ownerNameRegex.test(partnerOwnerName)) {
    	showAlert("대표자명은 1~30자리의 한글, 영문, 공백으로 구성되어야 합니다.", "partner_ownername");
        return;
    }
    if (!faxRegex.test(partnerFax)) {
    	showAlert("FAX 형식이 올바르지 않습니다.", "partner_fax");
        return;
    }
    if (!emailRegex.test(partnerEmail)) {
    	showAlert("이메일 형식이 올바르지 않습니다.", "partner_email");
        return;
    }
    if (!partnerAdd) {
    	showAlert("사업장주소는 1~100자리의 한글, 영문, 숫자, 공백으로 구성되어야 합니다.", "partner_add");
        return;
    }
    
    if (!confirm('협력회사수정을 하시겠습니까?')) {
        alert("협력회사수정이 취소되었습니다.");
        location.href = `/partner/partnerSelect?partner_taxid=${part.partner_taxid }`;
        return;
    }
        document.getElementById("partnerUpdateForm").submit();
        alert("협력회사수정이 완료되었습니다.");

}//btnsumbit

</script>