<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<link href="<c:url value="${contextPath}/resources/css/mystyle.css"/>" rel='stylesheet' />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function openitemModal() {
		loadItems(1,''); // 처음 열 때 첫 페이지 로드
		document.getElementById("itemModal").style.display = "flex";
	}//end
	function closeitemModal() {
		document.getElementById("itemModal").style.display = "none";
	}//end
	//물품 정보 가져오기
	function selectItem(no, category, name, price, schedule) {
		document.getElementById("item_no").value = no;
		document.getElementById("item_category").value = category;
		document.getElementById("item_name").value = name;
		document.getElementById("item_price").value = price;
		document.getElementById("bom_schedule").value = schedule;
		closeitemModal(); // 모달 닫기
	}//end
	
	//물품 검색
	function searchItems(pageNum = 1) {
	    const input = document.getElementById('searchItemInput').value.toLowerCase();
	    loadItems(pageNum, input);
	}//end

	//검색 초기화
	function resetSearch() {
		loadItems(1,'');
	}//end
	
	//물품 목록 로드
	function loadItems(pageNum, itemName) {
	    $.ajax({
	        url: '<c:url value="/contracts/contractsInsertForm" />',
	        type: 'GET',
	        data: { pageNum: pageNum, item_name: itemName },
	        success: function(data) {
	            // 모달 내용 업데이트 // item의 내용을 가져오는 부분 수정
	            const itemContent = $(data).find('#itemModal .modal-body').html();
			    $('#itemModal .modal-body').html(itemContent);
	        },
	        error: function() {
	            alert('오류가 발생했습니다.');
	        }
	    });
	}//end
	



</script>
<div id="itemModal" class="modal-long">
	<div class="modal-content">
		<div class="modal-header">
			<h3>물품 목록</h3>
		</div>
		<div class="modal-body">
				<input type="text" id="searchItemInput" placeholder="물품명으로 검색" class="search-input">
   			 	<button onclick="searchItems(1)" class="search-button">검색</button>
   			 	<button onclick="resetSearch()" class="search-button">초기화</button>
			<table class="modal-table">
				<tr>
					<td>물품 코드</td>
					<td>물룸 분류</td>
					<td>물품명</td>
					<td>물품 단가</td>
					<td>제조소요일</td>
				</tr>
				<c:forEach var="itemlist" items="${itemlist}">
					<c:if test="${itemlist.item_bomRegistered eq 1}">
						<tr
							onclick="selectItem('${itemlist.item_no}', '${itemlist.item_category}', '${itemlist.item_name}', '${itemlist.item_price}', '${itemlist.bomVO.bom_schedule}')">
							<td>${itemlist.item_no}</td>
							<td>${itemlist.item_category}</td>
							<td>${itemlist.item_name}</td>
							<td>${itemlist.item_price}</td>
							<td>${itemlist.bomVO.bom_schedule}일</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<!-- pagination -->
			<div class="pagination">
				<c:if test="${item_currentPage > 1}">
					<a href="javascript:void(0);"
						onclick="loadItems(${item_currentPage - 1}, document.getElementById('searchItemInput').value)">이전</a>
				</c:if>
				<c:forEach var="page" begin="1" end="${item_totalPages}">
					<c:choose>
						<c:when test="${page == item_currentPage}">
							<strong>${page}</strong>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);"
								onclick="loadItems(${page}, document.getElementById('searchItemInput').value)">${page}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${item_currentPage < item_totalPages}">
					<a href="javascript:void(0);"
						onclick="loadItems(${item_currentPage + 1}, document.getElementById('searchItemInput').value)">다음</a>
				</c:if>
			</div>
			<div class="modal-footer">
				<button type="button" class="filter-button" onclick="closeitemModal()">닫기</button>
			</div>
		</div>
	</div>
</div>
