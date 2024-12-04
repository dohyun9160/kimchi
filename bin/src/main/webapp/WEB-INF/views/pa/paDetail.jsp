<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@include file="../include/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<%Map<String, Object> userlogin = (Map<String, Object>) session.getAttribute("userlogin");%>
<script type="text/javascript">
    var email = '<%= session.getAttribute("email") == null ? "" : session.getAttribute("email").toString() %>';
    if (email) {
        alert("진척 검수자에게 일정을 발송했습니다.");
    }
    <% session.removeAttribute("email"); %>
</script>

      <div class="content-body">
         <div class="row">
            <div class="col-lg-12"> <!-- 자간 -->
               <div class="card"> <!-- 흰박스 -->
                  <div class="card-header"> <!-- 흰박스 헤더 -->
                     <h2>발주상세</h2>
                  </div>
                  <div class="card-body"> <!-- 흰박스 박스 -->
                     <table class="key-value-table"> 
                           <tr>
                              <th style="width: 180px;">목록</th>
                           <th style="padding-left: 15px;">내용</th>
                        </tr>
                        <tr>
                            <td>발주번호</td>
                            <td style="padding-left: 15px;">${paVO.codeVo.code_name}</td>
                        </tr>
                        <tr>
                            <td>발주자</td> 
                            <td style="padding-left: 15px;">${paVO.userVO.user_name }</td>
                        </tr>
                        <tr>
                           <td>발주일자</td>
                           <td style="padding-left: 15px;"><fmt:formatDate value="${paVO.pa_issueDate}" pattern="yyyy-MM-dd" /></td>
                        </tr> 
                        <tr>
                           <td>납기일</td>
                           <td style="padding-left: 15px;">${paVO.obtainVo.obtain_deliveryDate}</td>
                        </tr> 
                        <tr>
                            <td>공급업체</td> 
                            <td style="padding-left: 15px;">${paVO.obtainVo.productionVO.contractsVO.partnerVO.partner_companyname}</td>
                        </tr>
                        <tr>
                            <td>품명</td> 
                            <td style="padding-left: 15px;">${paVO.obtainVo.materialVO.ma_name}</td>
                        </tr>
                        <tr>
                            <td>원산지</td> 
                            <td style="padding-left: 15px;">${paVO.obtainVo.materialVO.ma_origin}</td>
                        </tr>
                        <tr>
                            <td>단위</td> 
                            <td style="padding-left: 15px;">${paVO.obtainVo.materialVO.ma_unit}</td>
                        </tr>
                        <tr>
                            <td>규격 및 사양</td> 
                            <td style="padding-left: 15px;">${paVO.obtainVo.materialVO.ma_specifications}</td>
                        </tr>
                        <tr>
                            <td>수량</td> 
                            <td style="padding-left: 15px;">${paVO.obtainVo.obtain_quantity}</td>
                        </tr>
                        <tr>
                            <td>단가</td> 
                            <td style="padding-left: 15px;"><fmt:formatNumber value="${paVO.obtainVo.materialVO.ma_price}" pattern="###,###,###,###" />원</td>
                        </tr>
                        <tr>
                            <td>합계</td> 
                            <td style="padding-left: 15px;"><fmt:formatNumber value="${paVO.obtainVo.materialVO.ma_price * paVO.obtainVo.obtain_quantity}" pattern="###,###,###,###" />원</td>
                         </tr>
                      </table>   
                    </div> 
                </div>
            </div>
             
            <div class="col-lg-12"> <!-- 자간 -->         
               <div class="card"> <!-- 흰박스 -->
                  <div class="card-header"> <!-- 흰박스 헤더 -->
                     <h2>진척계획</h2>
                     <div class="header-buttons">
                        <button onclick="showModal()" class="link-button">추가</button>
                        <form action="/pa/pa" method="post">
                           <input type="hidden" name="pa_no" value="${paVO.pa_no}">
                           <input type="hidden" name="prpFinsh" value="1">
                           <button class="link-button">완료</button>
                        </form>
                     </div>
                  </div>
      
                  <c:forEach var="prpList" items="${prpList}">
                     <div class="card-body">
                        <hr>
                        <table class="right-aligned-table">
                           <tr>
                              <th>검수결과</th>
                              <th>보완내용</th>
                           </tr>
                           <tr>
                              <td><button class="link-button" data-prp_no=${prpList.prp_no } onclick="prpUpdatePop(this)" >작성</button></td>
                              <td><button class="link-button" onclick="mailSend2('${prpList.prp_issueDate}','${prpList.prp_notes}','${paVO.obtainVo.productionVO.contractsVO.partnerVO.partner_email}')">발송</button></td>
                           </tr>
                        </table>
                  
                        <table class="key-value-table">
                           <tr>
                                 <th style="width: 180px;">목록</th>
                              <th style="padding-left: 15px;">내용</th>
                            </tr>
                           <tr>
                              <td>검수일자</td>
                              <td style="padding-left: 15px;">${prpList.prp_issueDate }</td>
                           </tr>
                           <tr>
                              <td>결과 일자</td>
                              <td style="padding-left: 15px;">${prpList.PRP_revisionDate }</td>
                           </tr>
                           <tr>
                              <td>검수자</td>
                              <td style="padding-left: 15px;">${prpList.userVO.user_name }
                                 <i class="fas fa-envelope" 
                                 onclick="mailSend('${prpList.prp_issueDate}','${paVO.obtainVo.productionVO.contractsVO.partnerVO.partner_companyname}','${prpList.userVO.user_email }')" 
                                 style="cursor: pointer;"></i>
                                 <!-- 아이콘으로 대체 
                                 <button onclick="mailSend('${prpList.prp_issueDate}','${paVO.obtainVo.productionVO.contractsVO.partnerVO.partner_companyname}','${prpList.userVO.user_email }')" ></button>
                                 -->
                              </td>
                           </tr>
                           <tr>
                              <td>검수진척도</td>
                              <td style="padding-left: 15px;">${prpList.prp_progress }</td>
                           </tr>
                           <tr>
                              <td>결과 및 보완내용</td>
                              <td style="padding-left: 15px;">${prpList.prp_notes }</td>
                           </tr>
                        </table> 
                     </div>
                  </c:forEach>
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
                  <form onsubmit="return checkForm()">
                     <div class="form-group">
                        <label for="date">검수 일자 : </label> 
                        <input type="date" name="prp_issueDate" id="date" min="" style="width: 170px;margin-left: 0;"> <br/>
                     </div>
                     <div class="form-group">
                        <label for="user_id">검수자</label>
                        <input type="text" value="<%=userlogin.get("user_name")%>" readonly>
                     </div>
                     <div class="form-group">
                        <label for="prp_progress">검수 진행도</label>
                        <input type = "text" name = "prp_progress" value = "0"  readonly>
                        <input type="range" name="range_val" value="0" min="0" max="100"  oninput="showSliderValue(this)" >
                     </div>
                     <div class="form-group">
                        <label for="prp_notes">결과 및 보완내용</label>
                        <textarea id="prp_notes" name="prp_notes" style="margin-left: 0; text-align: left;"></textarea>
                     </div>
         
                       <input type="hidden" name="user_id" id="user_id" value="<%=userlogin.get("user_id")%>" readonly>
                     <input type="hidden" name ="pa_no" id="pa_no" value="${pa_no }"> 
                     <input type="hidden" name="token" value="${token}" />
                     <input type="hidden" name="partner" id="partner" value="${paVO.obtainVo.productionVO.contractsVO.partnerVO.partner_companyname}">
                     <input type="hidden" name="email" id="email" value="${paVO.userVO.user_email }">
                     
                     <div class="modal-footer">
                        <button type="submit" class="link-button" onclick="handleSubmit()">저장</button>
                     </div>
                  </form>
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

