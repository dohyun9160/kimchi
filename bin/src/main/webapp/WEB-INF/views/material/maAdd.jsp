<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../include/header.jsp" %>

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

<html>
<div class="content-body">
    <div style="margin-left: 20px;">
        <h2> 자재 추가 </h2>
    </div>
    
    <form id="materialForm" action="${contextPath}/material/maAdd" method="post"> 
        <table class="table">
            <tr>
                <td>품목코드</td>
                <td><input type="number" name="ma_id" placeholder="상품코드 입력" required></td>
            </tr>
            
            <tr>
                <td>분류명</td>
                 <td> <select name="ma_category" required>
                	 <option value="" disabled selected>분류 선택</option>
                     <option value="주재료">주재료</option>
                     <option value="부재료">부재료</option>
                     <option value="향신료">향신료</option>
                     <option value="조미료">조미료</option>
                     <option value="부자재">부자재</option>
               </td>

            <tr>
                <td>자재명</td>
                <td><input type="text" name="ma_name" placeholder="자재명" required></td>              
            </tr>
            
            <tr>
                <td>원산지</td>
                <td> <select name="ma_origin" required>
               		 <option value="" disabled selected>원산지 선택</option>
                     <option value="국내산">국내산</option>
                     <option value="칠레산">칠레산</option>
                     <option value="미국산">미국산</option>
                     <option value="중국산">중국산</option>
               </td>
               
            </tr>
            
            <tr>
                <td>유통기한</td>
                <td><input type="date" name="ma_expiryDate" required></td>
            </tr>
            
            <tr>
                <td>자재수량</td>
                <td><input type="number" name="ma_stockQuantity" min="0" placeholder="자재의 수량을 숫자로만 입력" required></td>
            </tr>
            
            <tr>
                <td>무게</td>
                <td><input type="text" name="ma_weight" placeholder="숫자만 입력하시오"></td>
            </tr>
            
            <tr>
                <td>단위</td>               
                 <td> <select name="ma_unit" required>
                	 <option value="" disabled selected>단위 선택</option>
                     <option value="kg">kg</option>
                     <option value="L">L</option>
                     <option value="톤">톤</option>
               </td>
            
            <tr>
                <td>포장규격</td>

                <td> <select name="ma_specifications" required>
                	 <option value="" disabled selected>포장 선택</option>
                     <option value="박스">박스</option>
                     <option value="포대">포대</option>
                     <option value="비닐 봉투">비닐 봉투</option>
                     <option value="알류미늄 포장">알류미늄 포장</option>
                     <option value="진공 포장지">진공 포장지</option>
                     <option value="플라스틱 용기">플라스틱 용기</option>
                     <option value="유리병">유리병</option>                 
               </td>
            </tr>
            
            <tr>
                <td>가용재고량</td>
                <td><input type="number" name="ma_availableStock" placeholder="예약 및 출고대기 제외 입력"></td>
            </tr>
            
            <tr>
                <td>기본재고량 </td>
                <td><input type="number" name="ma_basicStock" placeholder="최소 유지 수량 입력"></td>
            </tr>
            
            <tr>
                <td>단가액</td>
                <td><input type="number" name="ma_price" step="0.01" min="0" required></td>
            </tr>
            
            <tr>
                <td>총금액</td>
                <td><input type="number" name="ma_stockValue" readonly></td>
            </tr>
            
            <tr>
                <td>보관위치</td>
                <td> <select name="ma_storage" required>
                	 <option value="" disabled selected>보관위치 선택</option>
                     <option value="냉장창고">냉장창고</option>
                     <option value="냉동창고">냉동창고</option>
                     <option value="물류창고">물류창고</option>
               </td>
            </tr>
            
            <tr>
                <td> 추가일</td>
                <td><input type="date" name="ma_date"></td>
            </tr>
            
            <tr>
                <td>첨부파일번호</td>
                <td><input type="number" name="attachment_no"></td>
            </tr>            
        </table>
        
        <center><input type="submit" value="추가완료"></center>
    </form>
</div>

<%@ include file="../include/footer.jsp" %>

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
</script>

</html>
