<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@include file="../include/header.jsp" %>

<style>
    .content-body form input, 
    .content-body form select {
        margin-bottom: 4px; /* 입력 필드 간의 간격 조정 */
        padding: 8px; /* 패딩 추가 */
        width: 70%; 
        margin: 0 auto; /* 수평 가운데 정렬 */
        display: block; /* 블록 요소로 설정 */
        box-sizing: border-box; /* 패딩과 테두리를 포함한 너비 조정 */
    }
</style>

<div class="content-body">
    <div style="margin-left: 20px;">
        <h2> 자재 정보 수정 </h2>
    </div>
    <form action="${contextPath}/material/maUpdate" method="post"> 
    
        <table class="table">
    <tr>        
        <td>분류명 </td>
        <td> <select name="ma_category" required>
        <option value="" disabled selected>분류 선택</option>
        <option value="주재료">주재료</option>
        <option value="부재료">부재료</option>
        <option value="향신료">향신료</option>
        <option value="조미료">조미료</option>
        <option value="부자재">부자재</option>
               </td>
    </tr>
    
    <tr>
        <td>재료명</td>
        <td><input type="text" name="ma_name" value="${ma.ma_name}"></td>
    </tr>
    
    <tr>
        <td>원산지</td>
        <td><input type="text" name="ma_origin" value="${ma.ma_origin}" readOnly></td>
    </tr>
    
    <tr>
        <td>유통기한</td>
        <td><input type="date" name="ma_expiryDate" value="${ma.ma_expiryDate}" readOnly></td>
    </tr>
    
    <tr>
        <td>재고수량</td>
        <td><input type="number" name="ma_stockQuantity" value="${ma.ma_stockQuantity}" id="ma_stockQuantity"></td>
    </tr>
    
    <tr>
        <td>무게</td>
        <td><input type="text" name="ma_weight" value="${ma.ma_weight}"></td>
    </tr>
    
    <tr>
        <td>단위</td>
        <td><input type="text" name="ma_unit" value="${ma.ma_unit}" readOnly></td>
    </tr>
    
    <tr>
        <td>포장규격</td>
        <td><input type="text" name="ma_specifications" value="${ma.ma_specifications}" readOnly></td>
    </tr>
    
    <tr>
        <td>가용재고량</td>
        <td><input type="number" name="ma_availableStock" value="${ma.ma_availableStock}" readOnly></td>
    </tr>
    
    <tr>
        <td>기본재고량</td>
        <td><input type="number" name="ma_basicStock" value="${ma.ma_basicStock}" readOnly></td>
    </tr>
    
    <tr>
        <td>단가액</td>
        <td><input type="number" name="ma_price" value="${ma.ma_price}" id="ma_price"></td>
    </tr>
    
    <tr>
        <td>총금액</td>
        <td><input type="number" name="ma_stockValue" value="${ma.ma_stockValue}" readOnly id="ma_stockValue"></td>
    </tr>
    
    <tr>
        <td>보관위치</td>
        <td> <select name="ma_storage" required> 
                    <option value="" disabled selected>보관위치를 선택</option>
                     <option value="냉장창고">냉장창고</option>
                     <option value="냉동창고">냉동창고</option>
                     <option value="물류창고">물류창고</option>
               </td>
    </tr>
    
    <tr>
        <td>수정일</td>
        <td><input type="date" name="ma_update" id="ma_update"></td>
    </tr>
    
    <tr>
        <td>첨부파일번호</td>
        <td><input type="number" name="attachment_no" value="${ma.attachment_no}"></td>
    </tr>
    <td><input type="hidden" name="ma_id" id="ma_id" value="${ma.ma_id}"></td>
</table>


        <center><input type="submit" value="수정완료"></center>
    </form>
</div>

<%@include file="../include/footer.jsp"%>

<script>
    // 재고 총액 계산
    function calStockValue() {
        var quantity = parseFloat(document.querySelector('input[name="ma_stockQuantity"]').value) || 0; // 재고 수량 값 없으면 0
        var price = parseFloat(document.querySelector('input[name="ma_price"]').value) || 0; // 가격 값 없으면 0
        document.querySelector('input[name="ma_stockValue"]').value = quantity * price; // 총액
    }

    // 재고 수량 입력 필드 입력 -> 총액 갱신
    document.querySelector('input[name="ma_stockQuantity"]').addEventListener('input', calStockValue);
    // 가격 입력 필드 입력 -> 총액 갱신
    document.querySelector('input[name="ma_price"]').addEventListener('input', calStockValue);
    
    // 날짜 고정
    // 페이지가 로드될 때 현재 날짜를 수정일 입력 필드에 설정
    window.onload = function() {
    var today = new Date();
    var day = String(today.getDate()).padStart(2, '0');
    var month = String(today.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작
    var year = today.getFullYear();
    var currentDate = year + '-' + month + '-' + day; // YYYY-MM-DD 형식
    document.getElementById('ma_date').value = currentDate;
};
</script>

</html>
