<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link href="<c:url value="${contextPath}/resources/css/mystyle.css"/>"
	rel='stylesheet' />
<script>
function checkApproval(user_approval, user_id) {
    $.ajax({
        type: 'POST',
        url: 'userApproval', // 요청할 URL
        data: {
            user_id: user_id,
            user_approval: user_approval
        },
        success: function(response) {
            // 페이지 새로고침
            location.reload();
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("서버 오류:", textStatus, errorThrown);//콘솔에 오류
        }
    });
}
</script>
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
						<h2>사원 목록</h2>
						<form action="?pageNum=1" method="get" class="search-form">
							<input type="text" name="user_name" placeholder="사원명 검색"
								value="${param.user_name}" class="search-input" />
							<button type="submit" class="search-button">검색</button>
						</form>
					</div>
					<hr>
					<div class="col-12" style="margin-left: 20px;">
						<table class="table">
							<tr>
								<td>사원명</td>
								<td>사원 email</td>
								<td>사원 전화번호</td>
								<td>사원 부서</td>
								<td>사원 승인여부</td>
							</tr>
							<c:forEach var="userlist" items="${userlist}">
								<tr>
									<td><a
										href="${contextPath}/user/userSelect?user_id=${userlist.user_id}">${userlist.user_name }</a></td>
									<td>${userlist.user_email }</td>
									<td>${userlist.user_number }</td>
									<td>${userlist.user_department }</td>
									<c:if test="${userlist.user_approval eq 0 }">
										<td><button class="addbutton" type="button"
												onclick="checkApproval(${userlist.user_approval}, '${userlist.user_id }')">승인부여</button></td>
									</c:if>
									<c:if test="${userlist.user_approval eq 1 }">
										<td><button class="addbutton" type="button"
												onclick="checkApproval(${userlist.user_approval}, '${userlist.user_id }')">승인부여해제</button></td>
									</c:if>
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