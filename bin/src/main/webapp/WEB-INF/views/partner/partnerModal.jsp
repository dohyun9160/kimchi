<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<link href="<c:url value="${contextPath}/resources/css/mystyle.css"/>" rel='stylesheet' />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function openpartnerModal() {
		loadPartners(1,''); // 처음 열 때 첫 페이지 로드
		document.getElementById("partnerModal").style.display = "flex";
	}//end
	function closepartnerModal() {
		document.getElementById("partnerModal").style.display = "none";
	}//end
	//협력회사 정보가져오기
	function selectPartner(taxid, companyname, ownername, number, email) {
		document.getElementById("partner_taxid").value = taxid;
		document.getElementById("partner_companyname").value = companyname;
		document.getElementById("partner_ownername").value = ownername;
		document.getElementById("partner_number").value = number;
		document.getElementById("partner_email").value = email;
		closepartnerModal(); // 모달 닫기
	}//end
	
	//회사명으로 검색
	function searchPartner(pageNum = 1){
		const input = document.getElementById('searchPartnerInput').value.toLowerCase();
		loadPartners(pageNum, input);
	}//end
	
	function resctsearch(){
		loadPartners(1,'');
	}//end
	
	// 협력회사 목록 로드_새로고침 방지
	function loadPartners(pageNum, partnerCompanyname) {
		$.ajax({
			url: '<c:url value="/contracts/contractsInsertForm" />',
			type: 'GET',
			data: { pageNum: pageNum, partner_companyname: partnerCompanyname}, //검색 정보 전송
			success: function(data) {
				// 모달 내용 업데이트 // partnerModal의 내용을 가져오는 부분 수정
			    const partnerContent = $(data).find('#partnerModal .modal-body').html();
			    $('#partnerModal .modal-body').html(partnerContent);
			},
			error: function() {
				alert('오류가 발생했습니다.');
			}
		});
	}//end
</script>
<div id="partnerModal" class="modal-long">
	<div class="modal-content">
		<div class="modal-header">
			<h3>협력회사 목록</h3>
		</div>
		<div class="modal-body">
		    <input type="text" id="searchPartnerInput" placeholder="회사명 검색" class="search-input">
            <button onclick="searchPartner(1)" class="search-button">검색</button>
            <button onclick="resctsearch()" class="search-button">초기화</button>
			<table class="modal-table">
				<tr>
					<td>혁력회사 사업자번호</td>
					<td>혁력회사 명</td>
					<td>협력회사 대표자명</td>
					<td>협력회사 전화번호</td>
					<td>협력회사 이메일</td>
				</tr>
				<c:forEach var="partnerlist" items="${partnerlist}">
					<c:if test="${partnerlist.partner_approval eq 1}">
						<tr
							onclick="selectPartner('${partnerlist.partner_taxid }','${partnerlist.partner_companyname }', '${partnerlist.partner_ownername }', '${partnerlist.partner_number }', '${partnerlist.partner_email }' )">
							<td>${partnerlist.partner_taxid }</td>
							<td>${partnerlist.partner_companyname }</td>
							<td>${partnerlist.partner_ownername }</td>
							<td>${partnerlist.partner_number }</td>
							<td>${partnerlist.partner_email }</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<!-- pagination -->
			<div class="pagination">
				<c:if test="${partner_currentPage > 1}">
					<a href="javascript:void(0);" onclick="loadPartners(${partner_currentPage - 1})">이전</a>
				</c:if>
				
				<c:forEach var="page" begin="1" end="${partner_totalPages}">
					<c:choose>
						<c:when test="${page == partner_currentPage}">
							<strong>${page}</strong>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);" onclick="loadPartners(${page})">${page}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${partner_currentPage < partner_totalPages}">
					<a href="javascript:void(0);" onclick="loadPartners(${partner_currentPage + 1})">다음</a>
				</c:if>
			</div>
			<div class="modal-footer">
				<button type="button" class="filter-button" onclick="closepartnerModal()">닫기</button>
			</div>
		</div>
	</div>
</div>