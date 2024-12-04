<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link href="<c:url value="${contextPath}/resources/css/mystyle.css"/>"
	rel='stylesheet' />
<%@include file="../include/header.jsp"%>
<div class="content-body">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<!-- 자간 -->
				<div class="card">
					<!-- 흰박스 -->
					<div class="card-header">
						<!-- 흰박스 헤더 -->
					</div>
					<div class="col-12" style="margin-left: 20px;">
						<h2>계약 목록</h2>
						<hr style="margin-right: 50px;">
						<table class="table">
							<tr>
								<td>계약코드</td>
								<td>계약물품코드</td>
								<td>계약수량</td>
								<td>계약가격</td>
								<td>계약납기일</td>
								<td>계약상태</td>
								<td>계약협력회사</td>
								<td>계약담당자</td>
							</tr>
							<c:forEach var="conlist" items="${conlist}">
								<tr
									onclick="location.href='${contextPath}/contracts/contractsSelect?contracts_no=${conlist.contracts_no}'"
									style="cursor: pointer;">
									<td>${conlist.contracts_no}</td>
									<c:forEach var="itemlist" items="${itemlist }">
										<c:if test="${conlist.item_no eq itemlist.item_no }">
											<td>${itemlist.item_name}</td>
										</c:if>
									</c:forEach>
									<td>${conlist.contracts_quantity}</td>
									<td>${conlist.contracts_price}</td>
									<td>${conlist.contracts_deliveryDate}</td>
									<td>${conlist.contracts_status}</td>
									<td>${conlist.partner_taxid}</td>
									<c:forEach var="userlist" items="${userlist }">
										<c:if test="${conlist.user_id eq userlist.user_id }">
											<td>${userlist.user_name}</td>
										</c:if>
									</c:forEach>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- Pagination -->
		<%@include file="../include/paging.jsp"%>
	</div>
</div>
<%@include file="../include/footer.jsp"%>