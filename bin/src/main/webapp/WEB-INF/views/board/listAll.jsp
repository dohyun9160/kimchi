<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

  <%@include file="../include/header.jsp" %>
  
        <div class="content-body">
        
 <style>
    .pagination {
        display: flex;
        justify-content: center; 
        margin: 20px 0; 
    }
    .pagination a, .pagination strong {
        margin: 0 5px; /* 각 페이지 링크 간격 */ 
        text-decoration: none; /* 링크 스타일 제거 */
        color: #07020d; /* 링크 색상 (선택적) */
    }

    .pagination a:hover {
        text-decoration: underline; /* 마우스 오버 시 밑줄 */
    }
</style>
     
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
     <td><a href='/board/read?board_no=${boardVO.board_no}'>${boardVO.board_title}</a></td>  
     <td>${boardVO.board_content}</td>
     <td>${boardVO.board_comment}</td>
     <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" 
     value= "${boardVO.board_createdDate}"/></td>
     <td><span class="badge bg-red"></span></td>
    </tr>
    
    </c:forEach>
    
    
    </table>  
    
    <!-- Pagination -->
	<div class="pagination">
	    <c:if test="${currentPage > 1}">
	        <a href="?pageNum=${currentPage - 1}">이전|</a>
	    </c:if>
	
	    <c:forEach var="page" begin="1" end="${totalPages}">
	        <c:choose>
	            <c:when test="${page == currentPage}">
	                <strong>${page}</strong>
	            </c:when>
	            <c:otherwise>
	                <a href="?pageNum=${page}">${page}</a>
	            </c:otherwise>
	        </c:choose>
	    </c:forEach>
	
	    <c:if test="${currentPage < totalPages}">
	        <a href="?pageNum=${currentPage + 1}">|다음</a>
	    </c:if>
	</div>
      
      <script>
      
      var result = '${msg}';
      
      if (result == "SUCCESS") {
		alert("처리가 완료되었습니다.");
	}
      
      </script>
      
        
         </div>
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
     
       <%@include file="../include/footer.jsp" %>


  