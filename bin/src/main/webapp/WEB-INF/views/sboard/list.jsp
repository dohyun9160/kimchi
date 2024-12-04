<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <h4>게시판 리스트</h4>
                                <span class="ml-1">Board List</span>
                            </div>
                        </div>
                        <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Board</a></li>
                                <li class="breadcrumb-item active"><a href="javascript:void(0)">list</a></li>
                            </ol>
                        </div>
                    </div>

                    <!-- row -->


                    <div class="row">  

                      <div class="col-12">

                        <div class="card">


                         <div class="card-header">
                            <h4 class="card-title">Board</h4>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">

                             <table class="table table-responsive-sm">

                                <table id="example" class="table display" style="min-width: 845px">
                                    <thead>
                                        <tr>

                                            <th style="width: 10px">BNO</th>
                                            <th>TITLE</th>
                                            <th>CONTENT</th>
                                            <th>COMMENT</th>
                                            <th style="width: 40px">REGDATE</th>


                                        </tr>
                                    </thead>

                                    <tbody>

                                        <c:forEach items="${list}" var="boardVO">

                                            <tr>
                                             <td>${boardVO.board_no}</td>
                                             <td><a href='/sboard/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&board_no=${boardVO.board_no}'>${boardVO.board_title}</a></td>  
                                             <td>${boardVO.board_content}</td>
                                             <td>${boardVO.board_comment}</td>
                                             <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" 
                                                 value= "${boardVO.board_createdDate}"/></td>
                                             </tr>

                                         </c:forEach>

                                     </tbody>

                                     <tfoot>
                                        <tr>
                                          <th style="width: 10px">BNO</th>
                                          <th>TITLE</th>
                                          <th>CONTENT</th>
                                          <th>COMMENT</th>
                                          <th style="width: 40px">REGDATE</th>
                                      </tr>
                                  </tfoot>

                              </table>  

                          </table>

                          <script>

                              var result = '${msg}';

                              if (result == "SUCCESS") {
                                  alert("처리가 완료되었습니다.");
                              }

                          </script>


                          <div class="text-center">
                            
                              <ul class="pagination">

                                  <c:if test="${pageMaker.prev}">
                                    <li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
                                </c:if>

                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
                                    <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
                                    <a href="list${pageMaker.makeQuery(idx)}">${idx}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                <li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a></li>
                            </c:if>

                        </ul>
                    </div>

                    <div class='box-body'>

                     <select name="searchType" select class="dropdown-groups select2-hidden-accessible" data-select2-id="5" tabindex="-1" aria-hidden="true">

                         <optgroup label="Group Name">

                      <option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>>
                  ---</option>

                  <option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
              Title</option>

              <option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
          Content</option>

          <option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
      Comment</option>

      <option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
  Title or Content</option>

  <option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
Content or Comment</option>

<option value="tcw" <c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
Title or Content or Comment</option>

</optgroup>

</select>


<span class="select2 select2-container select2-container--default select2-container--below select2-container--focus" dir="ltr" data-select2-id="6" style="width: 137px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-49fa-container"><span class="select2-selection__rendered" id="select2-49fa-container" role="textbox" aria-readonly="true" title="Nested option 1"></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>


<input type="text" name='keyword' id="keywordInput" value='${cri.keyword}'>
<button type="button" class="btn btn-primary" id='searchBtn'>Search</button>
<button type="button" class="btn btn-secondary" id='newBtn'>New Board</button>



</div>


<%-- table-responsive-sm --%>
</div>
<%-- table-responsive --%>
</div>
<%-- card-body --%>

</div>
<%-- card --%>
</div>
<%-- col-12 --%>
</div>
<%-- row --%>

</div>
<%-- container-fluid --%>

</div>

<%-- contentbody --%>

<script>

 $(document).ready(function(){

  $('#searchBtn').on("click", function(event){

   self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());

});

  $('#newBtn').on("click", function(ect){

   self.location = "register";

});

});

</script>
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

    </body>

    </html>