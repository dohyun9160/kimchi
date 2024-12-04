<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<style>
.modal-table th, .modal-table td {
 padding: 5px; /* 패딩을 줄임 */
}
.input-group input[type="number"]{
    padding: 10px;
    margin-bottom: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
    text-align: center;
    margin-top: 5px;
}
</style>
<script>
	var rowIndex = 1; // 초기번호 설정
	//open, close
	function openbomInsertModal() {
		document.getElementById("bomInsertModal").style.display = "flex";
	}//end
	function closebomInsertModal() {
		document.getElementById("bomInsertModal").style.display = "none";
	}//end
	function openbomUpdateModal(InputIndex) {
		rowIndex = InputIndex+1;
		document.getElementById("bomUpdateModal").style.display = "flex";
	}//end
	function closebomUpdateModal() {
		document.getElementById("bomUpdateModal").style.display = "none";
	}//end

	// 셀추가
	function addRow(inputType) {
		 let newRow; // 여기서 newRow를 선언합니다.

		    if (inputType === 'insert') {
		        const table = document.getElementById('bomInsertTable');
		        newRow = table.insertRow(-1); // 새로운 행 추가
		    } else if (inputType === 'update') {
		        const table = document.getElementById('bomUpdateTable');
		        newRow = table.insertRow(rowIndex); // rowIndex가 정의되어 있는지 확인합니다.
		    } else {
		        console.error("유효하지 않은 inputType: " + inputType);
		        return; // inputType이 유효하지 않으면 함수 종료
		    }

		    // 이제 newRow가 정의되어 있으므로 사용할 수 있습니다.
		    const cell1 = newRow.insertCell();
		    const cell2 = newRow.insertCell();
		    const cell3 = newRow.insertCell();
		    const cell4 = newRow.insertCell();
		    const cell5 = newRow.insertCell();
		    const cell6 = newRow.insertCell();
		    const cell7 = newRow.insertCell();
		    const cell8 = newRow.insertCell();
		    const cell9 = newRow.insertCell();
		    const cell10 = newRow.insertCell();

		    // 셀에 HTML 추가 (onclick에 rowIndex 추가)
		    cell1.innerHTML = '<input name="roeNum" id="rowNum[' + rowIndex + ']" type="number" value="' + rowIndex + '" readonly style="width: 80%; margin-left:1px;">';
		    cell2.innerHTML = '<input name="ma_id" id="ma_id[' + rowIndex + ']" onclick="openbom_maModal(' + rowIndex + ')" placeholder="자재선택" type="number" style="width: 80%; margin-left:1px;">';
		    cell3.innerHTML = '<input name="ma_category" id="ma_category[' + rowIndex + ']" onclick="openbom_maModal(' + rowIndex + ')" placeholder="자재선택">';
		    cell4.innerHTML = '<input name="ma_name" id="ma_name[' + rowIndex + ']" onclick="openbom_maModal(' + rowIndex + ')" placeholder="자재선택">';
		    cell5.innerHTML = '<input name="ma_origin" id="ma_origin[' + rowIndex + ']" onclick="openbom_maModal(' + rowIndex + ')" placeholder="자재선택">';
		    cell6.innerHTML = '<input name="ma_unit" id="ma_unit[' + rowIndex + ']" onclick="openbom_maModal(' + rowIndex + ')" placeholder="자재선택">';
		    cell7.innerHTML = '<input name="ma_weight" id="ma_weight[' + rowIndex + ']" onclick="openbom_maModal(' + rowIndex + ')" placeholder="자재선택">';
		    cell8.innerHTML = '<input name="bom_ma_amount" id="bom_ma_amount[' + rowIndex + ']" type="number" style="width: 80%; margin-left:1px;">';
		    cell9.innerHTML = '<select required name="bom_ma_process" id="bom_ma_process[' + rowIndex + ']">'
		        + '<option value="제조공정선택">제조공정선택</option>'
		        + '<option value="조제">조제</option>'
		        + '<option value="절임">절임</option>'
		        + '<option value="소제작">소제작</option>'
		        + '<option value="포장">포장</option>'
		        + '<option value="숙성">숙성</option>'
		        + '<option value="기타">기타</option>' + '</select>';
		    cell10.innerHTML = '<button type="button" class="addbutton reset" onclick="resetRow(this)">초기화</button>'; // 초기화 버튼 추가

		    rowIndex++; // rowIndex가 정의되고 적절히 관리되도록 합니다.
		    document.getElementById("btnAddRow_insert").disabled = true; // 버튼 비활성화
		    document.getElementById("btnAddRow_update").disabled = true; // 버튼 비활성화
	}//end

	function resetRow(button) {
		const row = button.parentNode.parentNode; // 버튼의 부모 셀의 부모 행을 찾습니다.
		const cells = row.getElementsByTagName('td'); // 해당 행의 모든 셀을 가져옵니다.

		for (let i = 0; i < cells.length; i++) {
			// 첫 번째 셀(rowNum)과 마지막 두 셀(bom_ma_process, 초기화 버튼)을 제외합니다.
			if (i === 0 || i === cells.length - 2 || i === cells.length - 1)
				continue;

			if (cells[i].querySelector('input')) {
				cells[i].querySelector('input').value = ""; // 입력 필드가 있으면 빈 값으로 설정
			} else {
				cells[i].textContent = ""; // 텍스트 내용을 빈 문자열로 설정
			}
		}
	}//end

	function InsertBom() {
		var bom_schedule = document.getElementById("bom_schedule").value;

		if (bom_schedule === "" || bom_schedule == null) {
			alert("제조일정을 입력해주세요.");
			document.getElementById("bom_schedule_insert").focus();
			return;
		}//end

		if (rowIndex == 1) {
			alert("자재리스트를 추가해주세요.");
			document.getElementById("bom_schedule_insert").focus();
			return;
		}//end

		var checkma_id_1 = document.getElementById("ma_id[1]").value;

		if (checkma_id_1 == null || checkma_id_1 === "") {
			alert("자재를 선택해주세요.");
			document.getElementById("ma_id[1]").focus();
			return;
		}//end

		var ma_id = [];
		for (var i = 1; i < rowIndex; i++) { // rowIndex는 행의 개수이므로 <로 수정
			var currentMaId = document.getElementById("ma_id[" + i + "]"); // 요소 찾기
			if (currentMaId) { // 요소가 존재하는지 확인
				ma_id[i] = currentMaId.value; // 값 저장
				if (ma_id[i] !== null && ma_id[i] !== "") {
					var amount = document.getElementById("bom_ma_amount[" + i
							+ "]").value;
					if (amount === "") {
						alert("자재 수량을 입력해주세요.");
						document.getElementById("bom_ma_amount[" + i + "]")
								.focus();
						return; // 첫 번째 비어있는 입력란에서 멈춤
					}
				}
			}
		}//end

		for (var i = 1; i < rowIndex; i++) { // rowIndex는 행의 개수이므로 <로 수정
			var currentMaId = document.getElementById("ma_id[" + i + "]"); // 요소 찾기
			if (currentMaId) { // 요소가 존재하는지 확인
				ma_id[i] = currentMaId.value; // 값 저장
				if (ma_id[i] !== null && ma_id[i] !== "") {
					var process = document.getElementById("bom_ma_process[" + i
							+ "]").value;
					if (process === "제조공정선택") {
						alert("제조공정을 입력해주세요.");
						document.getElementById("bom_ma_process[" + i + "]")
								.focus();
						return; // 첫 번째 비어있는 입력란에서 멈춤
					}
				}
			}
		}//end
		
		document.getElementById("bomInsertForm").submit(); // 폼 제출
		// 첫 번째 폼 제출 후 약간의 지연을 줄 수 있음
		setTimeout(function() {
			document.getElementById("bom_maInsertForm").submit(); // 두 번째 폼 제출
		}, 50); // 30ms 지연
	}//end InsertBom
	
	function updateBom(){
		var bom_schedule = document.getElementById("bom_schedule_update").value;

		if (bom_schedule === "" || bom_schedule == null) {
			alert("수정 제조일정을 입력해주세요.");
			document.getElementById("bom_schedule_update").focus();
			return;
		}//end

		var checkma_id_1 = document.getElementById("ma_id[1]").value;

		if (checkma_id_1 == null || checkma_id_1 === "") {
			alert("자재를 선택해주세요.");
			document.getElementById("ma_id[1]").focus();
			return;
		}//end

		var ma_id = [];
		for (var i = 1; i < rowIndex; i++) { // rowIndex는 행의 개수이므로 <로 수정
			var currentMaId = document.getElementById("ma_id[" + i + "]"); // 요소 찾기
			if (currentMaId) { // 요소가 존재하는지 확인
				ma_id[i] = currentMaId.value; // 값 저장
				if (ma_id[i] !== null && ma_id[i] !== "") {
					var amount = document.getElementById("bom_ma_amount[" + i
							+ "]").value;
					if (amount === "") {
						alert("자재 수량을 입력해주세요.");
						document.getElementById("bom_ma_amount[" + i + "]")
								.focus();
						return; // 첫 번째 비어있는 입력란에서 멈춤
					}
				}
			}
		}//end

		for (var i = 1; i < rowIndex; i++) { // rowIndex는 행의 개수이므로 <로 수정
			var currentMaId = document.getElementById("ma_id[" + i + "]"); // 요소 찾기
			if (currentMaId) { // 요소가 존재하는지 확인
				ma_id[i] = currentMaId.value; // 값 저장
				if (ma_id[i] !== null && ma_id[i] !== "") {
					var process = document.getElementById("bom_ma_process[" + i
							+ "]").value;
					if (process === "제조공정선택") {
						alert("제조공정을 입력해주세요.");
						document.getElementById("bom_ma_process[" + i + "]")
								.focus();
						return; // 첫 번째 비어있는 입력란에서 멈춤
					}
				}
			}
		}//end
		
		
		document.getElementById("bomUpdateForm").submit(); // 폼 제출
		setTimeout(function() {
		document.getElementById("bom_maUpdateForm").submit(); // 두 번째 폼 제출
		}, 50); // 30ms 지연
	}//end updateBom
	
