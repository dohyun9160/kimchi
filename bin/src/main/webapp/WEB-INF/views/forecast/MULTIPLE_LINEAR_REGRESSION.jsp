<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<link href="<c:url value='${contextPath}/resources/css/mystyle.css'/>"
	rel='stylesheet' />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<%@ include file="../include/header.jsp"%>
<div class="content-body">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<h2>수요예측_다중선형회귀모형</h2>
					</div>
					<hr>
					<!-- 내용 시작 -->
					<div class="container">
						<div class="categoria">
						</div>
						<div class="charts">
							<canvas id="myChart" width="400" height="200"></canvas>
						</div>
						<!-- MSE와 RMSE 출력 -->
						<div class="results">
							<p>
								평균 제곱 오차 (MSE): <span id="mseValue"><c:out value="${mse}" /></span>
							</p>
							<p>
								제곱근 평균 제곱 오차 (RMSE): <span id="rmseValue"><c:out value="${rmse}" /></span>
							</p>
						</div>
					</div>
					<script>
					 // y_test와 y_pred를 JSON 형식으로 가져오기
                    const y_test = JSON.parse('${fn:escapeXml(y_test)}'); // y_test 데이터를 JSP에서 가져옴
                    const y_pred = JSON.parse('${fn:escapeXml(y_pred)}'); // y_pred 데이터를 JSP에서 가져옴

                    const ctx = document.getElementById('myChart').getContext('2d');
                    const myChart = new Chart(ctx, {
                        type: 'scatter',
                        data: {
                            datasets: [{
                                label: 'MULTIPLE_LINEAR_REGRESSION',
                                data: y_test.map((value, index) => ({ x: value, y: y_pred[index] })), // y_test를 x좌표로, y_pred를 y좌표로 설정
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
