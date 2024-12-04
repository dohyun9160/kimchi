<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@include file="../include/header.jsp" %>

<%Map<String, Object> userlogin = (Map<String, Object>) session.getAttribute("userlogin");%>
<script type="text/javascript">
    var email = '<%= session.getAttribute("email") == null ? "" : session.getAttribute("email").toString() %>';
    if (email) {
        alert("진척 검수자에게 일정을 발송했습니다.");
    }
    <% session.removeAttribute("email"); %>
</script>
  
		<div class="content-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12"> <!-- 자간 -->
						<div class="card"> <!-- 흰박스 -->
							<div class="card-header"> <!-- 흰박스 헤더 -->
								<div>
									<h3>구매발주</h3>
								</div>	
								<div class="button-group">
									<button class="ca-button" data-status="99" onclick="checkStatus(99)">전체</button>
									<button class="ca-button" data-status="0" onclick="checkStatus(0)">미수립</button>
									<button class="ca-button" data-status="1" onclick="checkStatus(1)">진행중</button>
									<button class="ca-button" data-status="2" onclick="checkStatus(2)">완료</button>
								</div>
							</div>
						<div class="card-body"> <!-- 흰박스 박스 -->
							<table class="table table-responsive-sm"> <!-- 테이블 정렬 -->
								<tr>
									<th>번호</th>	
									<th>발주번호</th>	
									<th>발주일자</th>
									<th>납기일자</th>
									<th>거래처명</th>
									<th>품목명</th>
									<th>금액</th>
									<th>발주자</th>
									<th>검수계획수립</th>
									<th>비고</th>
									<th>인쇄</th>
									<th>진척검수</th>
								</tr>
								<c:forEach var="paList" items="${paPageList.povoList}" varStatus="status">
									<tr>
										<td>${status.count + (paPageList.pageVO.pageNum-1) * paPageList.pageVO.listcnt }</td>
										<td><a href="#" onclick="submitForm(${paList.pa_no})">${paList.codeVo.code_name}</a></td>
										<td><fmt:formatDate value="${paList.pa_issueDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${paList.obtainVo.obtain_deliveryDate}</td>
										<td>${paList.obtainVo.productionVO.contractsVO.partnerVO.partner_companyname}</td>
										<td>${paList.obtainVo.materialVO.ma_name}</td>
										<td><fmt:formatNumber value="${paList.obtainVo.materialVO.ma_price * paList.obtainVo.obtain_quantity}" pattern="###,###,###,###" />원</td>				
										<td>${paList.userVO.user_name }</td>
										<td>
											<c:choose>
												<c:when test="${paList.pa_checkStatus == 0}">
													미수립
												</c:when>
												<c:when test="${paList.pa_checkStatus == 1}">
													진행중
												</c:when>
												<c:when test="${paList.pa_checkStatus == 2}">
													완료
												</c:when>		
												<c:otherwise>
													잘못된 정보입니다.
												</c:otherwise>		
												</c:choose>
										</td>
										<td>${paList.pa_notes}</td>
										<td><button class="link-button" data-pa-no="${paList.pa_no}" id="pop" onclick=" printPop(this)">인쇄</button></td>
										<td><button class="link-button" data-pa_no = "${paList.pa_no}" data-partner="${paList.obtainVo.productionVO.contractsVO.partnerVO.partner_companyname}" 
											data-email = "${paList.userVO.user_email }"
											onclick="showModal(this)">계획수립</button></td>
										
									</tr>
							</c:forEach>
						</table> 
						</div> 
					</div> 
				</div> 
			</div> 
			
			<!-- modal 진척검수계획 작성 -->
			<div class ="modal">
				<div class="modal-content">
					<div class="modal-header">
						<h2>진척검수</h2>
						<span class = "close">&times;</span>
					</div>
					<div class="modal-body">
					    <form id="modalForm" onsubmit="return checkForm()">
					        <div class="form-group">
					            <label for="date" style="font-size: 15px; text-align: left;">검수 일자:</label>
					            <input type="date" name="prp_issueDate" id="date" min="" style="width: 170px; margin-left: 0;">
					        </div>
					        <div class="form-group">
					            <label for="user_id" style="font-size: 15px; text-align: left;">검수자:</label>
					            <input type="text" value="<%=userlogin.get("user_name")%>" readonly>
					        </div>
					        <div class="form-group">
					            <label for="prp_progress" style="font-size: 15px; text-align: left;">검수 진행도:</label>
					            <input type="text" name="prp_progress" value="0" readonly>
					            <input type="range" name="range_val" value="0" min="0" max="100" oninput="showSliderValue(this)">
					        </div>
					        <div class="form-group">
					            <label for="prp_notes" style="font-size: 15px;, text-align: left;">비고:</label>
					            <textarea name="prp_notes" id="prp_notes" style="margin-left: 0; text-align: left;"></textarea>
					        </div>
					        <input type="hidden" name="user_id" id="user_id" value="<%=userlogin.get("user_id")%>" readonly>
					        <input type="hidden" name="pa_no" id="pa_no">
					        <input type="hidden" name="token" value="${token}">
					        <input type="hidden" id="partner" name="partner">
					        <input type="hidden" id="email" name="email">
					        <div class="modal-footer">
			                    <button type="submit" class="link-button" onclick="handleSubmit(event)">저장</button>
			                </div>
					    </form>
					</div>
				</div>
			</div>
			
			<!-- 페이징 작업 -->
			<div class="pagination">
				<ul>
					<c:if test="${paPageList.pageVO.prev}">
						<li class="paginate_button"><a href="1">START</a></li>
					</c:if>
					<c:if test="${paPageList.pageVO.pageNum != 1}">
						<li class="paginate_button"><a href="${paPageList.pageVO.pageNum -1}">&lt;</a></li>
					</c:if>
					<c:forEach var="num" begin="${paPageList.pageVO.startPage}" end="${paPageList.pageVO.endPage}">
						<li class="paginate_button ${paPageList.pageVO.pageNum == num ? 'active' : '' }"><a href="${num}">${num}</a></li>
					</c:forEach>
					<c:if test="${paPageList.pageVO.pageNum != paPageList.pageVO.total}">
						<li class="paginate_button"><a href="${paPageList.pageVO.pageNum +1}"> &gt;</a></li>
					</c:if>
					<c:if test="${paPageList.pageVO.next}">
						<li class="paginate_button"><a href="${paPageList.pageVO.total}">END</a></li>
					</c:if>
				</ul>
			</div>		
			    
			<form id="actionForm" action="/pa/pa" method="post">
				<input type="hidden" name="pageNum" value="${poPageList.pageVO.pageNum }">
				<input type="hidden" name="pa_checkStatus" id="pa_checkStatus" value="${param.pa_checkStatus}">
			</form>	    
			</div>
		</div>
		
		<%@include file="../include/footer.jsp" %>
	</div>
		    
	<!-- Required vendors -->
	<script src="${contextPath}/resources/vendor/global/global.min.js"></script>
	<script src="${contextPath}/resources/js/quixnav-init.js"></script>
	<script src="${contextPath}/resources/js/custom.min.js"></script>
	<script src="${contextPath}/resources/vendor/highlightjs/highlight.pack.min.js"></script>

