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
        
        
  <%@include file="../include/nav.jsp" %>
        
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
       
        <div class="content-body">
     
    <table class="table table-bordered">
    <tr>
    
    <th style="width: 10px">BNO</th>
    <th>TITLE</th>
    <th>CONTENT</th>
    <th>COMMENT</th>
    <th style="width: 40px">REGDATE</th>
    
    
    </tr>
    
    <c:forEach items="${list}" var="boardVO">
    
    <tr>
     <td>${boardVO.board_no}</td>
     <td><a href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&board_no=${boardVO.board_no}'>${boardVO.board_title}</a></td>  
     <td>${boardVO.board_content}</td>
     <td>${boardVO.board_comment}</td>
     <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" 
     value= "${boardVO.board_createdDate}"/></td>
     <td><span class="badge bg-red"></span></td>
    </tr>
    
    </c:forEach>
    
    
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
    <li><a href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
  </c:if>
  
  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
    <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
     <a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
    </li>
  </c:forEach>
  
  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    <li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a></li>
  </c:if>
  
  </ul>
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

</body>

</html>