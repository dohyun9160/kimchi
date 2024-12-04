<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<div class="content-body">
	 <%Map<String, Object> userlogin = (Map<String, Object>) session.getAttribute("userlogin");%>
	 
    <h2>구매발주서 등록</h2>
    <hr>
    <div class="form-group">
        <label class="label">조달계획코드</label>
        <input type="text" name="obtain_no" id="obtain_no" value="${obtain.obtain_no}" readonly>
    </div>
    <div class="form-group">
        <label class="label">조달계획 자재명</label>
        <input type="text" value="${ma.ma_name}" readonly>
    </div>
    <div class="form-group">
        <label class="label">조달계획 자재단가</label>
        <input type="text" value="${ma.ma_price}" readonly>
    </div>
    <div class="form-group">
        <label class="label">조달계획 자재조달량</label>
        <input type="text" value="${obtain.obtain_quantity}" readonly>
    </div>
    <div class="form-group">
        <label class="label">조달계획 금액</label>
        <input type="text" value="${obtain.obtain_quantity * ma.ma_price}" readonly>
    </div>
    <div class="form-group">
        <label class="label">조달계획납기일</label>
        <input type="text" value="${obtain.obtain_deliveryDate}" readonly>
    </div>
    <div class="form-group">
        <label class="label">구매발주자</label>
        <input type="text" 
        value="<%=userlogin.get("user_name")%>" readonly>
    </div>
    <div class="form-group">
        <label class="label">비고</label>
        <textarea id="notes"></textarea>
    </div>
        <input type="hidden" name="user_id" id="user_id" 
        value="<%=userlogin.get("user_id")%>" readonly>
    <input type="hidden" name="pa_issueDate" id="pa_issueDate" readonly>                
    <input type="hidden" name="code" id="code" readonly>        
    <hr>        
    <button onclick="sendData()">저장</button>
</div>
    
    <!-- Required vendors -->
    <script src="${contextPath}/resources/vendor/global/global.min.js"></script>
    <script src="${contextPath}/resources/js/quixnav-init.js"></script>
    <script src="${contextPath}/resources/js/custom.min.js"></script>

    <script src="${contextPath}/resources/vendor/highlightjs/highlight.pack.min.js"></script>
    <!-- Circle progress -->

</body>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', formatDate);
document.addEventListener('DOMContentLoaded', code);

function formatDate() {
	const today = new Date();
	const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0'); 
    const day = String(today.getDate()).padStart(2, '0');
    const hours = String(today.getHours()).padStart(2, '0');
    const minutes = String(today.getMinutes()).padStart(2, '0');
    const seconds = String(today.getSeconds()).padStart(2, '0');
    document.getElementById("pa_issueDate").value = year+"-"+month+"-"+day+" " +hours + ":" +minutes + ":" + seconds  ;
    
}
//임시코드 발행
function code() {
	const today = new Date();
	const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0'); 
    const day = String(today.getDate()).padStart(2, '0');
    const hours = String(today.getHours()).padStart(2, '0');
    const minutes = String(today.getMinutes()).padStart(2, '0');
    const seconds = String(today.getSeconds()).padStart(2, '0');
    
    document.getElementById("code").value = year+hours+seconds+minutes +day + month  ;
}




function sendData() {
    const pa_referenceNo = document.getElementById("obtain_no").value;
    const user_id = document.getElementById("user_id").value;
    const pa_issueDate = document.getElementById("pa_issueDate").value;
    const code = document.getElementById("code").value;
    const obtain_no = document.getElementById("obtain_no").value;
    const notes = document.getElementById("notes").value;
    
    if (!pa_referenceNo || !user_id || !pa_issueDate || !code || !obtain_no) {
        alert('잘못된 정보가 있습니다. 조달계획을 확인해주세요');
        return; 
    }
    
    window.opener.receiveData(pa_referenceNo,user_id,pa_issueDate,code,obtain_no,notes);
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