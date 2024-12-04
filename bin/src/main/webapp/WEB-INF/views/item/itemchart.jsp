<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!--없으면 차트 안됨-->
</head>
<body>
	<!-- 차트크기결정  -->
	<div class="container">
		<!-- 품목별 계약량 및 계약금액차트 -->
		<canvas id="item-contracts-chart" style="margin-top: 50px; width: 10%; height: 30%;"></canvas>
	</div>
	
	<script>
        // JSON 데이터는 문자열로 그대로 삽입합니다.
        const chartData = JSON.parse('${chartData}');
        console.log('chartData:', chartData);

        // x축과 y축 데이터 준비
        const labels = chartData.map(item => item.item_name);
        const totalcon_quantity = chartData.map(item => item.totalcon_quantity);
        const totalcon_price = chartData.map(item => item.totalcon_price);

        // 차트 생성
        const ctx = document.getElementById('item-contracts-chart').getContext('2d');
        const myChart = new Chart(ctx, {
            type: 'bar', // 기본 차트 타입을 막대 그래프로 설정
            data: {
                labels: labels,
                datasets: [
                    {
                        label: '계약량',
                        data: totalcon_quantity,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1,
                        yAxisID: 'y-axis-quantity', // 왼쪽 y축
                    },
                    {
                        label: '계약금액',
                        data: totalcon_price,
                        type: 'line', // 선 그래프
                        borderColor: 'rgba(255, 99, 132, 1)',
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        fill: false,
                        yAxisID: 'y-axis-price', // 오른쪽 y축
                    }
                ]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        position: 'left',
                        id: 'y-axis-quantity', // 왼쪽 y축
                    },
                    'y-axis-price': {
                        beginAtZero: true,
                        position: 'right', // 오른쪽 y축
                        grid: {
                            drawOnChartArea: false // 오른쪽 y축의 그리드 라인 숨기기
                        }
                    },
                    x: {
                        title: '품목명'
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'top',
                    }
                }
            }
        });
    </script>
</body>
</html>