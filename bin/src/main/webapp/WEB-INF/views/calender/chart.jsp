<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container">

        <!-- 품목별 재고 및 총액 차트 -->
        <canvas id="product-stock-chart" style="margin-top: 50px; width:10%; height:30%;"></canvas>

        <!-- 날짜별 전체 재고 총액 차트 -->
        <canvas id="overall-stock-chart" style="margin-top: 50px; width:10%; height:30%;"></canvas>
    </div>

    <script>
        // JSON 데이터는 문자열로 그대로 삽입합니다.
        const productChartData = JSON.parse('${chartData}');
        const overallStockData = JSON.parse('${totalStock}');

        console.log('chartData:', productChartData);
        console.log('totalStock:', overallStockData);

        // 품목별 재고 및 총액 차트 데이터
        const productNames = productChartData.map(item => item.ma_name); // 상품명 추출
        const stockQuantities = productChartData.map(item => item.totalQuantity); // 재고량 추출
        const stockValues = productChartData.map(item => item.totalValue); // 총액 추출

        const ctx1 = document.getElementById('product-stock-chart').getContext('2d');
        
        const data1 = {
            labels: productNames, // 상품명
            datasets: [
                {
                    type: 'bar',
                    label: '각 상품별 재고량',
                    data: stockQuantities, // 각 상품의 재고량
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                },
                {
                    type: 'bar',
                    label: '각 상품별 총액',
                    data: stockValues, // 총액
                    backgroundColor: 'rgba(255, 159, 64, 0.2)',
                    borderColor: 'rgba(255, 159, 64, 1)',
                    borderWidth: 1
                }
            ]
        };

        const options1 = {
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: '재고량 및 총액'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: '상품명'
                    }
                }
            }
        };

        new Chart(ctx1, {
            type: 'bar',
            data: data1,
            options: options1
        });

        // 날짜별 전체 재고 총액 차트
        const ctx2 = document.getElementById('overall-stock-chart').getContext('2d');

        // 날짜 레이블과 총액 데이터를 분리
        const dateLabels = overallStockData.map(item => {
            const date = new Date(item.date);
            return date.toISOString().split('T')[0]; // Format to YYYY-MM-DD
        });
        const stockValuesData = overallStockData.map(item => item.totalValue);

        const data2 = {
            labels: dateLabels, // 날짜 레이블
            datasets: [
                {
                    type: 'line',
                    label: '전체 재고 총액',
                    data: stockValuesData, // 전체 재고의 총액
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 2,
                    fill: false,
                    tension: 0.1
                }
            ]
        };

        const options2 = {
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: '총액'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: '날짜'
                    }
                }
            }
        };

        new Chart(ctx2, {
            type: 'line',
            data: data2,
            options: options2
        });
    </script>
</body>
</html>
