<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"> <!-- 문자셋 설정 -->
</head>
<body>
<h2>총수량 + 합계</h2>
<canvas id="inventoryChart" width="400" height="200"></canvas>

<h3 id="totalPriceDisplay"></h3> <!-- 총합계액을 표시할 요소 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- 차트 사용 필수요소 -->
<script>
    var totalQuantity = ${ma_totalQuantity}; // JSP EL을 통해 값 가져오기
    var totalPrice = ${totalPrice + ma.totalValue}; // 총합계액 계산

    // 총합계액을 포맷팅
    var formattedTotalPrice = new Intl.NumberFormat('ko-KR', {
        style: 'currency',
        currency: 'KRW'
    }).format(totalPrice);

    // 포맷팅된 총합계액을 HTML에 삽입
    document.getElementById('totalPriceDisplay').innerText = '총 합계액: ' + formattedTotalPrice;

    var ctx = document.getElementById('inventoryChart').getContext('2d');
    var inventoryChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['총 재고 수량', '총 합계액'], // 차트 레이블
            datasets: [{
                label: '재고 데이터',
                data: [totalQuantity, totalPrice],
                backgroundColor: [
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(255, 99, 132, 0.2)'
                ],
                borderColor: [
                    'rgba(75, 192, 192, 1)',
                    'rgba(255, 99, 132, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</body>
</html>
