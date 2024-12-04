<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${contextPath}/resources/images/favicon.png">
<link href="${contextPath}/resources/css/style.css" rel="stylesheet">
<style>
.form-check {
	margin-right: 100px; /* 원하는 간격으로 조정 */
	text-align: center;
}

.form-check-input {
	margin-top: 0.4rem;
}

.mb-2, .my-2 {
	margin-bottom: 3rem !important;
	margin-left: 50px;
	font-size: 1.1rem;
	transform: scale(1.2);
}
</style>
<div class="authincation h-100">
	<div class="container-fluid h-100">
		<div class="row justify-content-center h-100 align-items-center">
			<div class="col-md-6">
				<div class="authincation-content">
					<div class="row no-gutters">
						<div class="col-xl-12">
							<form method="post" id="loginForm" name="loginForm">
								<div class="auth-form">
									<div class="form-group">
										<div
											class="form-row d-flex justify-content-center mt-4 mb-2 align-items-center">
											<div class="form-check ml-2">
												<input class="form-check-input" type="checkbox" id="user"
													name="user" checked onclick="checkLoginForm('user')">
												<label class="form-check-label" for="user">사원</label>
											</div>
											<div class="form-check ml-2">
												<input class="form-check-input" type="checkbox" id="partner"
													name="partner" onclick="checkLoginForm('partner')">
												<label class="form-check-label" for="partner">협력회사</label>
											</div>
										</div>
									</div>
									<h4 class="text-center mb-4">로그인</h4>
									<div id="userLoginForm">
										<div class="form-group">
											<label><strong>ID</strong></label> <input type="text"
												id="user_id" name="user_id" class="form-control"
												placeholder="사원 ID">
										</div>
										<div class="form-group">
											<label><strong>Password</strong></label> <input id="user_pw"
												name="user_pw" type="password" class="form-control"
												placeholder="사원 비밀번호">
										</div>
										<div class="text-center">
											<button type="button" onclick="checkSubmit('user')"
												class="btn btn-primary btn-block">사원 로그인</button>
										</div>
										<div class="new-account mt-3">
											<p>
												신입사원이신가요? <a class="text-primary"
													href="${contextPath}/user/userInsertForm">회원가입</a>
											</p>
										</div>
									</div>
									<div id="partnerLoginForm" style="display: none;">
										<div class="form-group">
											<label><strong>사업자번호</strong></label> <input id="partner_taxid"
												name="partner_taxid" type="text" class="form-control"
												placeholder="협력회사 사업자번호" onkeyup="checktaxId(this)" maxlength="10">
										</div>
										<div class="form-group">
											<label><strong>ID</strong></label> <input id="partner_id"
												name="partner_id" type="text" class="form-control"
												placeholder="협력회사 ID">
										</div>
										<div class="form-group">
											<label><strong>Password</strong></label> <input
												id="partner_pw" name="partner_pw" type="password"
												class="form-control" placeholder="협력회사 비밀번호">
										</div>
										<div class="text-center">
											<button type="button" onclick="checkSubmit('partner')"
												class="btn btn-primary btn-block">협력화사 로그인</button>
										</div>
										<div class="new-account mt-3">
											<p>
												새로운 협력회사이신가요? <a class="text-primary"
													href="${contextPath}/partner/partnerInsertForm">협력회사 등록신청</a>
											</p>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function checkLoginForm(selected) {
		const userLoginForm = document.getElementById('userLoginForm');
		const partnerLoginForm = document.getElementById('partnerLoginForm');

		if (selected === 'user') {
			userLoginForm.style.display = 'block';
			partnerLoginForm.style.display = 'none';
			document.getElementById('partner').checked = false; // 협력회사 체크 해제
		} else {
			userLoginForm.style.display = 'none';
			partnerLoginForm.style.display = 'block';
			document.getElementById('user').checked = false; // 사용자 체크 해제
		}
	}//end

	function checkSubmit(selected) {
		const form = document.getElementById('loginForm');
		if (selected === 'user') {
			const userId = document.getElementById('user_id').value;
			const userPw = document.getElementById('user_pw').value;

			// Validate user input (optional)
			if (!userId || !userPw) {
				alert("사용자 ID와 비밀번호를 입력하세요.");
				return;
			}

			// Set form action for user login
			form.action = '${contextPath}/login/userLogin'; // Change this to your user login endpoint
			form.method = 'post';
			form.submit();
		} else {
			const partner_taxid = document.getElementById('partner_taxid').value;
			const partnerId = document.getElementById('partner_id').value;
			const partnerPw = document.getElementById('partner_pw').value;

			// Validate partner input (optional)
			if (!partnerId || !partnerPw||!partner_taxid) {
				alert('사업자번호와 협력회사 ID와 비밀번호를 입력하세요.');
				return;
			}

			// Set form action for partner login
			form.action = '${contextPath}/login/partnerLogin';
			form.method = 'post';
			form.submit();
		}
	}//end
	
	function checktaxId(InputNumber) {
		var telNumber = InputNumber.value;
		var length = telNumber.length;
		if (length >= 8) {
			// 숫자만 남기고 제거
			let numbers = telNumber.replace(/[^0-9]/g, "");

			// 정규식을 사용하여 형식화
			let formattedNumber = numbers.replace(
					/([0-9]{3})-?([0-9]{2})-?([0-9]{5})/, `$1-$2-$3`);

			InputNumber.value = formattedNumber;
		}
	} // end checktaxId
	
</script>