</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function handleSubmit(evnet) {
	event.preventDefault();
    if(checkForm()){
	insertPrp(); 
    }    
}

function insertPrp() {
	const formData = {
        prp_issueDate: $('#date').val(),
        prp_progress: $('input[name="prp_progress"]').val(),
        prp_notes: $('#prp_notes').val(),
        user_id: $('#user_id').val(),
        pa_no: $('#pa_no').val(),
        token: $('input[name="token"]').val(),
        partner: $('#partner').val(),
        email: $('#email').val()
    };
	
	$.ajax({
        type: 'POST',
        url: 'modal',
        data: formData,
        success: function(response) {
            // 페이지 새로고침
            location.reload();
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("서버 오류:", textStatus, errorThrown);
        }
    });
}


function showModal(button) {
	var modal = document.querySelector(".modal");
	modal.style.display ="block";
	
	var close = document.querySelector(".close");
	close.addEventListener("click", function(){
		modal.style.display ="none";
	});
	
	var pa_no = button.getAttribute("data-pa_no");
	document.getElementById("pa_no").value = pa_no;
	
	var partner = button.getAttribute("data-partner");
	document.getElementById("partner").value = partner;

	var email = button.getAttribute("data-email");
	document.getElementById("email").value = email;
	
}

$(document).ready(function(){
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		var actionForm = $('#actionForm');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		var paCheckStatus = $("#pa_checkStatus").val();
		actionForm.find("input[name='pa_checkStatus']").val(paCheckStatus);
		actionForm.submit();
	});
});

function printPop(button) {
    var paNo = button.getAttribute('data-pa-no');

    var url = 'printPop';

    var form = document.createElement('form');
    form.method = 'POST';
    form.action = url;
    form.target = '구매발주 인쇄';

    var input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'pa_no';
    input.value = paNo;

    form.appendChild(input);

    var popup = window.open(url, '구매발주 인쇄', 'width=1000,height=800,left=440,top=125,scrollbars=yes');

    document.body.appendChild(form);
    form.submit();
}

function showSliderValue(slider) {
    var value = slider.value;
    document.querySelector('input[name="prp_progress"]').value = value;
}


// paDetail로 이동
function submitForm(pa_no) {
    var url = 'paDetail';

    var form = document.createElement('form');
    form.method = 'POST';
    form.action = url;

    var input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'pa_no'; 
    input.value = pa_no;

    form.appendChild(input);

    document.body.appendChild(form);
    form.submit();
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
	if(!document.getElementById("date").value){
		alert("날짜를 선택해주세요.")
		return false;
	}
	 return true;
}