</script>
<!-- bomInsertModal -->
<div id=bomInsertModal class="modal-long">
	<div class="modal-content">
		<div class="modal-header">
			<h3>bom 추가화면</h3>
		</div>
		<div class="modal-body">
			<form action="bomInsert" method="post" id="bomInsertForm" name="bomInsertForm">
				<label>물품코드</label> <input style=" width: 30%;" id="item_no" name="item_no" type="number" value="${item.item_no}" readonly>
				<label>제작 소요일자</label><input style=" width: 30%;" id="bom_schedule" name="bom_schedule" type="number">
					<div style="text-align: center;">
						 <label style="text-align: left; display: block;">제작상세내용</label>
						<textarea rows="3" cols="5" id="bom_othe_inputr" name="bom_other" placeholder="제작상세내용 입력"></textarea>
					</div>
			</form>
			<hr>
			<div class="modal-header">
				<h3>bom 자재 추가화면</h3>
			</div>
			<div class="modal-body">
				<form action="bom_maInsert" method="post" id="bom_maInsertForm" name="bom_maInsertForm">
					<input type="hidden" name="item_no" value="${item.item_no}" id="item_no" />
					<table id="bomInsertTable" class="modal-table">
						<tr>
							<td>번호</td>
							<td>자재코드</td>
							<td>분류</td>
							<td>자재명</td>
							<td>원산지</td>
							<td>자재단위</td>
							<td>자재무게</td>
							<td>소요자재량</td>
							<td>소요공정</td>
						</tr>
					</table>
					<button type="button" class="addbutton" onclick="addRow('insert')" id="btnAddRow_insert">자재리스트추가</button>
					<button type="button" class="addbutton" onclick="InsertBom()">BOM 추가</button>
				</form>
				<div class="modal-footer">
					<button type="button" class="filter-button" onclick="closebomInsertModal()">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- bomUpdateModal -->
