<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
  
  <%@include file="../include/header.jsp" %>
  
  
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        
        
        
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
       
        <div class="content-body">
      		<div class="container-fluid">
      			<div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>입고 정보 Page</h4>
                            <span class="ml-1">입고</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">홈</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">입고정보</a></li>
                        </ol>
                    </div>
                </div>
                
                <div class="row">
                	<div class="card-body" style="float: right;">
                        <button type="button" class="btn  btn-square  btn-outline-success"  style="min-width: 80px; color:#454545;" id="insert-btn">추가하기</button>
                        <button type="button" class="btn  btn-square btn-outline-dark" style="min-width: 80px;" id="modal-btn" data-toggle="modal" data-target=".bd-example-modal-lg">발주조회</button>
                        <button type="button" class="btn  btn-square btn-outline-warning" style="min-width: 80px; color:#454545;" id="io-check-btn">검수완료</button>
                        <button type="button" class="btn  btn-square btn-outline-dark" style="min-width: 80px;" id="transaction-btn">거래명세서</button>
                	</div>
                	
                	<div class="col-lg-12">
								    <div id="informationCard" class="card">
								        <div class="card-header">
								            <h4 class="card-title">입고</h4>
								            <label onclick="resetForm()">초기화</label>
								        </div>
								        <div id="informBody" class="card-body">
								            <div class="table-responsive">
								                <form id="insert_in" action="insert_io" method="post">
								                    <table class="table table-bordered verticle-middle table-responsive-sm" style="table-layout: fixed;">
								                        <tr>
								                            <td style="width:300px; text-align: center;">입고코드</td>
								                            <td style="text-align: center; overflow: hidden;">
								                                <label for="inp-1">io-</label>
								                                <input type="int" id="inp-1" name="io_id" readonly="readonly" style="text-align: center; width: 90%;">
								                            </td>
								                            <td style="width:300px; text-align: center;">입고 상태</td>
								                            <td style="text-align: center; overflow: hidden;">
								                                <input type="text" id="io_status" name="io_status" readonly="readonly" style="text-align: center; width: 90%;">
								                            </td>
								                            <td style="width:300px; text-align: center;">입고일</td>
								                            <td style="text-align: center; overflow: hidden;">
								                                <input type="date" name="io_date" id="in_date" style="text-align: center; width: 90%; margin-left: 20px; margin-right: 20px;">
								                            </td>
								                        </tr>
								                        <tr>
								                            <td style="text-align: center;">제품명</td>
								                            <td style="text-align: center; overflow: hidden;">
								                                <input type="text" id="ma_name" name="ma_name" readonly="readonly" style="text-align: center; width: 90%;">
								                            </td>
								                            <td style="text-align: center;">수량</td>
								                            <td style="text-align: center; overflow: hidden;">
								                                <input type="text" id="io_quantity" name="io_quantity" readonly="readonly" style="text-align: center; width: 90%;">
								                            </td>
								                            <td style="text-align: center;">단가(원)</td>
								                            <td style="text-align: center; overflow: hidden;">
								                                <input type="text" id="ma_price" name="ma_price" readonly="readonly" style="text-align: center; width: 90%;">
								                            </td>
								                        </tr>
								                        <tr>
								                            <td style="text-align: center;">거래명세서여부</td>
								                            <td style="text-align: center; overflow: hidden;">
								                                <input type="text" id="invoice_issuance_status" name="invoice_issuance_status" readonly="readonly" style="text-align: center; width: 90%;">
								                            </td>
								                            <td style="text-align: center;">상세정보</td>
								                            <td colspan="3" align="center" style="overflow: hidden;">
								                                <textarea rows="2" style="resize: none; text-align: center; width: 90%;" id="io_information" name="io_information"></textarea>
								                            </td>
								                            <td style="display:none;"><input type="int" id="ma_id" name="ma_id"></td>
								                            <td style="display:none;"><input type="int" id="production_no" name="production_no"></td>
								                            <td style="display:none;"><input type="int" id="obtain_no" name="obtain_no"></td>
								                        </tr>
								                    </table>
								                </form>
								            </div>
								        </div>
								    </div>
								</div>

                	
                	<div class="col-12" id="information">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">입고현황</h4>
                            </div>
                            	<div class="card-search">
 									 <select id="selectstatus"	class="custom-select mr-sm-2" style="width: 98px;">
 									 	<option value="">전체</option>
 									 	<option value="입고중">입고중</option>
 									 	<option value="입고완료">입고완료</option>
 									 </select>
 								
 									<span class="select-part"> <input type="text" id="searchCompanyname" placeholder="회사명을 입력해주세요" class="form-control input-default " style=" height:35.19px; width: 200px; "></span>
 									
 									 <button type="button" onclick="searchio(1)" class="btn  btn-square btn-outline-dark" style=" margin-right: 5px;">검색</button>                       	
 									 <button type="button" onclick="resetsearch()" class="btn  btn-square btn-outline-dark">초기화</button>                       	
                            	</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	<div id="example_wrapper" class="dataTables_wrapper">
                                		
                                	<form action="io_status_ch" method="post" id="io_check_status">
                                    <table id="example" class="display dataTable" style="min-width: 845px" role="grid" aria-describedby="example_info">
                                        <thead>
                                            <tr role="row">
                                            	<th class="sorting_asc" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1" aria-sort="ascending"
													aria-label="Name: activate to sort column descending"
													style="width: 83.9844px;">선택</th>
                                            	<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 83.9844px;">순서</th>
                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
													colspan="1" aria-label="Office: activate to sort column ascending"
													style="width: 169.438px;">입고 코드</th>
                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
													colspan="1" aria-label="Age: activate to sort column ascending"
													style="width: 169.438px;">회사</th>
                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1"
													aria-label="Start date: activate to sort column ascending"
													style="width: 402.906px;">상세정보</th>
                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
													colspan="1" aria-label="Salary: activate to sort column ascending"
													style="width: 83.9844px;">수량</th>	
                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
													colspan="1" aria-label="Salary: activate to sort column ascending"
													style="width: 169.438px;">입고일</th>
                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
													colspan="1" aria-label="Salary: activate to sort column ascending"
													style="width: 169.438px;">반품일</th>
                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
													colspan="1" aria-label="Salary: activate to sort column ascending"
													style="width: 169.438px;">상태</th>
                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1"
													colspan="1" aria-label="Salary: activate to sort column ascending"
													style="width: 169.438px;">거래명세서여부</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${in.inList}" var="in" varStatus="num">
                                               <tr class="odd" role="row">
                                            	<td class="sorting_1"><input type="checkbox" name="iocheck" value="${in.io_id},${in.obtain_no},${in.io_status},${in.io_quantity},${in.ma_id}"></td>
                                            	<td>${startIndex + num.index}</td>
                                                <td>io-${in.io_id}</td>
                                                <td>${in.partner_companyname}</td>
                                                <td>${in.io_information}</td>
                                                <td>${in.io_quantity}</td>
                                                <td>${in.io_date}</td>
                                                <td>${in.io_retrun_date ? in.io_retrun_date : '-'}</td>
                                                <td>${in.io_status}</td>
                                                <td><a onclick=" billing('${in.invoice_issuance_status}','${in.obtain_no}')">${in.invoice_issuance_status}</a></td>
                                            </tr>
                                            
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                            	<th rowspan="1" colspan="1">선택</th>
                                            	<th rowspan="1" colspan="1">순서</th>
												<th rowspan="1" colspan="1">입고 코드</th>
                                                <th rowspan="1" colspan="1">회사</th>
                                                <th rowspan="1" colspan="1">상세정보</th>
                                                <th rowspan="1" colspan="1">수량</th>
                                                <th rowspan="1" colspan="1">입고일</th>
                                                <th rowspan="1" colspan="1">반품일</th>
                                                <th rowspan="1" colspan="1">상태</th>
                                                <th rowspan="1" colspan="1">거래명세서여부</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    </form>
                                    
                                      <div class="info-pagination-container">
					                        <div class="dataTables_info" id="example_info" role="status" aria-live="polite">
					                            Showing ${in.pageVO.startPage} to ${in.pageVO.endPage} of ${in.pageVO.total} entries
					                        </div>
					
					                        <ul class="pagination pagination-xs pagination-gutter">
					                            <c:if test="${in.pageVO.prev}">
					                                <li class="paginate_button start-button"><a href="?pageNum=1">START</a></li>
					                            </c:if>
					                            <c:if test="${in.pageVO.pageNum > 1}">
					                                <li class="page-item page-indicator"><a class="page-link" href="?pageNum=${in.pageVO.pageNum - 1}"><i class="icon-arrow-left"></i></a></li>
					                            </c:if>
					                            <c:forEach var="num" begin="${in.pageVO.startPage}" end="${in.pageVO.endPage}">
					                                <li class="page-item ${in.pageVO.pageNum == num ? 'active' : ''}">
					                                    <a class="page-link" href="?pageNum=${num}">${num}</a>
					                                </li>
					                            </c:forEach>
					                            <c:if test="${in.pageVO.pageNum < in.pageVO.total}">    
					                                <li class="page-item page-indicator"><a class="page-link" href="?pageNum=${in.pageVO.pageNum + 1}"><i class="icon-arrow-right"></i></a></li>
					                            </c:if>
					                            <c:if test="${in.pageVO.next}">
					                                <li class="paginate_button"><a href="?pageNum=${in.pageVO.total}">END</a></li>
					                            </c:if>
					                        </ul>
					                    </div>
										
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    

					
					<form id="actionForm" action="information" method="get">
						<input type="hidden" name="pageNum" value="${in.pageVO.pageNum }">
					</form>	
                    
