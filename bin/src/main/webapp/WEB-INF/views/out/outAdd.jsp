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
        <h2>출고 등록</h2>
    </div>
    
    <form id="outForm" action="${contextPath}/out/outAdd" method="post"> 
      <table class="table">
      	<tr>
      		<td>조달계획번호</td>
      		<td><input type="number" id = "obtain_no" name="obtain_no" placeholder="조달계획번호 선택" required onclick="openoutModal()"></td>
      	</tr>
      	
      	<tr>
      		<td>분류명</td>
      		<td><input type="text" id="ma_category" name="ma_category" placeholder="조달계획번호 선택시 자동입력"></td>
      	</tr>
      	
      	<tr>
      		<td>자재명</td>
      		<td><input type="text" id="ma_name" name="ma_name" placeholder="조달계획번호 선택시 자동입력"></td>
      	</tr>
      	
      	<tr>
      		<td>수량</td>
      		<td><input type="number" name="io_quantity" placeholder="수량 입력" required min="1"></td>
      	</tr>
      	
      	<tr>
      		<td>출고일</td>
      		<td><input type="date" name="io_date" required></td>
      	</tr>
      	
      	<tr>
      		<td>상세내역</td>
      		<td><input type="text" name="io_information" placeholder="상세내역 입력"></td>
      	</tr>
      	
      	<tr>
      		<td>거래명세서 발행여부</td>
      		<td>
                <select name="invoice_issuance_status" required>
             	    <option value="" disabled selected>발행여부 선택</option>
                    <option value="발행">발행</option>
                    <option value="미발행">미발행</option>
                </select>
            </td>
      	</tr>
      	
      </table>              
       
        <input type="hidden" name="io_status" value="출고" readonly>
        <input name="ma_id" id="ma_id" type="hidden">

        <center><input type="submit" value="출고처리"></center>    
    </form>
</div>

<%@ include file="../include/footer.jsp" %>
<jsp:include page="outModal.jsp" />

</html>
