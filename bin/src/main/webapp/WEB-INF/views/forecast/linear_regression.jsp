<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<link href="<c:url value='${contextPath}/resources/css/mystyle.css'/>" rel='stylesheet' />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
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
</style>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<%@ include file="../include/header.jsp"%>
<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h2>수요예측_직선회귀모형</h2>
                    </div>
                    <hr>
                    <!-- 내용 시작 -->
                    <div class="container">
                    <!-- 요일과 수요관계 -->
                    <canvas id="week_demand_relationship"></canvas>
                    <!-- 분기당 DNR 인플레이션율과 수요관계 -->
                    <canvas id="DNR_Inflation_demand_relationship"></canvas>
                    <!-- BIM 월별 실업률과 수요관계 -->
                    <canvas id="BIM_Unemployment_demand_relationship"></canvas>
                    </div>
                    <script>
                        // y_test와 y_pred를 JSON 형식으로 가져오기
                        const x1 = JSON.parse('${fn:escapeXml(x1)}'); // y_test 데이터를 JSP에서 가져옴
                        const x2 = JSON.parse('${fn:escapeXml(x2)}'); // y_test 데이터를 JSP에서 가져옴
                        const x3 = JSON.parse('${fn:escapeXml(x3)}'); // y_test 데이터를 JSP에서 가져옴
                        const y = JSON.parse('${fn:escapeXml(y)}'); // y_pred 데이터를 JSP에서 가져옴
						
                      //요일과 수요관계
                        const ctx1 = document.getElementById('week_demand_relationship').getContext('2d');
                        const myChart1 = new Chart(ctx1, {
                            type: 'scatter',
                            data: {
                                datasets: [{
                                    label: '요일과 수요관계',
                                    data: x1.map((value, index) => ({ x: value, y: y[index] })),
                                    backgroundColor: 'rgba(255, 99, 132, 0.6)',
                                    pointRadius: 5,
                                    pointHoverRadius: 7
                                }]
                            },
                            options: {
                                plugins: {
                                    title: {
                                        display: true,
                                        text: '요일과 수요관계', // 차트 제목
                                        font: {
                                            size: 24 // 제목 글씨 크기
                                        }
                                    }
                                },
                                scales: {
                                    x: {
                                        title: {
                                            display: true,
                                            text: 'Week'
                                        }
                                    },
                                    y: {
                                        title: {
                                            display: true,
                                            text: 'Demand'
                                        },
                                        beginAtZero: true
                                    }
                                }
                            }
                        });

                        //분기당 DNR 인플레이션율과 수요관계
                        const ctx2 = document.getElementById('DNR_Inflation_demand_relationship').getContext('2d');
                        const myChart2 = new Chart(ctx2, {
                            type: 'scatter',
                            data: {
                                datasets: [{
                                    label: '분기당 DNR 인플레이션율과 수요관계',
                                    data: x2.map((value, index) => ({ x: value, y: y[index] })),
                                    backgroundColor: 'rgba(255, 99, 132, 0.6)',
                                    pointRadius: 5,
                                    pointHoverRadius: 7
                                }]
                            },
                            options: {
                                plugins: {
                                    title: {
                                        display: true,
                                        text: '분기당 DNR 인플레이션율과 수요관계',
                                        font: {
                                            size: 24
                                        }
                                    }
                                },
                                scales: {
                                    x: {
                                        title: {
                                            display: true,
                                            text: 'DNR_Inflation'
                                        }
                                    },
                                    y: {
                                        title: {
                                            display: true,
                                            text: 'Demand'
                                        },
                                        beginAtZero: true
                                    }
                                }
                            }
                        });

                        //BIM 월별 실업률과 수요관계
                        const ctx3 = document.getElementById('BIM_Unemployment_demand_relationship').getContext('2d');
                        const myChart3 = new Chart(ctx3, {
                            type: 'scatter',
                            data: {
                                datasets: [{
                                    label: 'BIM 월별 실업률과 수요관계',
                                    data: x3.map((value, index) => ({ x: value, y: y[index] })),
                                    backgroundColor: 'rgba(255, 99, 132, 0.6)',
                                    pointRadius: 5,
                                    pointHoverRadius: 7
                                }]
                            },
                            options: {
                                plugins: {
                                    title: {
                                        display: true,
                                        text: 'BIM 월별 실업률과 수요관계',
                                        font: {
                                            size: 24
                                        }
                                    }
                                },
                                scales: {
                                    x: {
                                        title: {
                                            display: true,
                                            text: 'BIM_Unemployment'
                                        }
                                    },
                                    y: {
                                        title: {
                                            display: true,
                                            text: 'Demand'
                                        },
                                        beginAtZero: true
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
