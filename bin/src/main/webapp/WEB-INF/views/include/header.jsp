<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>kimchi</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${contextPath}/resources/images/favicon.ico">
<link href="${contextPath}/resources/css/style.css" rel="stylesheet">
<link href="<c:url value="${contextPath}/resources/css/mystyle.css"/>" rel='stylesheet' />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="sk-three-bounce">
			<div class="sk-child sk-bounce1"></div>
			<div class="sk-child sk-bounce2"></div>
			<div class="sk-child sk-bounce3"></div>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<a href="/" class="brand-logo"> <img class="logo-abbr"
				src="${contextPath}/resources/images/navlog.png" alt=""> <img
				class="logo-compact"
				src="${contextPath}/resources/images/logo-text.png" alt=""> <!-- 이미지 조정-->
				<img class="brand-title" src="${contextPath}/resources/images/headerlog.png" style="width: 200px; height: auto;">
			</a>
			<div class="nav-control">
				<div class="hamburger">
					<span class="line"></span><span class="line"></span><span
						class="line"></span>
				</div>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content">
				<nav class="navbar navbar-expand">
					<div class="collapse navbar-collapse justify-content-between">
						<div class="header-left"></div>
						<ul class="navbar-nav header-right">
							<c:choose>
								<c:when test="${userlogin != null}">
									<li class="nav-item dropdown header-profile"><a href="#"
										class="dropdown-item"> <i class="icon icon-single-04"></i>
											<span class="ml-2">${userlogin.user_department}_${userlogin.user_name}님</span></a>
										<a href="${contextPath}/login/logout" class="dropdown-item">
											<i class="icon-key"></i> <span class="ml-2">Logout </span>
									</a>
										<div class="dropdown-menu dropdown-menu-right"></div></li>
								</c:when>
								<c:when test="${partlogin !=null }">
									<li class="nav-item dropdown header-profile"><a href="#"
										class="dropdown-item"> <i class="icon icon-single-04"></i>
											<span class="ml-2">협력회사_${partlogin.partner_companyname}님</span></a> <a
										href="${contextPath}/login/logout" class="dropdown-item">
											<i class="icon-key"></i> <span class="ml-2">Logout </span>
									</a>
										<div class="dropdown-menu dropdown-menu-right"></div></li>
								</c:when>
							</c:choose>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<%@include file="./nav.jsp"%>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<!-- 내용넣는 곳 -->