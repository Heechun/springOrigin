<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <jsp:include page="../header.jsp" flush="false"/>
<div class="col-md-8 col-md-offset-2">
	<div class="container">
		<div class="col-md-8 col-md-offset-2 panel">
			<h1 class="text-center page-header">noName?</h1>
			<div>
				<h2>Introducing of noName</h2>
				<br />
				<div class="col-md-5">
					<img src="resources/images/group1.jpg" alt="CEO picture" />
				</div>
				<div class="col-md-7">
					<p>noName is site of anonymous.</p>
					<p>We made it.</p>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	$("title").text($("title").text()+" | "+$("h1").text());
});
</script>
</body>
</html>