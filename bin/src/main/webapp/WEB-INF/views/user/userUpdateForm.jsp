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
<script>
function checkNumber(InputNumber) {
	var telNumber = InputNumber.value;
	var length = telNumber.length;
	if (length >= 8) {
		let numbers = telNumber.replace(/[^0-9]/g, "").replace(
				/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		InputNumber.value = numbers;
	}
}//end checkNumber
//중복하는 함수 줄이기
function showAlert(message, InputElement){
	alert(message);
	document.getElementById(InputElement).focus();
    document.getElementById(InputElement).value = "";
}//end

function submitCheck() {
    var user_email = document.getElementById("user_email").value;
    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    var user_name = document.getElementById("user_name").value;
    var namePattern = /^[가-힣A-Za-z]+$/;
    var user_number = document.getElementById("user_number").value;
    var numberPattern1 = /^\d{3}-\d{3,4}-\d{4}$/; // 정규 표현식 수정
    var numberPattern2 = /^\d{2,3}-\d{3,4}-\d{4}$/; // 정규 표현식 수정
    var user_department = document.getElementById("user_department").value;

    if (!emailPattern.test(user_email)) {
        showAlert("올바르지 않은 이메일 형식입니다.", "user_email");
        return;
    }

    if (!namePattern.test(user_name)) {
        showAlert("올바르지 않는 이름 형식입니다.", "user_name");
        return;
    }

    if (!numberPattern1.test(user_number) || !numberPattern2.test(user_number)) {
        showAlert("올바르지 않는 휴대전화 형식입니다.", "user_number");
        return;
    }

    if (user_department === '부서선택') {
        showAlert("부서를 선택해주세요.", "user_department");
        return;
    }

    if (!confirm('회원정보를 수정하시겠습니까?')) {
        alert("회원정보 수정이 취소되었습니다.");
        location.href = `/user/userSelect?user_id=${user.user_id}`;
        return;
    }//end
    
        document.getElementById("userUpdateForm").submit();
        alert("회원정보가 수정되었습니다.");
    }//end
</script>
<%@include file="../include/header.jsp"%>
<div class="content-body">
	<h2>사원 수정화면</h2>
	<hr>
	<div class="input-container">
		<form action="userUpdate" method = post id = "userUpdateForm" name = "userUpdateForm">
			<input style="width: 80%;" id=user_id name="user_id" type="hidden" value="${user.user_id }" readonly>
			<div class="input-group">
				<label>사용자 email</label> <input style="width: 80%;" name ="user_email" id ="user_email" type="text" value="${user.user_email }">
			</div>
			<div class="input-group">
				<label>사용자명</label> <input style="width: 80%;" name ="user_name" id ="user_name" type="text" value="${user.user_name }">
			</div>
			<div class="input-group">
				<label>사용자 전화번호</label> <input style="width: 80%;" name ="user_number" id ="user_number" type="text" value="${user.user_number }" onkeyup="checkNumber(this)" maxlength="13">
			</div>
			<div class="input-group">
				<label>사용자 부서</label>
				<select name="user_department" id="user_department" required style="width: 50%; margin-left:40px;">
					<option value="부서선택 "${user.user_department == '부서선택' ? 'selected' : ''}>부서선택</option>
					<option value="자재부서" ${user.user_department == '자재부서' ? 'selected' : ''}>자재부서</option>
					<option value="개발부서" ${user.user_department == '개발부서' ? 'selected' : ''}>개발부서</option>
					<option value="발주부서" ${user.user_department == '발주부서' ? 'selected' : ''}>발주부서</option>
					<option value="생산부서" ${user.user_department == '생산부서' ? 'selected' : ''}>생산부서</option>
				</select>
			</div>
			<hr>
			<div style="text-align: right;">
				<button class="addbutton" type = "button" onclick="submitCheck()">정보 수정</button>
				<button class="addbutton" type ="reset">초기화</button>
			</div>
		</form>
	</div>
</div>
<%@include file="../include/footer.jsp"%>