// 페이징 색상처리
$(document).ready(function() {
	var initialPaCheckStatus = "${pa_checkStatus}";

    $(".ca-button").each(function() {
        var buttonStatus = $(this).data("status");

        if (buttonStatus == initialPaCheckStatus) {
            $(this).addClass("active-ca-button"); // 상태에 맞는 클래스를 추가
        } else {
            $(this).removeClass("active-ca-button"); // 상태에 맞지 않는 클래스를 제거
        }
    });
	
	
	$(".pagination a").on("click", function(e) {
        e.preventDefault();
        var actionForm = $('#actionForm');
        var pageNum = $(this).attr("href");

        // 페이지 버튼의 active 클래스 제거
        $(".pagination a").removeClass("active");

        // 클릭한 페이지 버튼에 active 클래스 추가
        $(this).addClass("active");

        actionForm.find("input[name='pageNum']").val(pageNum);
        actionForm.submit();
    });

    // 페이지 로딩 시 현재 페이지 번호에 active 클래스 추가
    var currentPage = "${paPageList.pageVO.pageNum}";
    $(".pagination a[href='" + currentPage + "']").addClass("active");
});

function checkStatus(pa_checkStatus){
	var url = '/pa/pa';
	
	var form = document.createElement('form');
	form.method = 'POST';
	form.action = url;
	
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'pa_checkStatus'; 
	input.value = pa_checkStatus;
	
	form.appendChild(input);
	
	document.body.appendChild(form);
	form.submit();
}

</script>

<style>

li{
display : inline;
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
	height: 53%;
	position: relative;
    top: 20%;
    left: 35%;
}

.modal-footer {
    display: flex;
    justify-content: flex-end; 
    margin-top: 20px; 
}

.pagination {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

.pagination a, .pagination strong {
    margin: 0 5px; 
    text-decoration: none; 
    color: #07020d; 
    padding: 10px 15px; 
    border-radius: 5px; 
    transition: background-color 0.3s, color 0.3s; 
}

.pagination a {
    background-color: #f0f0f0; 
    border: 1px solid #ddd; 
}

.pagination a:hover {
    background-color: #007bff; 
    color: white; 
    text-decoration: underline; 
}

.pagination strong {
    background-color: #007bff; 
    color: white; 
    padding: 10px 15px; 
    border-radius: 5px; 
}

.pagination .active a {
    background-color: #007bff; 
    color: white; 
    border: 1px solid #007bff; 
}


.link-button {
    display: inline-block; 
    padding: 7px 7px; 
    border: none; 
    border-radius: 5px; 
    background-color: #5892d1; 
    color: white; 
    cursor: pointer;
    transition: background-color 0.3s; 
}

.link-button:hover {
    background-color: #0056b3; 
    color: white; 
}

.link-button:active {
    transform: scale(0.95); 
    outline: none; 
}

.button-group {
    display: flex;
     gap: 5px; 
	}
	
.card-header {
   display: flex;
   flex-direction: column; 
   align-items: flex-start; 
   gap: 10px; 
   padding: 10px; 
   background-color: #f5f5f5; 
}
	
.ca-button {
    display: inline-block; 
    padding: 3px 15px; 
    border: 2px solid #adb5bd; 
    border-radius: 3px; 
    background-color: #ffffff; 
    color: #868e96; 
    font-size: 16px; 
    font-weight: bold;
    text-align: center; 
    text-decoration: none; 
    cursor: pointer; 
    transition: background-color 0.3s, color 0.3s, border-color 0.3s; 
}

.ca-button:hover {
    background-color: #007bff; 
    color: #ffffff; 
    border-color: #007bff; 
}

.ca-button:active {
    transform: scale(0.95); 
    outline: none; 
}

.active-ca-button {
    background-color: #007bff; 
    color: white; 
    border-color: #007bff; 
}

.modal-body {
    padding: 20px; 
}

.form-group {
    display: flex; 
    align-items: center; 
    margin-bottom: 15px; 
}

.form-group label {
    width: 110px; 
    margin-right: 15px; 
    font-weight: bold; 
    flex-shrink: 0; 
    
}
.form-group input[type="date"]{
	width: 100px;
}

.form-group input[type="text"],
.form-group input[type="date"],
.form-group input[type="range"] {
    padding: 3px; 
    box-sizing: border-box; 
}

.form-group input[type="text"] {
    margin-right: 30px; 
    
}

.form-group input[type="range"] {
    margin-top: 5px; 
}

.form-group textarea {
    width: 100%; 
    height: 150px; 
    padding: 10px;
    box-sizing: border-box;
    resize: none; 
}
	
</style>	
	
</html>