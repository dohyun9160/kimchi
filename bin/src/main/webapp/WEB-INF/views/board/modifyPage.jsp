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
        
        
  <%@include file="../include/nav.jsp" %>
        
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
     
     
     <form role="form" action="modifyPage" method="post">
     
       <input type='hidden' name='page' value= "${cri.page}">
       <input type='hidden' name='perPageNum' value= "${cri.perPageNum}">
     
     
     <div class="box-body">
     
     <div class="form-group">
       <label for="exampleInputEmail1">BNO</label>
       <input type="text" name='board_no' class="form-control" value="${boardVO.board_no}" readonly="readonly">
     </div>
     
     <div class="form-group">
       <label for="exampleInputEmail1">TITLE</label>
        <input type="text" name='board_title' class="form-control" value="${boardVO.board_title}">
     </div>
     
     <div class="form-group">
       <label for="exampleInputEmail1">Content</label>
       <textarea class="form-control" name="board_content" rows="3">${boardVO.board_content}</textarea>
     </div>
     
     <div class="form-group">
       <label for="exampleInputEmail1">Comment</label>
       <input type="text" name='board_comment' class="form-control" value="${boardVO.board_comment} readonly">
     </div>
     
     </div>
    <!-- /.box-body --> 
     
     </form>
     
     <div class="box-footer">
      <button type="submit" class="btn btn-primary">SAVE</button>
      <button type="submit" class="btn btn-warning">CANCLE</button>
     </div>
     
        </div>
        
        <script>

        $(document).ready(function(){
        	
        	var formObj = $("form[role='form']");
        	
        	console.log(formObj);
        
            $(".btn-warning").on("click", function(){
            	self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
            });
        	
            $(".btn-primary").on("click", function(){
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