<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<link href="<c:url value="${contextPath}/resources/css/mystyle.css"/>"
	rel='stylesheet' />
<script>
	function openattSelectModal() {
		document.getElementById("attSelectModal").style.display = "flex";
	}//end

	function closeattSelectModal() {
		document.getElementById("attSelectModal").style.display = "none";
	}//end

	// 	첨부파일 코드와 첨부파일 명 가져오기
	function selectAttachmentCode(no, name) {
		document.getElementById("attachment_no").value = no;
		document.getElementById("attachment_name").value = name;
		closeattSelectModal(); // 모달 닫기
	}//end
	function openAttInsertModel() {
		document.getElementById("attSelectModal").style.display = "none";
		document.getElementById("attInsertModal").style.display = "flex";
	}//end

	function closeAttInsertModel() {
		document.getElementById("attInsertModal").style.display = "none";
	}//end
	
	//첨부파일 insert한 후에 itemInsertForm 유지되게 하는 것
	
	function uploadFile() {
		const formData = new FormData(document.getElementById('attInsertForm'));
		var date=1;
		$.ajax({
			url : '<c:url value="/fileInsert" />',
			type : 'POST',
			data : formData,
			contentType : false,
			processData : false,
			success : function(data) {
				if (date == 1) {
					// 모달 내용 업데이트 // item의 내용을 가져오는 부분 수정
					const itemContent = $(data).find('#itemInsertForm').html(); // 수정된 부분
					$('#itemInsertForm').html(itemContent);
					$.ajax({
						url : '<c:url value="/item/itemInsertForm" />',
						type : 'GET',
						success : function(data) {
							// 모달 내용 업데이트
							const attContent = $(data).find(
									'#attSelectModal .modal-body').html();
							$('#attSelectModal .modal-body').html(attContent);
						},
						error : function() {
							alert('첨부파일 로드 오류발생');
						}
					}); // 첨부파일 재로드
					
					closeAttInsertModel();
					openattSelectModal();
					// 추가한 폼 초기화
	                document.getElementById('attInsertForm').reset(); // 폼 초기화

				} else {
					alert("파일 업로드 실패 재시도");
				}
			},
			error : function() {
				alert('오류가 발생했습니다.');
			}
		});
	} // end
</script>
<style>
/* 스트롤바 */
#attSelectModal .modal-body{
	max-height: 600px; /* 원하는 최대 높이 설정 */
    overflow-y: auto; /* 세로 방향 스크롤바 생성 */
}
</style>
<!-- attSelectModal_첨부파일 선택모달 -->
<div id="attSelectModal" class="modal-long">
	<div class="modal-content">
		<div class="modal-header">
			<h3>첨부파일목록</h3>
			<button type="button" class="filter-button" onclick="openAttInsertModel()" style="margin-left: 70%;">파일 추가</button>
			<button type="button" class="filter-button" onclick="closeattSelectModal()">닫기</button>
		</div>
		<div class="modal-body">
			<table class="modal-table">
				<tr>
					<td>첨부파일 코드</td>
					<td>첨부파일 명</td>
				</tr>
				<c:forEach var="attlist" items="${attlist}">
					<tr
						onclick="selectAttachmentCode('${attlist.attachment_no}', '${attlist.attachment_name}')">
						<td>${attlist.attachment_no}</td>
						<td>${attlist.attachment_name}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
<!-- attInsertModal_첨부파일 추가 모달 -->
<div id="attInsertModal" class="modal-long">
	<div class="modal-content" style="width: 50%;">
		<div class="modal-header">
			<h3>첨부파일추가</h3>
		</div>
		<!-- <form action="/fileInsert" method="post" enctype="multipart/form-data"> -->
			<form id="attInsertForm" name="attInsertForm" enctype="multipart/form-data">
			<div>
				<input type="file" name="file" required>
			</div>
			<div class="modal-footer">
				<button type="button" class="filter-button" onclick="uploadFile()">첨부파일 추가</button>
				<button type="button" class="filter-button" onclick="closeAttInsertModel()">닫기</button>
			</div>
		</form>
	</div>
</div>