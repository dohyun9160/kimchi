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

               <div class="col-lg-12">

                <div class="card">

                    <div class="card-header">

                        <h4 class="text-center mb-4">게 시 판</h4> 
                    </div>

                    <div class="card-body">

                       <div class="form-validation">


                        <div class="box-body">

                            <div class="form-group form-group row">
                           <label class="col-lg-2 col-form-label" for="exampleInputEmail1">Title</label>
                           <div class="col-lg-5">
                           <input type="text" name="board_title" class="form-control input-default" value="${boardVO.board_title}" readonly="readonly">
                       </div>
                       </div>

                       <div class="form-group form-group row">
                          <label class="col-lg-2 col-form-label" for="exampleInputPassword1">Content</label>
                          <textarea class="form-control" name="board_content" rows="12" cols="80"  readonly="readonly">
                          ${boardVO.board_content}</textarea>
                      </div>

                      <div class="form-group">
                        <label for="exampleInputEmail1">Comment</label>
                        <input type="text" name="board_comment" class="form-control" value="${boardVO.board_comment}" readonly="readonly">

                    </div>


                </div>
                <!-- /.box-body -->




                <div class="box-footer">

                 <button type="submit" class="btn btn-warning modifyBtn">Modify</button>
                 <button type="submit" class="btn btn-danger removeBtn">REMOVE</button>
                 <button type="submit" class="btn btn-primary goListBtn">GO LISTL</button>    
             </div>

             <form role="form"action="modifyPage" method="post">

                 <input type='hidden' name='board_no' value="${boardVO.board_no}">
                 <input type='hidden' name='page' value ="${cri.page}">
                 <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
                 <input type='hidden' name='searchType' value="${cri.searchType}">
                 <input type='hidden' name='keyword' value="${cri.keyword}">

             </form>

         </div>

         <%-- form-validation --%>

     </div>

     <%-- card-body --%>

 </div>

 <%-- card --%>

</div>

<%-- col-lg-12 --%>

</div>

<%-- content-body --%>

<script>

    $(document).ready(function(){

       var formObj = $("form[role='form']");

       console.log(formObj);


       $(".btn-warning").on("click",function(){
          formObj.attr("action","/sboard/modifyPage");
          formObj.attr("method", "get");
          formObj.submit();
      });

       $(".btn-danger").on("click",function(){
          formObj.attr("action","/sboard/removePage");
          formObj.submit();
      });

       $(".btn-primary").on("click",function(){
          formObj.attr("method","get");
          formObj.attr("action", "/sboard/list");
          formObj.submit();
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