<!--modal page-->
                	<div id="modal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
  							<div class="modal-dialog modal-lg">
    							<div class="modal-dialog modal-lg">
    								<div class="modal-content" >
							 			<div class="modal-header">
                                             <h5 class="modal-title">발주리스트 조회</h5>
                                             <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                             </button>
                                         </div>
      						<div class="modal-body">
      							<table id="example" class="display" style="min-width: 845px; color:black;">
                                        <thead>
                                            <tr>
                                            	<th align="center"> ◎ </th>
                                                <th>조달번호</th>
                                                <th>자재명</th>
                                                <th>규격</th>
                                                <th>조달량</th>
                                                <th>단위</th>
                                                <th>납기일</th>
                                                <th>담당자</th>
                                            </tr>
                                        </thead>
                                        
                                        <c:forEach items="${list}" var="list">
                                        <tbody >
                                      
                                            <tr>
                                            	<td>
   													 <input type="radio" name="obtain" id="obtain_no${list.obtain_no}"  
       	 												value='{
            													"obtain_no":"${list.obtain_no}",
            													 "user_id":"${list.user_id}",
            													"quantity":"${list.obtain_quantity}",
            													"deliveryDate":"${list.obtain_deliveryDate}",
            													 "status":"${list.obtain_status}",
            													"production":"${list.production_no}",
            													 "ma_id":"${list.ma_id}",
            													 "name":"${list.materialVO.ma_name}",
            													 "price":"${list.materialVO.ma_price}",
            													 "unit":"${list.materialVO.ma_unit}",
            													"specifications":"${list.materialVO.ma_specifications}"
        												}'>
												</td>
												<td>ob-${list.obtain_no}</td>
                                                <td>${list.materialVO.ma_name}</td>
                                                <td>${list.materialVO.ma_specifications}</td>
                                                <td>${list.obtain_quantity}</td>
                                                <td>${list.materialVO.ma_unit}</td>
                                                <td>${list.obtain_deliveryDate}</td>
                                                <td>${list.user_id}</td>
                                            </tr>
                                        </tbody>
                                       </c:forEach>
                              		</table>
      							</div>
      							<div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary" onclick="getlist()">Submit</button>
                                                </div>
    							</div>
    						</div>
  					 	</div>
					</div><!--모달 끝-->
                	
                	
                </div>
      			
      		
      		</div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->   
     
       <%@include file="../include/footer.jsp" %>
     
        <!--**********************************
            Footer end
        ***********************************-->

        <!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->


    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="${contextPath}/resources/vendor/global/global.min.js"></script>
    <script src="${contextPath}/resources/js/quixnav-init.js"></script>
    <script src="${contextPath}/resources/js/custom.min.js"></script>

    <script src="${contextPath}/resources/vendor/highlightjs/highlight.pack.min.js"></script>
    <!-- Circle progress -->
    <style>
  .select-part{
 	margin-left: 20px;
 	margin-right: 5px;
 	
  }

  .card-search{
       border-color: #eaeaea;
    	position: relative;
    	background: transparent;
   	 	padding: 1.25rem 1.25rem 5px;
    	display: flex;
    	align-items: center;
    	border: 0px;
  }
  
  .modal-lg {
    max-width: 64%; /* 원하는 너비로 조정 */
	}
	
   a {
           text-decoration: none;
           color: black;
           padding: 5px;
       }

       a:hover {
           color: blue;
           background-color: #f0f0f0;
           cursor: pointer;
       }
     
       
	
  
  /*paging css*/
  
  .pagination-container {
    text-align: center; /* 가운데 정렬 */
    margin-top: 20px; /* 테이블과의 간격 */
}

