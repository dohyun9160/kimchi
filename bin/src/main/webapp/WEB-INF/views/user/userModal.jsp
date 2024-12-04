<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<script>
    var partcheck;//selectUser()의 선택을 검사하는 용도
    var departmentcheck='';//부서선택으로 인한 페이징 오류를 방지하는 용도
    // 모달 open
    function openuserModal(part) {
        partcheck = part;
        loadUser(1,'',''); // 처음 열 때 첫 페이지 로드
        document.getElementById("userModal").style.display = "flex";
    }

    // 모달 close
    function closeuserModal() {
        document.getElementById("userModal").style.display = "none";
    }

    // 특정 부서 선택
    function selectUser(id, name, number, email, department) {
        if (department != partcheck) {
            alert(partcheck + "가 아닙니다. 다시 선택해주세요.");
            return;
        }
        document.getElementById("user_id").value = id;
        document.getElementById("user_name").value = name;
        document.getElementById("user_number").value = number;
        document.getElementById("user_email").value = email;
        document.getElementById("user_department").value = department;
        closeuserModal();
    }

    // 사원명으로 검색
    function searchUser(pageNum = 1) {
        const input = document.getElementById('searchUserInput').value.toLowerCase();
        loadUser(pageNum, input, departmentcheck);
    }

    // 특정 부서 선택
    function filterDepartment(department) {
    	if (department === '전체') {
            // 검색 입력값 초기화
            departmentcheck = '';
            loadUser(1, '', departmentcheck);
            return;
        }
    	departmentcheck = department;
        loadUser(1, '', departmentcheck);
    }

    // 담당자 페이징 로드
    function loadUser(pageNum, userName, department) {
        $.ajax({
            url: '<c:url value="/contracts/contractsInsertForm" />',
            type: 'GET',
            data: { pageNum: pageNum, user_name: userName, user_department: department }, // 검색 및 부서 정보 전송
            success: function(data) {
                // 모달 내용 업데이트
                const userContent = $(data).find('#userModal .modal-body').html();
                $('#userModal .modal-body').html(userContent);
            },
            error: function() {
                alert('오류가 발생했습니다.');
            }
        });
    }
</script>

<div id="userModal" class="modal-long">
    <div class="modal-content">
        <div class="modal-header">
            <h3>담당자 목록</h3>
            <button onclick="filterDepartment('전체')" class="filter-button">전체</button>
            <button onclick="filterDepartment('개발부서')" class="filter-button">개발부서</button>
            <button onclick="filterDepartment('생산부서')" class="filter-button">생산부서</button>
            <button onclick="filterDepartment('구매부서')" class="filter-button">구매부서</button>
            <button onclick="filterDepartment('자재부서')" class="filter-button">자재부서</button>
        </div>
        <div class="modal-body">
            <input type="text" id="searchUserInput" placeholder="담당자명으로 검색" class="search-input">
            <button onclick="searchUser(1)" class="search-button">검색</button>
            <button onclick="filterDepartment('전체')" class="search-button">초기화</button>
            <table class="modal-table">
                <tr>
                    <th>담당자 명</th>
                    <th>담당자 전화번호</th>
                    <th>담당자 이메일</th>
                    <th>담당자 부서</th>
                </tr>
                <c:forEach var="userlist" items="${userlist}">
                    <c:if test="${userlist.user_approval == 1 and userlist.user_department ne '관리자'}">
                        <tr class="user-row" data-department="${userlist.user_department}"
                            onclick="selectUser('${userlist.user_id}', '${userlist.user_name}', '${userlist.user_number}', '${userlist.user_email}', '${userlist.user_department}')">
                            <td>${userlist.user_name}</td>
                            <td>${userlist.user_number}</td>
                            <td>${userlist.user_email}</td>
                            <td>${userlist.user_department}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
            <!-- pagination -->
            <div class="pagination">
                <c:if test="${user_currentPage > 1}">
                    <a href="javascript:void(0);" onclick="loadUser(${user_currentPage - 1}, document.getElementById('searchUserInput').value, departmentcheck)">이전</a>
                </c:if>

                <c:forEach var="page" begin="1" end="${user_totalPages}">
                    <c:choose>
                        <c:when test="${page == user_currentPage}">
                            <strong>${page}</strong>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0);" onclick="loadUser(${page}, document.getElementById('searchUserInput').value, departmentcheck)">${page}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${user_currentPage < user_totalPages}">
                    <a href="javascript:void(0);" onclick="loadUser(${user_currentPage + 1}, document.getElementById('searchUserInput').value, departmentcheck)">다음</a>
                </c:if>
            </div>
            <div class="modal-footer">
                <button type="button" class="filter-button" onclick="closeuserModal()">닫기</button>
            </div>
        </div>
    </div>
</div>
