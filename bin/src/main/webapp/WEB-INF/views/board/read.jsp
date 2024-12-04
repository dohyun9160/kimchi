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
     
     <form role="form" method="post">
     
     <input type='hidden' name='board_no' value="${boardVO.board_no}">
     
     </form>

      <div class="box-body">
      
      <div class="form-group">
         <label for="exampleInputEmail1">Title</label>
         <input type="text" name="board_title" class="form-control" value="${boardVO.board_title}" readonly="readonly">
      </div>
      
      <div class="form-group">
          <label for="exampleInputPassword1">Content</label>
          <textarea class="form-control" name="board_content" rows="3" readonly="readonly">
          ${boardVO.board_content}</textarea>
      </div>
      
      <div class="form-group">
        <label for="exampleInputEmail1">Comment</label>
          <input type="text" name="board_comment" class="form-control" value="${boardVO.board_comment}" readonly="readonly">
      
      </div>
      
           
      </div>
      <!-- /.box-body -->

     <div class="box-footer">
       
       <button type="submit" class="btn btn-warning">Modify</button>
       <button type="submit" class="btn btn-danger">REMOVE</button>
       <button type="submit" class="btn btn-primary">LIST ALL</button>    
     </div>

     
        </div>
        
        
   <script>
        
        $(document).ready(function(){
        	
        	var formObj = $("form[role='form']");
        	
        	console.log(formObj);
        	
        	
        	$(".btn-warning").on("click",function(){
        		formObj.attr("action","/board/modify");
        		formObj.attr("method", "get");
        		formObj.submit();
        	});
        	
        	$(".btn-danger").on("click",function(){
        		formObj.attr("action","/board/remove");
        		formObj.submit();
        	});
        	
        	$(".btn-primary").on("click",function(){
        		self.location = "/board/listAll";
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