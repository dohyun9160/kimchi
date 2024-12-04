<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<link href="<c:url value='${contextPath}/resources/css/mystyle.css'/>" rel='stylesheet' />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
/* 전체 컨테이너 스타일 */
.container {
    display: flex; /* Flexbox 사용 */
    justify-content: center; /* 가운데 정렬 */
    flex-wrap: nowrap; /* 줄 바꿈을 하지 않도록 설정 */
}

/* 차트 크기 조정 */
canvas {
    width: 30%; /* 각 캔버스가 전체 폭의 30% 차지 */
    height: 400px; /* 차트 높이 */
    margin: 40px; /* 캔버스 간격 조정 (기존보다 넓게 설정) */
    max-width: 440px; /* 최대 폭 설정 */
}
.results {
    display: flex; /* Flexbox 사용 */
    justify-content: center; /* 가운데 정렬 */
    flex-wrap: nowrap; /* 줄 바꿈을 하지 않도록 설정 */
    margin-top: 20px; /* 캔버스와 결과 사이의 간격 조정 */
}

.results div {
    text-align: center; /* 텍스트 가운데 정렬 */
    margin: 0 100px; /* 각 결과 간의 간격 조정 */
}

</style>
<%@ include file="../include/header.jsp"%>
<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h2>수요예측_앙상블 모델</h2>
                    </div>
                    <hr>
                    <!-- 내용 시작 -->
                    <div class="container">
	                    <!-- 의식결정트리 -->
	                    <canvas id="tree"></canvas>
	                    
	                    <!-- 랜덤포레스트 -->
	                    <canvas id="forest"></canvas>
                    </div>
                    <div class="results">
	                    <!-- MSE와 RMSE 출력 -->
	                    <div class="results_tree">
	                        <p>평균 제곱 오차 (MSE): <c:out value="${mse2}"/></p>
	                        <p>제곱근 평균 제곱 오차 (RMSE): <c:out value="${rmse2}"/></p>
	                    </div>
	                    <div class="results_forest">
	                        <p>평균 제곱 오차 (MSE): <c:out value="${mse3}"/></p>
	                        <p>제곱근 평균 제곱 오차 (RMSE): <c:out value="${rmse3}"/></p>
	                    </div>
                    </div>
                    <script>
                        // y_test와 y_pred를 JSON 형식으로 가져오기
                        const y2_test = JSON.parse('${fn:escapeXml(y2_test)}'); // y_test 데이터를 JSP에서 가져옴
                        const y2_pred = JSON.parse('${fn:escapeXml(y2_pred)}'); // y_pred 데이터를 JSP에서 가져옴
                        const y3_test = JSON.parse('${fn:escapeXml(y3_test)}'); // y_test 데이터를 JSP에서 가져옴
                        const y3_pred = JSON.parse('${fn:escapeXml(y3_pred)}'); // y_pred 데이터를 JSP에서 가져옴

                        const ctx1 = document.getElementById('tree').getContext('2d');
                        const myChart1 = new Chart(ctx1, {
                            type: 'scatter',
                            data: {
                                datasets: [{
                                    label: '의사결정트리',
                                    data: y2_test.map((value, index) => ({ x: value, y: y2_pred[index] })), // y_test를 x좌표로, y_pred를 y좌표로 설정
                                    backgroundColor: 'rgba(255, 99, 132, 0.6)', // 빨간색, 투명도 60%
                                    pointRadius: 5, // 점의 크기 설정
                                    pointHoverRadius: 7 // 마우스 오버 시 점의 크기 설정
                                }]
                            },
                            options: {
                                scales: {
                                    x: {
                                        title: {
                                            display: true,
                                            text: 'Actual Values (y_test)' // x축 레이블
                                        }
                                    },
                                    y: {
                                        title: {
                                            display: true,
                                            text: 'Predicted Values (y_pred)' // y축 레이블
                                        },
                                        beginAtZero: true // y축이 0에서 시작하도록 설정
                                    }
                                }
                            }
                        });
                        
                        const ctx2 = document.getElementById('forest').getContext('2d');
                        const myChart2 = new Chart(ctx2, {
                            type: 'scatter',
                            data: {
                                datasets: [{
                                    label: '랜덤 포레스트',
                                    data: y3_test.map((value, index) => ({ x: value, y: y3_pred[index] })), // y_test를 x좌표로, y_pred를 y좌표로 설정
                                    backgroundColor: 'rgba(255, 99, 132, 0.6)', // 빨간색, 투명도 60%
                                    pointRadius: 5, // 점의 크기 설정
                                    pointHoverRadius: 7 // 마우스 오버 시 점의 크기 설정
                                }]
                            },
                            options: {
                                scales: {
                                    x: {
                                        title: {
                                            display: true,
                                            text: 'Actual Values (y_test)' // x축 레이블
                                        }
                                    },
                                    y: {
                                        title: {
                                            display: true,
                                            text: 'Predicted Values (y_pred)' // y축 레이블
                                        },
                                        beginAtZero: true // y축이 0에서 시작하도록 설정
                                    }
                                }
                            }
                        });
                        
                        
                    </script>
                    <!-- 내용 끝 -->
                    
                    
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp"%>