<div id=bomUpdateModal class="modal-long">
	<div class="modal-content">
		<div class="modal-header">
			<h3>bom 수정화면</h3>
		</div>
		<div class="modal-body">
			<form action="bomUpdate" method="post" id="bomUpdateForm" name="bomUpdateForm">
					<label>물품코드</label> <input style=" width: 30%;" id="item_no" name="item_no" type="number" value="${item.item_no}" readonly>
					<label>제작 소요일자</label><input style=" width: 30%;" id="bom_schedule_update" name="bom_schedule" type="number" value="${bom.bom_schedule }">
					<div style="text-align: center;">
					 <label style="text-align: left; display: block;">제작상세내용</label>
					<textarea rows="3" cols="5" id="bom_other_update" name="bom_other"> ${bom.bom_other}</textarea>
					</div>
			</form>
			<hr>
			<div class="modal-header">
				<h3>bom 자재 수정화면</h3>
			</div>
			<div class="modal-body">
				<form action="bom_maUpdate" method="post" id="bom_maUpdateForm" name="bom_maUpdateForm">
					<input type="hidden" name="item_no" value="${item.item_no}" id="item_no" />
					<table id="bomUpdateTable" class="modal-table">
						<tr>
							<td>번호</td>
							<td>자재코드</td>
							<td>분류</td>
							<td>자재명</td>
							<td>원산지</td>
							<td>자재단위</td>
							<td>자재무게</td>
							<td>소요자재량</td>
							<td>소요공정</td>
						</tr>
						<c:forEach var="bom_malist" items="${bom_malist}" varStatus="status">
							<tr>
								<td><input name="roeNum" id="rowNum[${status.index + 1}]" type="number" value="${status.index + 1}" readonly style="width: 80%; margin-left: 1px;"></td>
								<td><input name="ma_id" id="ma_id[${status.index + 1}]" onclick="openbom_maModal(${status.index + 1})" type="number" value="${bom_malist.ma_id}" readonly style="width: 80%; margin-left: 1px;"></td>
								<c:forEach var="malist" items="${malist}">
									<c:if test="${malist.ma_id == bom_malist.ma_id}">
										<td><input name="ma_category" id="ma_category[${status.index + 1}]" onclick="openbom_maModal(${status.index + 1})"value="${malist.ma_category}" readonly></td>
										<td><input name="ma_name" id="ma_name[${status.index + 1}]" onclick="openbom_maModal(${status.index + 1})" value="${malist.ma_name}" readonly></td>
										<td><input name="ma_origin"
											id="ma_origin[${status.index + 1}]"
											onclick="openbom_maModal(${status.index + 1})"
											value="${malist.ma_origin}" readonly></td>
										<td><input name="ma_unit"
											id="ma_unit[${status.index + 1}]"
											onclick="openbom_maModal(${status.index + 1})"
											value="${malist.ma_unit}" readonly></td>
										<td><input name="ma_weight"
											id="ma_weight[${status.index + 1}]"
											onclick="openbom_maModal(${status.index + 1})"
											value="${malist.ma_weight}" readonly></td>
									</c:if>
								</c:forEach>
								<td><input name="bom_ma_amount"
									id="bom_ma_amount[${status.index + 1}]" type="number"
									value="${bom_malist.bom_ma_amount}" style="width: 80%; margin-left: 1px;"></td>
								<td><select required name="bom_ma_process"
									id="bom_ma_process[${status.index + 1}]">
										<option value="제조공정선택"
											${bom_malist.bom_ma_process == '제조공정선택' ? 'selected' : ''}>제조공정선택</option>
										<option value="조제"
											${bom_malist.bom_ma_process == '조제' ? 'selected' : ''}>조제</option>
										<option value="절임"
											${bom_malist.bom_ma_process == '절임' ? 'selected' : ''}>절임</option>
										<option value="소제작"
											${bom_malist.bom_ma_process == '소제작' ? 'selected' : ''}>소제작</option>
										<option value="포장"
											${bom_malist.bom_ma_process == '포장' ? 'selected' : ''}>포장</option>
										<option value="숙성"
											${bom_malist.bom_ma_process == '숙성' ? 'selected' : ''}>숙성</option>
										<option value="기타"
											${bom_malist.bom_ma_process == '기타' ? 'selected' : ''}>기타</option>
								</select></td>
								<td><button type="button" class="addbutton reset" onclick="resetRow(this)">초기화</button></td>
							</tr>
						</c:forEach>
					</table>
					<button type="button" class="addbutton" onclick="addRow('update')" id="btnAddRow_update">자재리스트추가</button>
					<button type="button" class="addbutton" onclick="updateBom()">BOM 수정</button>
				</form>
			</div>
		</div>
		<div class="modal-footer">
		<button type="button" class="filter-button" onclick="closebomUpdateModal()">닫기</button>
	</div>
	</div>
</div>