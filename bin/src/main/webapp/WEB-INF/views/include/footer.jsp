<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!--**********************************
            Content body end
        ***********************************-->

<!--**********************************
            Footer start
        ***********************************-->

<div class="footer">

	<div class="row"
		style="display: flex; justify-content: center; align-items: center; text-align: center;">
		 <div class="col-lg-12">  
		<br>
			<ul class="contact-info font-alt"
				style="list-style: none; padding: 0; margin: 0; display: flex; justify-content: center;">
				<li style="margin: 0 15px;"><a
					href="mailto:thdns95@gmail.com">official@3kimshinjoyou.com</a></li>
				<li style="margin: 0 15px;"><a href="#">+(82) 031 253-5225</a></li>
				<li style="margin: 0 15px;"><a href="/include/map">경기도 수원시 팔달구 덕영대로 899</a></li>
			</ul>
			<div class="copyright text-center font-alt" style="margin-top: 30px;">
				© 2017 <a href="#">삼김신조유</a>, All Rights Reserved.
			</div>
		</div>
	</div>


	<div class="copyright">
		<p>
			Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a>
			2019
		</p>
	</div>
</div>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>

</html>