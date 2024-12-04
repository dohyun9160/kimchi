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
						<h2>생산계획 목록</h2>
						<hr style="margin-right: 50px;">
						<table class="table">
							<tr>
								<td>생산계획코드</td>
								<td>생산물품명</td>
								<td>생산수량</td>
								<td>생산납기일</td>
								<td>생산계획 상태</td>
								<td>생산계획 담당자</td>
							</tr>
							<c:forEach var="prolist" items="${prolist}">
								<tr
									onclick="location.href='${contextPath}/production/productionSelect?production_no=${prolist.production_no}'"
									style="cursor: pointer;">
									<td>${prolist.production_no}</td>
									<c:forEach var="conlist" items="${conlist }">
										<c:if test="${prolist.contracts_no eq conlist.contracts_no }">
											<c:forEach var="itemlist" items="${itemlist }">
												<c:if test="${conlist.item_no eq itemlist.item_no }">
													<td>${itemlist.item_name}</td>
												</c:if>
											</c:forEach>
										</c:if>
									</c:forEach>
									<td>${prolist.production_quantity}</td>
									<td>${prolist.production_deliveryDate}</td>
									<td>${prolist.production_status}</td>
									<c:forEach var="userlist" items="${userlist }">
										<c:if test="${prolist.user_id eq userlist.user_id }">
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