<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<%@page import="java.util.List"%>
<%@page import="com.kr.kimchi.vo.CalenderVO"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../include/header.jsp"%>

<style>
/* 차트 */
.container {
    display: flex;

    margin-left: 400px !important;
    margin-top: 50px !important; 
    min-height: 1100px;
    min-width: 1450px !important;
}

.charts {
    display: flex;
    flex-direction: column; /* 세로 정렬 */
    flex: 1; /* 차트가 캘린더의 왼쪽에 위치 */
    margin-top: 50px; /* 차트의 위쪽 여백 */
    margin-left: auto; /* 차트의 왼쪽 여백 */
}

.calendar {
    flex: auto; /* 캘린더의 크기 조정 */
    margin-top: auto;
    margin-bottom: auto;
    margin-left: 110px !important;
    margin-top: 135px; /* 차트의 위쪽 여백 */
}

/* 차트 크기 조정 */
#product-stock-chart, 
#overall-stock-chart, 
#in-stock-chart,
#out-stock-chart
{
    width: 100%; /* 차트 폭을 부모 요소에 맞춤 */
    height: 400px; /* 차트 높이 */
    margin-bottom: 10px; /* 차트 간격 */
}

canvas {
    max-width: 440px; 
    height: auto; 
}

/* 캘린더 높이 조정 */
.content-body {
    height: 900px; /* 캘린더와 차트의 높이를 동일하게 설정 */
    display: flex;
    align-items: stretch; /* 자식 요소의 높이를 동일하게 설정 */
    margin-left: 30px !important;
}

.fc-toolbar h2 {
 margin-left: 15px !important;
 margin-right: 15px !important;

}

.fc {
   margin-bottom: 200px;
}

#product-stock-chart, #overall-stock-chart #in-stock-chart, #out-stock-chart {
    margin-bottom: 40px !important;
}

/* 캘린더 */
.fc-event-time{
   display : none;
}

.fc-event-title{
   font-size : 12px;
}
.fc-event,
.fc-event-draggable,
.fc-event-resizable,
.fc-event-start,
.fc-event-end,
.fc-event-today,
.fc-daygrid-event,
.fc-daygrid-dot-event {
    padding: 2px;
}
</style>

<!-- 캘린더 -->
<script src='${contextPath}/resources/calender/index.global.js'></script>
<script> 
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var today = new Date();
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
        initialDate: today,
        navLinks: true, 
        editable: true,
        dayMaxEvents: true, 
        events: [
            <c:forEach var="vo" items="${list}" varStatus="status">
            {
                title: '${vo.partner_companyname} 검수일',
                start: '${vo.prp_issueDate}T00:00:00', 
                color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
            }
            <c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ]
    });
    console.log(calendar.getEvents()); 
    calendar.render();
});
</script>

<!-- 캘린더 및 차트 div-->
<div class="container">
    <div class="charts">
        <!-- 품목별 재고 및 총액 차트 -->
        <canvas id="product-stock-chart"></canvas>
        <!-- 날짜별 전체 재고 총액 차트 -->
        <canvas id="overall-stock-chart"></canvas>
        <canvas id="in-stock-chart"></canvas>
        <canvas id="out-stock-chart"></canvas>
    </div>

    <div class="calendar" style="margin-left: 10px;">
            <div id='calendar'></div>
        </div>
    </div>

