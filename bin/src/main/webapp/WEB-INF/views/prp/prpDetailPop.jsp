<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="content-body">
<%Map<String, Object> userlogin = (Map<String, Object>) session.getAttribute("userlogin");%>
	
		<input type="hidden" name="prp_no" id="prp_no" value="${prpVO.prp_no}">
		<input type="hidden" name="pa_no" id="pa_no" value="${prpVO.pa_no}">

		<h2>진척검수결과</h2>
		<div class="form-group">
			 <label class="label">계획 검수 일자 </label>
			 <input type="text" readonly id ="prp_issueDate" value="${prpVO.prp_issueDate }" style="width: 150px;"><br/> 
		</div>
		<div class="form-group">
			 <label class="label">결과 작성 일자  </label>
			 <input type="text" name="prp_revisionDate" id="now" readonly value="" style="width: 150px;"> 
		</div>
		<div class="form-group">
			<label class="label">검수자</label>
			<input type="text" value="<%=userlogin.get("user_name")%>" readonly style="width: 150px;"> 
			<input type="hidden" name ="user_id" value="<%=userlogin.get("user_id")%>" readonly> 
		</div>
		<div class="form-group">
			<label class="label">검수 진행도</label>
			<input type = "text" name = "prp_progress" id="prp_progress" value = "0" style="width: 150px;">
			<input type="range" name="range_val" value="0" min="0" max="100"  oninput="showSliderValue(this)" >
		</div>
		<div class="form-group">
			<label class="label">결과 및 보완내용</label>
			<textarea id="prp_notes" name="prp_notes" value="${prpVO.prp_notes}"></textarea>
		</div>
		
		<button onclick="sendData()">저장</button>
</div>

    </div>
    
    <!-- Required vendors -->
    <script src="${contextPath}/resources/vendor/global/global.min.js"></script>
    <script src="${contextPath}/resources/js/quixnav-init.js"></script>
    <script src="${contextPath}/resources/js/custom.min.js"></script>

    <script src="${contextPath}/resources/vendor/highlightjs/highlight.pack.min.js"></script>
    <!-- Circle progress -->

</body>
 <script>
 // dateTime의 시간 제거
document.addEventListener("DOMContentLoaded", function() {
    var dateTimeValue = document.getElementById('prp_issueDate').value;
    var dateOnly = dateTimeValue.split(' ')[0];
    document.getElementById('prp_issueDate').value = dateOnly;
    

    function formatDate(date) {
           const year = date.getFullYear();
           const month = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
           const day = String(date.getDate()).padStart(2, '0');
           return year +"-" + month + "-" +day;
       }
    
    var now = new Date();
    document.getElementById("now").value = formatDate(now);
});

function showSliderValue(slider) {
    var value = slider.value;
    document.querySelector('input[name="prp_progress"]').value = value;
}

//부모창으로 데이터 전송
function sendData() {
    const prp_no = document.getElementById("prp_no").value;
   
    const prp_revisionDate = document.getElementById("now").value;
    
    const prp_progress = document.getElementById("prp_progress").value;

    const prp_notes = document.getElementById("prp_notes").value;

    const pa_no = document.getElementById("pa_no").value;
    
    window.opener.receiveData(prp_no, prp_revisionDate, prp_progress, prp_notes, pa_no);
    
    window.close();
}
 
</script>
<style>

    .form-group {
        margin-bottom: 15px; /* 각 입력 필드 그룹 사이의 간격 조절 */
        display: flex;
        align-items: center; /* 수직 중앙 정렬 */
    }

    .label {
        display: inline-block;
        width: 150px; /* 레이블의 폭을 통일 */
        font-weight: bold;
        margin-right: 10px; /* 레이블과 입력 필드 사이의 간격 */
        white-space: nowrap; /* 텍스트가 줄바꿈되지 않도록 설정 */
    }

    input[type="text"] {
        padding: 5px; /* 입력 필드 내부 여백 */
        border: 1px solid #ccc; /* 테두리 색상 */
        border-radius: 4px; /* 테두리의 둥근 모서리 */
        width:300px;
    }
    
   hr {
    height: 1px;
    background-color: #dbe4ff; 
}

button {
    float: right; /* 버튼을 오른쪽으로 배치 */
    padding: 10px 20px;
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

.form-group textarea {
    width: 65%;
    height: 150px; 
    padding: 10px;
    box-sizing: border-box;
    resize: none; 
}

</style> 

</html>