</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function handleSubmit() {
   event.preventDefault();
    if(checkForm()){
    insertModal(); 
    }    
}

function insertModal(){
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

function showSliderValue(slider) {
    var value = slider.value;
    document.querySelector('input[name="prp_progress"]').value = value;
}

function receiveData(prp_no, prp_revisionDate, prp_progress, prp_notes, pa_no) {
    $.ajax({              
        type: 'POST',
        url: 'prpUpdate',
        data: {
            prp_no: prp_no,
            prp_revisionDate: prp_revisionDate,
            prp_progress: prp_progress,
            prp_notes: prp_notes,
            pa_no: pa_no
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

function prpUpdatePop(button){
   var prp_no = button.getAttribute("data-prp_no");
   var url = "prpUpdatePop";

   var pa_no = document.getElementById("pa_no").value;
   
   var form = document.createElement("form");
   form.action= url;
   form.method="get";
   form.target="prpUpdatePop";
   
   var input = document.createElement("input");
   input.type = "hidden";
   input.name = "prp_no";
   input.value = prp_no;
   form.appendChild(input);
   
   var inputPa_no = document.createElement("input");
   inputPa_no.type = "hidden";
   inputPa_no.name = "pa_no";
   inputPa_no.value = pa_no;
   form.appendChild(inputPa_no);
   
   window.open('', 'prpUpdatePop', 'width=500,height=450,left=700,top=250');
   
   document.body.appendChild(form);
   form.submit();
}

function showModal() {
   var modal = document.querySelector(".modal");
   modal.style.display ="block";
   
   var close = document.querySelector(".close");
   close.addEventListener("click", function(){
      modal.style.display ="none";
   });
   
}

//날짜 선택 최소(오늘)날짜
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
   }
   return true;
}

function mailSend(date,partner,receivedMail) {
   alert("메일을 전송했습니다.");
    $.ajax({
        type: 'POST',
        url: 'mail',
        data: {
           date : date,
           partner : partner,
           receivedMail : receivedMail
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

function mailSend2(date,notes,receivedMail) {
   alert("메일을 전송했습니다.");
   $.ajax({
        type: 'POST',
        url: 'mail2',
        data: {
           date : date,
           notes : notes,
           receivedMail : receivedMail
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
</script>

<style>

.modal {
 display: none;
 width: 100%;
 height: 100%;
 left: 0;
 top: 0;
 background-color: rgba(0, 0, 0, 0.4); 
}

.modal-content {
   width: 30%;
   height: 55%;
   position: relative;
    top: 20%;
    left: 35%;
}

.modal-footer {
    display: flex;
    justify-content: flex-end; 
    margin-top: 20px; 
}

table {
    border-collapse: collapse;
    width: 100%;
}

.key-value-table thead {
    background-color: #f4f4f4;
}

.key-value-table th {
    padding: 7px;
    text-align: left;
    border-bottom: 2px solid #ddd;
}

.key-value-table td {
    padding: 7px;
    border-bottom: 1px solid #ddd;
}

.key-value-table tbody tr:nth-child(odd) {
    background-color: #f9f9f9;
}

.key-value-table tbody tr:nth-child(even) {
    background-color: #ffffff;
}

.key-value-table td:first-child {
    font-weight: bold;
    background-color: #e0e0e0;
}

.key-value-table td:last-child {
    color: #333;
}
.card{
   width: 50%;
    margin: auto;
    margin-bottom: 20px;
}

.right-aligned-table {
      width: 25%; 
      margin-left: auto;
      margin-right: 0; 
      text-align: center; 
      border-collapse: collapse; 
      margin-bottom: 10px;
}

.right-aligned-table th, .right-aligned-table td {
    padding: 3px; 
    border: 1px solid #339af0; 
}

.right-aligned-table th {
    background-color: #228be6;
    color:#dee2e6;
}
  
hr {
   margin-top: 0rem;
}

.card-header {
    display: flex;
    justify-content: space-between; 
    align-items: center; 
}

.header-buttons {
    display: flex;
    gap: 10px; 
}

.card-header h2 {
    margin: 0; 
}

.card-header form {
    margin: 0; 
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

.link-button {
    padding: 3px 7px; 
    border: none; 
    border-radius: 5px; 
    background-color: #5892d1; 
    color: white; 
    cursor: pointer;
    transition: background-color 0.3s; 
    margin: 0px;
}

.link-button:hover {
    background-color: #0056b3; 
    color: white;
}

.link-button:active {
    transform: scale(0.95); 
    outline: none; 
}
</style>


</html>