<!-- 차트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // JSON 데이터는 문자열로 그대로 삽입합니다.
    const productChartData = JSON.parse('${chartData}');
    const overallStockData = JSON.parse('${totalStock}');
    const inStockData = JSON.parse('${inChart}');
    const outStockData = JSON.parse('${outChart}');

    console.log('chartData:', productChartData);
    console.log('totalStock:', overallStockData);
    console.log('inStockData:', inStockData);
    console.log('outStockData:', outStockData);
    
    const productNames = productChartData.map(item => item.ma_name);
    const stockQuantities = productChartData.map(item => item.totalQuantity);
    const stockValues = productChartData.map(item => item.totalValue);

    // 품목별 재고 및 총액 차트 데이터
    const ctx1 = document.getElementById('product-stock-chart').getContext('2d');
    
    const data1 = {
        labels: productNames,
        datasets: [
            {
                type: 'bar',
                label: '각 상품별 재고량',
                data: stockQuantities,
                backgroundColor: '#4bc0c0',
                borderColor: '#4bc0c0', 
                borderWidth: 1,
                yAxisID: 'y',
            },
            {
                type: 'bar',
                label: '각 상품별 총액',
                data: stockValues,
                backgroundColor: '#ff9f40', 
                borderColor: '#ff9f40', 
                borderWidth: 2,
                yAxisID: 'y1', 
                fill: false,
            }
        ]
    };

    const options1 = {
        scales: {
            y: {
                type: 'linear',
                position: 'left',
                title: {
                    display: true,
                    text: '총액'
                }
            },
            y1: {
                type: 'linear',
                position: 'right',
                title: {
                    display: true,
                    text: '재고량'
                },
                grid: {
                    drawOnChartArea: false // 그리드 숨기기
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
        data: data1,
        options: options1
    });

    // 날짜별 전체 재고 총액 차트
    const ctx2 = document.getElementById('overall-stock-chart').getContext('2d');

    const dateLabels = overallStockData.map(item => {
        const date = new Date(item.date);
        return date.toISOString().split('T')[0];
    });
    const stockValuesData = overallStockData.map(item => item.totalValue);

    const data2 = {
        labels: dateLabels,
        datasets: [
            {
                type: 'line',
                label: '전체 재고 총액',
                data: stockValuesData,
                borderColor: '#f50509', 
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
    

    
    // 입고 수량 차트
    const ctx3 = document.getElementById('in-stock-chart').getContext('2d');

    const inProductNames = inStockData.map(item => item.ma_name);
    const inQuantities = inStockData.map(item => item.io_quantity);
    const inValues = inStockData.map(item => item.inValue);
    
    console.log('입고 총액 데이터:', inValues);

    const data3 = {
        labels: inProductNames, 
        datasets: [
            {
                type: 'bar',
                label: '각 상품별 입고량',
                data: inQuantities,
                backgroundColor: '#c0ebb5', 
                borderColor: '#c0ebb5', 
                borderWidth: 1,
                yAxisID: 'y', // 입고량에 대한 y축
            },
            {
                type: 'bar',
                label: '입고 총액',
                data: inValues,
                backgroundColor: '#e4eb31', 
                borderColor: '#e4eb31', 
                borderWidth: 2,
                yAxisID: 'y1', // 입고 총액에 대한 y축
                fill: false,
            }
        ]
    };

    const options3 = {
        scales: {
            y: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: '입고량'
                }
            },
            y1: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: '입고 총액'
                },
                position: 'right',
                grid: {
                    drawOnChartArea: false // 그리드 숨기기
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

    new Chart(ctx3, {
        type: 'bar',
        data: data3,
        options: options3
    });
    
    // 출고 수량 차트
    const ctx4 = document.getElementById('out-stock-chart').getContext('2d');

    const outProductNames = outStockData.map(item => item.ma_name);
    const outQuantities = outStockData.map(item => item.io_quantity);
    const outValues = outStockData.map(item => item.outValue);
    
    console.log('출고 총액 데이터:', outValues);

    const data4 = {
        labels: outProductNames,
        datasets: [
            {
                type: 'bar',
                label: '각 상품별 출고량',
                data: outQuantities,
                backgroundColor: '#65a7fc', 
                borderColor: '#65a7fc', 
                borderWidth: 1,
                yAxisID: 'y', // 출고량에 대한 y축
            },
            {
                type: 'bar',
                label: '출고 총액',
                data: outValues,
                backgroundColor: '#d26eeb', 
                borderColor: '#d26eeb', 
                borderWidth: 2,
                yAxisID: 'y1', // 출고 총액에 대한 y축
                fill: false,
            }
        ]
    };

    const options4 = {
        scales: {
            y: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: '출고량'
                }
            },
            y1: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: '출고 총액'
                },
                position: 'right',
                grid: {
                    drawOnChartArea: false // 그리드 숨기기
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

    new Chart(ctx4, {
        type: 'bar',
        data: data4,
        options: options4
    });
</script>

<!-- 로그인 체크 스크립트 -->
<script>
   function checkapp() {
      var user_approval = document.getElementById('login_user_approval').value;
      var partner_approval = document.getElementById('login_partner_approval').value;

      if (user_approval == 0 && !partner_approval) {
         alert("승인되지 않은 ID입니다. 관리자에게 문의해주세요.");
         window.location.href = '${contextPath}/login/logout';
      }
      
      if(!user_approval && partner_approval==0){
         alert("승인되지 않은 ID입니다. 관리자에게 문의해주세요.");
         window.location.href = '${contextPath}/login/logout';
      }
   }

   window.onload = checkapp;
</script>

<!-- 캘린더 -->
<!-- <div class="content-body">
   <div id='calendar'></div>
</div> -->

<!-- login input -->
<input value="${partlogin.partner_approval }" type="hidden"
   id="login_partner_approval" name="login_partner_approval">
<input value="${userlogin.user_approval }" type="hidden"
   id="login_user_approval" name="login_user_approval">

<%@ include file="../include/footer.jsp"%>