.pagination-container ul {
    list-style-type: none; /* 기본 불릿 제거 */
    padding: 0;
    margin: 0;
    display: inline-block; /* ul을 inline-block으로 만들어 가운데 정렬 가능 */
}

.pagination-container li {
    display: inline; /* li를 inline으로 설정 */
    margin: 0 5px; /* 각 페이지 링크 사이의 간격 */
}

.pagination-container a {
    text-decoration: none; /* 링크의 밑줄 제거 */
    color: #007bff; /* 링크 색상 설정 */
}

.pagination-container a:hover {
    text-decoration: underline; /* 링크에 호버 시 밑줄 추가 */
}

.pagination_container .active a {
    font-weight: bold; /* 현재 페이지는 굵게 표시 */
}
  
}

/* 테이블 전체 스타일 */
        .table {
            width: 100%; /* 테이블 너비를 100%로 설정 */
        }
        /* td의 너비 조정 */
        td {
            padding: 8px;
        }
        /* input 및 textarea의 너비 조정 */
        input[type="text"], input[type="date"], textarea {
            width: 100%; /* td에 맞춰서 너비를 100%로 설정 */
            box-sizing: border-box; /* 패딩과 테두리를 포함한 너비 계산 */
        }
        
        .info-pagination-container {
		    display: flex;
		    justify-content: space-between; /* 아이템들 사이에 공간을 균등하게 배분 */
		    align-items: center; /* 아이템들을 세로로 가운데 정렬 */
		    margin-top: 25px; /* 필요에 따라 여백 조정 */
		}
		
		.dataTables_info {
		    margin-right: 20px; /* 페이징 버튼과의 간격 조정 */
		    
		}
		
		.pagination .paginate_button.start-button {
		    margin-right: 10px; /* 원하는 간격 값 (예: 20px) */
		    
		}
	    modal-dialog {
	        max-width: 100%;
	        margin: 0;
	        padding: 0;
	    }

	    .modal-content {
	        max-height: 80vh; /* Maximum height of the modal content */
	        overflow-y: auto; /* Scroll vertically if content overflows */
	        width: auto;
	    }
	    
	    .btn-outline-success {
    	color: #7ED321;
    	border-color: #454545;
		}
		.btn-outline-warning {
		    color: #FFAA16;
		    border-color: #454545;
		}
		.btn-outline-dark {
		    color: #454545;
		    border-color: #454545;
		}		
	
	
	</style>
	<script type="text/javascript">
    const modal = document.querySelector("#modal");
    const btn = document.querySelector("#modal-btn");
    const close = document.getElementById("close");
    const f_btn = document.getElementById("insert-btn");
    const io_btn = document.getElementById("io-check-btn");
    const billing_btn = document.getElementById("transaction-btn");
	
    
    //개별
    function billing(status,obtainNo){
    	obtainNo= parseInt(obtainNo,10);
    	
    	  if (status === "발행" && obtainNo> 0) {
    	        // 발행 상태일 때 처리할 로직
    	        const options = 'width=700, height=800, top=100, left=600, scrollbars=yes';
    	        
    	        const url = 'transaction?'+'obtain_no='+ encodeURIComponent(obtainNo);
                        // 각 체크박스에 대해 개별 팝업창 열기
                        window.open(url, '_blank', options);
    	       
    	        // 여기에 원하는 로직을 추가하세요.
    	    } else {
    	        // 발행 상태가 아닐 때 아무 반응도 없음
    	        alert("거래명세서가 발급 되지 않았습니다.");
    	    }    	
    	
    }
    
    //전체 거래명세서
    billing_btn.onclick = function() {
        var checkboxes = document.querySelectorAll('input[name="iocheck"]:checked');

        if (checkboxes.length > 0) {
            var list = [];
            // 모든 체크박스의 상태를 리스트에 추가합니다.
            checkboxes.forEach(function(checkbox) {
                var pop = checkbox.value.split(",");
                if (pop.length === 5) {
                    list.push({
                        io_status: pop[2]
                    });
                }
            });

            // 리스트의 모든 항목이 '입고중'인지 확인합니다.
            var check = list.every(function(item) {
                return item.io_status === '입고완료';
            });

            if (check) {
                // 선택된 체크박스의 값을 배열로 수집합니다.
                checkboxes.forEach(function(checkbox) {
                    var pop = checkbox.value.split(",");
                    if (pop.length === 5) {
                        var obtain_no = pop[1];
                        var io_status = pop[2];

                        // 각각의 팝업창을 띄웁니다.
                        var queryString = 'obtain_no=' + encodeURIComponent(obtain_no);
                        const options = 'width=700, height=800, top=100, left=600, scrollbars=yes';
                        // 각 체크박스에 대해 개별 팝업창 열기
                        window.open('transaction?' + queryString, '_blank', options);
                        var not = document.getElementsByName("iocheck");
                    	
                    	for(var i=0 ; i<not.length; i++){
                    		not[i].checked=false;
                    	}
                       console.log(checkbox);
                    }
                });
            } else {
            	
				var not = document.getElementsByName("iocheck");
            	
            	for(var i=0 ; i<not.length; i++){
            		not[i].checked=false;
            	}
            	
                alert("선택 중 거래명세서가 없는 값이 포함되어 있습니다.");
            }
        } else {
            alert("선택된 값이 없습니다.");
        }
    };

    //검수완료, 거래명세서, 구매발주서 활성화 
    io_btn.onclick = function() {
        var checkboxes = document.querySelectorAll('input[name="iocheck"]:checked');
        
        // 선택된 체크박스의 값을 배열로 수집합니다.
        var selectedData = [];
        checkboxes.forEach(function(checkbox) {
            var values = checkbox.value.split(",");
            if (values.length === 5) {
                selectedData.push({
                    io_id: values[0],
                    obtain_no: values[1],
                    io_status: values[2],
                    io_quantity: values[3],
                    ma_id: values[4]
                });
            }
        });

        if (selectedData.length > 0) {
            var itemcheck = selectedData.every(function(item) {
                return item.io_status === '입고중';
            });
            
            if (itemcheck) {
            	
            	document.querySelectorAll('input[type="hidden"][name="selectedItems"]').forEach(input => input.remove());
            	
            	  // 체크된 값을 hidden input 필드로 추가
                selectedData.forEach(data => {
                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = 'iocheck'; // 서버에서 받는 이름
                    input.value = `${data.io_id},${data.obtain_no},${data.io_status},${data.io_quantity},${data.ma_id}`;
                    document.getElementById("io_check_status").appendChild(input);
                });
            	
                document.getElementById("io_check_status").submit();
                
            } else {
            	var not = document.getElementsByName("iocheck");
            	
            	for(var i=0 ; i<not.length; i++){
            		not[i].checked=false;
            	}
                alert("이미 처리된 데이터가 존재합니다.");
            }
        } else {
            alert("선택된 값이 없습니다.");
        }
    }

    // 포커스
    f_btn.onclick = function() {
        const imformation = document.getElementById("io_information");
        const date = document.getElementById("in_date");
        const input = document.getElementById("inp-1");

        if (imformation.value.trim() === '' || date.value.trim() === '' || input.value.trim() === '') {
            if (input.value.trim() === '') {
                alert("조달데이터를 불러와주세요");
            } else if (date.value.trim() === '') {
                date.focus();
            } else {
                imformation.focus();
            }
            alert("빈 값을 채워주세요.");
        } else {
            document.getElementById("insert_in").submit();
            document.getElementById('insert_in').reset();
        }
    }

   

    function getlist() {
        var selectedRadio = document.querySelector('input[name="obtain"]:checked');
        if (selectedRadio) {
            var selectedValue = JSON.parse(selectedRadio.value);

            document.getElementById('inp-1').value = selectedValue.obtain_no;
            document.getElementById('io_status').value = selectedValue.status;
            document.getElementById('io_quantity').value = selectedValue.quantity;
            document.getElementById('invoice_issuance_status').value = '미발행';
            document.getElementById('ma_name').value = selectedValue.name;
            document.getElementById('ma_id').value = selectedValue.ma_id;
            document.getElementById('ma_price').value = selectedValue.price;
            document.getElementById('obtain_no').value = selectedValue.obtain_no;
            document.getElementById('production_no').value = selectedValue.production;

            $('#modal').modal('hide');
            
           $('.modal-backdrop').remove();

            // 포커스를 다시 활성화
            //$('body').removeClass('modal-open');
        } else {
            alert("선택된 항목이 없습니다.");
        }
    }

    var result = '${msg}'; // 이 부분은 서버에서 JSP로 전달된 변수를 가져오는 것 같습니다.
    
    if (result === 'success') {
        alert("입고처리 되었습니다. 리스트 목록을 확인해주세요");
    } else if (result === 'plus') {
        alert("입고완료");
    }else if (result === 'hu') {
        alert("입고실패!! 데이터가 잘 전달되지 못했습니다.");
    }
    	
    
    
    function resetForm() {
        document.getElementById('insert_in').reset();
    }
    
    //
    
    $(document).ready(function(){
    $(".paginate_button a").on("click",function(e){
        e.preventDefault();
        var actionForm = $('#actionForm');
        actionForm.find("input[name='pageNum']").val($(this).attr("href").split("pageNum=")[1]);
        actionForm.submit();
    });
});
    <!-- io_status와 회사명에 다른 필터링  -->
    var iostatus = ''; // 입고상태 체크하는 변수

    // 입고상태의 value 받는 함수
    document.getElementById('selectstatus').addEventListener('change', function() {
        iostatus = this.value; // 선택된 값을 iostatus 변수에 저장
    });

    // 검색
    function searchio(pageNum) {
        const iostatus = $('#selectstatus').val();
        const companyname = $('#searchCompanyname').val();
        loadio(pageNum, iostatus, companyname);
    }//end

    // 초기화 함수
    function resetsearch() {
        $('#selectstatus').val('');
        $('#searchCompanyname').val('');
        loadio(1, '', ''); // 첫 페이지로 초기화
    } 
    
    // 페이징 로드 pageNum: 값을 가지고 올때 시작페이지
function loadio(pageNum, iostatus, companyname) {
    $.ajax({
        url: '<c:url value="inselect" />',
        type: 'GET',
        data: { pageNum: pageNum, io_status: iostatus, partner_companyname: companyname }, 
        success: function(data) {
            const pagination = $(data).find('.col-12').html();
            $('.col-12').html(pagination);
            //console.log($('#informatio tbody').html()); // 업데이트된 내용 확인
            //입력한 값유지
            $('#selectstatus').val(iostatus);
            $('#searchCompanyname').val(companyname);
            
        },
        error: function() {
            alert('오류가 발생했습니다.');
        }
    });
}
    
</script> 
</body>

</html>