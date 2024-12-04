<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

		<div class="content-body">
			<div class="row">
				<div class="col-lg-12"> <!-- 자간 -->
					<div class="card"> <!-- 흰박스 -->
						<div class="card-header"> <!-- 흰박스 헤더 -->
							<h3>조달계획 목록</h3>
						</div>	
						<div class="card-body"> <!-- 흰박스 박스 -->
							<table class="table table-responsive-sm">
								<tr>
									<td>조달계획 번호</td>
									<td>협력회사</td>
									<td>조달계획물품</td>
									<td>단가</td>
									<td>조달량</td>
									<td>조달가격</td>
									<td>조달계획납기일</td>
									<td>조달계획등록일</td>
									<td>담당자</td>
									<td>구매발주서 등록</td>
								</tr>
								<c:forEach var="oblist" items="${oblist}">
									<tr>
										<td>${oblist.obtain_no}</td>
										<td>${oblist.partnerVO.partner_companyname}</td>
										<td>${oblist.materialVO.ma_name}</td>
										<td><fmt:formatNumber value="${oblist.materialVO.ma_price}" pattern="#,###,###,###" />원</td>
										<td>${oblist.obtain_quantity}</td>
										<td><fmt:formatNumber value="${oblist.obtain_quantity * oblist.materialVO.ma_price}" pattern="#,###,###,###" />원</td>
										<td>${oblist.obtain_deliveryDate}</td>
										<td><fmt:formatDate value="${oblist.obtain_registrationDate}" pattern="yyyy-MM-dd" /></td>
										<td>${oblist.userVO.user_name}</td>
										<td><button data-obtain_no="${oblist.obtain_no}" onclick="obPaPop(this)">등록</button></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
				
		<%@include file="../include/footer.jsp"%>
	</div>
</body>

<!-- Required vendors -->
<script src="${contextPath}/resources/vendor/global/global.min.js"></script>
<script src="${contextPath}/resources/js/quixnav-init.js"></script>
<script src="${contextPath}/resources/js/custom.min.js"></script>
<script src="${contextPath}/resources/vendor/highlightjs/highlight.pack.min.js"></script>

<script>
function receiveData(pa_referenceNo,user_id,pa_issueDate,code,obtain_no,notes) {
	$.ajax({
        type: 'POST',
        url: 'paInsert',
        data: {
        	pa_referenceNo : pa_referenceNo,
        	user_id : user_id,
          	pa_issueDate : pa_issueDate,
           	code : code,
            obtain_no : obtain_no,
            notes : notes
            
        },
        success: function(response) {
            // 페이지 새로고침
            location.reload();
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("서버 오류:", textStatus, errorThrown);
        }
    });
}

function obPaPop(button){
	var obtain_no = button.getAttribute("data-obtain_no");
	var url = "/obPaPop";

	var form = document.createElement("form");
	form.action= url;
	form.method="get";
	form.target="paObPop";
	
	var input = document.createElement("input");
	input.type = "hidden";
	input.name = "obtain_no";
	input.value = obtain_no;
	form.appendChild(input);
	
	window.open('', 'paObPop', 'width=500,height=600,left=700,top=250');
	
	document.body.appendChild(form);
	form.submit();
}
   
</script>
    
<style>

li{
display : inline;
}

button {
    padding: 7px 7px;
    font-size: 16px;
    border: none;
    border-radius: 4px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

</style>	