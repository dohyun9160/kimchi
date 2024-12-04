<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@include file="../include/header.jsp" %>

       
   <div class="content-body">
	   <div class="container-fluid">
		   <div class="row">
			   <div class="col-lg-12"> <!-- 자간 -->
				   <div class="card"> <!-- 흰박스 -->
					   <div class="card-header"> <!-- 흰박스 헤더 -->
						   <div class="header-title">
						        <h3>협력사 출하준비</h3><br/>
						    </div>
						    <div class="header-button">
						        <button class="link-button" onclick="showModal()">추가</button>
						    </div>
						</div>
					    <div class="card-body"> <!-- 흰박스 박스 -->
							<table class="table table-responsive-sm">
								<tr>
									<th>협력회사</th>	
									<th>발주번호</th>	
									<th>출하검수일</th>
									<th>비고</th>
								</tr>
								<c:forEach var = "pcsp"  items="${list }" >
								<tr>
									<td>(주)삼김신조유</td>
									<td>${pcsp.code_name }</td>
									<td>${pcsp.pcsp_date }</td>
									<td>${pcsp.pcsp_notes }</td>
								</tr>
								</c:forEach>
							</table>  
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<!-- modal 진척검수계획 작성 -->
	<div class ="modal">
		<div class="modal-content">
			<div class="modal-header">
			<h2>출하준비</h2>
			<span class = "close">&times;</span>
			</div>
			<div class="modal-body">
			    <form action="/pcsp" method="post" onsubmit="return checkForm()">
			        <div class="form-group">
			            <label for="date" style="font-size: 15px; text-align: left;">검수 일자</label>
			            <input type="date" name="pcsp_date" id="date" min="" style="width: 170px; margin-left: 0;">
			        </div>
			        <div class="form-group">
			            <label for="code" style="font-size: 15px; text-align: left;">발주번호</label>
			            <input type="text" name="code_name" id="code">
			        </div>
			        <div class="form-group">
			            <label for="partner" style="font-size: 15px; text-align: left;">협력회사</label>
			            <input type="text"  value="(주)삼김신조유" readonly>
			        </div>
			        <div class="form-group">
			            <label for="pcsp_notes" style="font-size: 15px;, text-align: left;"></label>
			            <textarea name="pcsp_notes" id="pcsp_notes" style="text-align: left; margin-left: 5px; " placeholder="비고"></textarea>
			        </div>
					<input type="hidden" name="token" value="${token}" />
					<input type="hidden" name="partner_taxid" value="${partner_taxid}" />
					<div class="modal-footer">
						<button class="link-button">저장</button>
					</div>
			    </form>
			</div>
		</div>
	</div>
	    
   </div>


<%@include file="../include/footer.jsp" %>
    </div>
    
    <!-- Required vendors -->
    <script src="${contextPath}/resources/vendor/global/global.min.js"></script>
    <script src="${contextPath}/resources/js/quixnav-init.js"></script>
    <script src="${contextPath}/resources/js/custom.min.js"></script>

    <script src="${contextPath}/resources/vendor/highlightjs/highlight.pack.min.js"></script>
    <!-- Circle progress -->

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function showModal(button) {
	var modal = document.querySelector(".modal");
	modal.style.display ="block";
	
	var close = document.querySelector(".close");
	close.addEventListener("click", function(){
		modal.style.display ="none";
	});
}


$(document).ready(function(){today();});
function today() {
	var now = new Date();
 	var year = now.getFullYear();
 	var month = now.getMonth() + 1;
 	var day = now.getDate();
 	
 	if (month < 10) month = '0' + month;
       if (day < 10) day = '0' + day;
 	
 	var formatToday = year + "-" + month + "-" + day;
 	console.log(formatToday);
	document.getElementById("date").setAttribute("min",formatToday);
}

function checkForm() {
	if(!date.value){
		alert("날짜를 선택해주세요.")
		return false;
	}else if(!code.value){
		alert("발주코드를 입력해주세요")
		return false;
	}
}
</script>



<style>

.header-title {
    padding: 10px;
}
.header-button{
 margin-top: auto;
}

.link-button {
    display: inline-block; 
    padding: 7px 7px; 
    border: none; 
    border-radius: 5px; 
    background-color: #5892d1; /* 버튼 배경색 */
    color: white; /* 글자색 */
    cursor: pointer;
    transition: background-color 0.3s; /* 배경색 전환 효과 */
}

.link-button:hover {
    background-color: #0056b3; /* 호버 시 배경색 변경 */
    color: white; /* 글자색을 흰색으로 유지 */
}

.link-button:active {
    transform: scale(0.95); 
    outline: none; /* 기본 아웃라인 제거 */
}

.modal {
 display: none;
 width: 100%;
 height: 100%;
 left: 0;
 top: 0;
 background-color: rgba(0, 0, 0, 0.4); /* 반투명 배경 */
 
 
}

.modal-content {
	width: 30%;
	height: 55%;
	position: relative;
    top: 20%;
    left: 40%;
}

.modal-footer {
    display: flex;
    justify-content: flex-end; /* 버튼을 오른쪽으로 정렬 */
    margin-top: 20px; /* 버튼과 폼 그룹 사이의 간격 */
}


.form-group label {
    width: 110px; /* 레이블의 너비 */
    margin-right: 15px; /* 레이블과 입력 필드 사이의 간격 */
    font-weight: bold; /* 레이블 텍스트 굵게 */
    flex-shrink: 0; /* 레이블이 줄어들지 않도록 설정 */
    
}
.form-group input[type="date"]{
	width: 100px;
}

.form-group input[type="text"],
.form-group input[type="date"]{
    padding: 3px; /* 입력 필드의 내부 여백 */
    box-sizing: border-box; /* 패딩과 테두리가 전체 너비에 포함되도록 설정 */
}

.form-group input[type="text"] {
    margin-right: 30px; /* 입력 필드와 범위 슬라이더 사이의 간격을 넓힘 */
}

.form-group textarea {
    width: 70%; /* 부모 요소에 맞춰 너비를 100%로 설정 */
    height: 150px; /* 고정된 높이 설정 */
    padding: 10px;
    box-sizing: border-box;
    resize: none; /* 사용자가 크기 조절을 못하도록 설정 */
}


</style>	
	
	


</html>