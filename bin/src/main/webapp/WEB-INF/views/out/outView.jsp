<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>

<%@include file="../include/header.jsp"%>



<div class="content-body">

    <table class="table"> <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
        <tr>
            <th>출고코드</th>
            <th>분류명</th>
            <th>자재명</th>
            <th>수량</th>
            <th>단가</th>
            <th>출고일</th>
            <th>상세내역</th>
            <th>거래명세서발행여부</th>
        </tr>

	    <tr>
	        <td>${out.io_id}</td>
	        <td>${out.ma_category}</td>
	        <td>${out.ma_name}</td>
	        <td>${out.io_quantity}</td>
	        <td class="price">${out.ma_price}</td>
	        <td>${out.io_date}</td>
	        <td>${out.io_information}</td>
	        <td>${out.invoice_issuance_status}</td>
	        <td colspan="8"></td>
	    </tr>
    </table>
	    <div class="link-container">
	    	<a href="${contextPath}/out/outList" class="link-button">목록</a></td> 
	    </div>
</div>

<%@include file="../include/footer.jsp"%>

<script>
	
	$(document).ready(function() {
        $('.price').each(function() { // 가격 포맷팅
            let text = $(this).text();
            if ($.isNumeric(text)) { // 숫자에 천 단위 구분기호 추가
                $(this).text('₩ ' + Number(text).toLocaleString());
            }
        });
    }); 
</script>
