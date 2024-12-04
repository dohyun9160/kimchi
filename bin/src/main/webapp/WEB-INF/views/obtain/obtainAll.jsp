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
						<h2>조달계획 목록</h2>
					</div>
						<hr>
					<div class="col-12" style="margin-left: 20px;">
						<table class="table">
							<tr>
								<td>조달계획코드</td>
								<td>조달계획물품</td>
								<td>조달량</td>
								<td>조달가격</td>
								<td>조달계획납기일</td>
								<td>조달계획상태</td>
								<td>조달계획협력회사</td>
								<td>담당자</td>
							</tr>
							<c:forEach var="oblist" items="${oblist}">
								<tr
									onclick="location.href='${contextPath}/obtain/obtainSelect?obtain_no=${oblist.obtain_no}'"
									style="cursor: pointer;">
									<td>${oblist.obtain_no}</td>
									<c:forEach var="malist" items="${malist }">
										<c:if test="${oblist.ma_id eq malist.ma_id }">
											<td>${malist.ma_name}</td>
										</c:if>
									</c:forEach>
									<td>${oblist.obtain_quantity}</td>
									<td>${oblist.obtain_price}</td>
									<td>${oblist.obtain_deliveryDate}</td>
									<td>${oblist.obtain_status}</td>
									<td>${oblist.partner_taxid}</td>
									<c:forEach var="userlist" items="${userlist }">
										<c:if test="${oblist.user_id eq userlist.user_id }">
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