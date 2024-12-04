<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@include file="../include/header.jsp"%>

<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12"> <!-- 자간 -->
                <div class="card"> <!-- 흰박스 -->
                    <div class="card-header"> <!-- 흰박스 헤더 -->
                        <h2>전체 자재 조회</h2>
                        <form action="${contextPath}/material/maList" method="get" class="search-form">
                            <input type="text" name="ma_name" placeholder="재료명 검색" value="${param.ma_name}" class="search-input" />
                            <button type="submit" class="search-button">검색</button>
                        </form>
                        <div class="link-container" style="margin-right: 10px;">
                            <a href="${contextPath}/material/maReport" class="link-button">금액현황조회</a>
                            <a href="${contextPath}/out/outList" class="link-button">출고현황조회</a>
                        </div>
                    </div>

                    <div class="col-12">
                        <table class="table">
                            <tr>
                                <th>품목코드</th>
                                <th>분류명</th>
                                <th>재료명</th>
                                <th>원산지</th>
                                <th>재고수량</th>
                                <th>무게</th>
                                <th>단위</th>
                                <th>포장규격</th>
                                <th>단가액</th>
                                <th>총금액</th>
                                <th>사진</th>
                            </tr>

                            <c:forEach var="ma" items="${list}">
                                <tr>
                                    <td>${ma.ma_id}</td>
                                    <td>${ma.ma_category}</td>
                                    <td><a href="maView?ma_id=${ma.ma_id}">${ma.ma_name}</a></td>
                                    <td>${ma.ma_origin}</td>
                                    <td class="ma_stockQuantity">${ma.ma_stockQuantity}</td>
                                    <td class="ma_weight">${ma.ma_weight}</td>
                                    <td>${ma.ma_unit}</td>
                                    <td>${ma.ma_specifications}</td>
                                    <td class="price">${ma.ma_price}</td>
                                    <td class="stockValue">${ma.ma_stockValue}</td>
                                    <td><img src="${ma.attachmentLocation}" 
                                    	style="width: 50px; height: 50px;" /></td>
                                </tr>
                            </c:forEach>
                        </table>
                        
                        <div class="link-left">
						    <a href="${contextPath}/material/maAdd" class="link-button">자재추가</a>
						</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pagination -->
        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="?pageNum=${currentPage - 1}&ma_name=${param.ma_name}">이전</a>
            </c:if>

            <c:forEach var="page" begin="1" end="${totalPages}">
                <c:choose>
                    <c:when test="${page == currentPage}">
                        <strong>${page}</strong>
                    </c:when>
                    <c:otherwise>
                        <a href="?pageNum=${page}&ma_name=${param.ma_name}">${page}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${currentPage < totalPages}">
                <a href="?pageNum=${currentPage + 1}&ma_name=${param.ma_name}">다음</a>
            </c:if>
        </div>

        <%@include file="../include/footer.jsp"%>

        <script>
            $(document).ready(function() {
                // 천 단위 구분 및 원 기호 추가
                function formatCurrency(value) {
                    if ($.isNumeric(value)) {
                        return '₩ ' + Number(value).toLocaleString();
                    }
                    return value;
                }

                // 각 셀에 대해 적용
                $('.price, .stockValue').each(function() {
                    let text = $(this).text();
                    $(this).text(formatCurrency(text));
                });

                // 무게 적용
                $('.ma_weight, .ma_stockQuantity').each(function() {
                    let text = $(this).text();
                    if ($.isNumeric(text)) {
                        $(this).text(Number(text).toLocaleString()); 
                    }
                });
            });
        </script>
    </div>
</div>
</body>
</html>
