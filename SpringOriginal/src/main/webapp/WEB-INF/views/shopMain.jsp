<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="false"/>
	<div class="container">
		<h1 class="text-center">Shop</h1>
		<div class="row">
		  <div class="col-sm-6 col-md-4">
		    <div class="thumbnail">
		      <img src="resources/images/image_01.jpg" alt="...">
		      <div class="caption">
		        <h3>Thumbnail label1</h3>
		        <p>...</p>
		        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="shopContent.do" class="btn btn-default" role="button">Button</a></p>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-6 col-md-4">
		    <div class="thumbnail">
		      <img src="resources/images/image_02.jpg" alt="...">
		      <div class="caption">
		        <h3>Thumbnail label2</h3>
		        <p>...</p>
		        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
		      </div>
		    </div>
		  </div>
	  </div>
	</div>
	<script>
	$(function(){
		$("#title").text($("h1").text());
	});
	$('div>img').hover(function(){
		$(this).parent().addClass("gallery-color");
	});
	$('div>img').mouseleave(function(){
		$(this).parent().removeClass("gallery-color");
	});
	</script>
	</body>
</html>