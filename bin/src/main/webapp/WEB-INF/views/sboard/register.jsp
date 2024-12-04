<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@include file="../include/header.jsp"%>

<div class="content-body">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<h4 class="text-center mb-4">게 시 판</h4>
			</div>
			<div class="card-body">
				<div class="form-validation">
					<form role="form" method="post">
						<div class="box-body">
							<div class="form-group form-group row">
								<label class="col-lg-2 col-form-label" for="exampleInputEmail">Title</label>
								<div class="col-lg-5">
									<input type="text" name='board_title'
										class="form-control input-default" placeholder="Enter Title">
								</div>
							</div>
							<div class="form-group form-group row">
								<label class="col-lg-2 col-form-label"
									for="exampleInputPassword1">Content</label>
								<textarea class="from-control" name="board_content" rows="12"
									cols="80" placeholder=""Enter ..."></textarea>
							</div>
							<div class="form-group form-group row">
								<label class="col-lg-2 col-form-label" for="exampleInputEmail1">Comment</label>
								<div class="col-lg-4">
									<input type="text" name="board_comment" class="form-control" placeholder="Enter Writer" cols="3">
								</div>
							</div>
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
						<div>
						<input name="user_id" id = "user_id" value="${userlogin.user_id }" type="hidden">
						<input name="attachment_no" id = "attachment_no"  type="hidden">
						</div>
					</form>
				</div>
				<%-- form-validation --%>
			</div>
			<%-- card-body --%>
		</div>
		<%-- card --%>
	</div>
	<%-- col-lg-12 --%>
</div>
<%@include file="../include/footer.jsp"%>