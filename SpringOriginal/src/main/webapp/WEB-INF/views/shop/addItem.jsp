<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush="false"/>
<div class="container">
	<h2>Item register</h2>
	<form role="form" action="addItemImpl.do" method="POST" enctype="multipart/form-data">
	  <div class="form-group">
	    <label for="itemName">Item name</label>
	    <input type="text" class="form-control" id="itemName" name="itemName">
	  </div>
	  <div class="form-group">
	    <label for="itemPrice">Item price</label>
	    <input type="text" class="form-control" id="itemPrice" name="itemPrice">
	  </div>
	  <div class="form-group">
	    <label for="itemCount">Item count</label>
	    <input type="text" class="form-control" id="itemCount" name="itemCount">
	  </div>
	  <div class="form-group">
	    <label for="itemContent">Item content</label>
	    <textarea name="itemContent" id="itemContent" class="form-control" cols="30" rows="10"></textarea>
	  </div>
	  <div class="form-group">
	    <label for="itemImages">Item images</label>
	    <input type="file" id="itemImages" name="itemImages" multiple="multiple">
	  </div>
	  <div class="form-group">
	    <input type="submit" class="btn btn-primary" value="Add"/>
	    <button type="reset" class="btn btn-danger">reset</button>
	  </div>
	</form>
	
</div>
</body>
<script>
$(function(){
	$("title").text($("title").text()+" | "+$("h2").text());
});
</script>
</html>