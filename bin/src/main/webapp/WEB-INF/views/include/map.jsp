<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<title>Map</title>
<style>
/* 지도 스타일 설정 */
#map {
	width: 80%;
	height: 400px;
	margin: 0 auto; /* 지도 가운데 정렬 */
}

.transport-title {
	margin-top: 30px; /* 위쪽 마진 */
    margin-left: 80px; /* 왼쪽 마진 */
}

.transport-info {
	margin-top: 20px;
	margin-left: 170px; /* 왼쪽 마진*/
}

.home-button {
	margin-left: 500px; /* 왼쪽 마진 */
	margin-top: 60px; /* 위쪽 마진 */
	padding: 7px 7px; /* 버튼 패딩 */
	background-color: #007bff; /* 버튼 배경색 */
	color: white; /* 글자색 */
	border: none; /* 테두리 없음 */
	border-radius: 5px; /* 모서리 둥글게 */
	cursor: pointer; /* 커서 모양 변경 */
	text-decoration: none; /* 밑줄 제거 */
}

.home-button:hover {
	background-color: #0056b3; /* 호버 시 배경색 변경 */
}
</style>
</head>
<body>

	<div class="content-wrapper">
		<section class="content">
			<div>
				<h3 class="transport-title">찾아오시는 길:</h3>
			</div>
			<div id="map"></div>
			<div class="transport-info">
				<h4>교통편 안내</h4>
				<p>버스: 135, 310, 311, 7202, 737 92. 이용 시 수원역정류장에서 하차</p>
				<p>지하철: 1호선 및 수인분당선 이용시 수원역 13번 출구로 나와 바로 앞</p>
				<p>네비: 경기도 수원시 팔달구 덕영대로 899</p>
			</div>
			<br>
			<a href="${contextPath}/#" class="home-button">홈으로 돌아가기</a>
			<!-- 홈 버튼 추가 -->
		</section>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c614178d1fae98b4419dee460d620fe"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.2681527488647, 127.000312407984), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var iwContent = '<div style="padding:5px;">3KIMSHINJOYOU</div>', // 인포윈도우에 표출될 내용
		iwPosition = new kakao.maps.LatLng(37.2681527488647, 127.000312407984), // 인포윈도우 표시 위치
		iwRemoveable = true; // 인포윈도우를 닫을 수 있는 x버튼 표시

		// 인포윈도우를 생성하고 지도에 표시합니다
		var infowindow = new kakao.maps.InfoWindow({
			map : map, // 인포윈도우가 표시될 지도
			position : iwPosition,
			content : iwContent,
			removable : iwRemoveable
		});
	</script>

</body>
</html>
