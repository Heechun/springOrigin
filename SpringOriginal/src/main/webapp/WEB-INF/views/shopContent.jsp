<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="false"/>
<link href="resources/css/fotorama.css" rel="stylesheet">
<script src="resources/js/fotorama.js"></script>
<div class="container">
	<h1>상품소개</h1>
	<div class="fotorama col-md-9">
		<img src="resources/images/image_01.jpg">
		<img src="resources/images/image_02.jpg">
		<img src="resources/images/image_03.jpg">
	</div>
	<form action="shopOrder.do" method="post">
	<div class="col-md-3">
		<p>Product : <span></span></p>
		<p>Price : <span id="price">10000</span></p>
		<p>shipping : 
		<select name="orderShipping" id="shipping">
		  <option value="2500" selected="selected">Normal</option>
		  <option value="5000">Fast</option>
		  <option value="0">FaceToFace</option>
		</select>
		</p>
		<p>Count :
		<input id="count" type="number" placeholder="ex)1, 2..." required="required" value="1" 
		onkeydown="return captureReturnKey(event)" name="orderCount">
		<p/>
		<h4></h4>
	</div>
	<div class="col-md-3 col-md-offset-9">
		<button class="btn btn-primary" >Order</button>
		<input id="backButton" class="btn btn-warning" value="Back to list"/>
	</div>
	</form>
	<div class="col-md-5">
	<h3>자세히 보기</h3>
	<p>sdfsdfs</p>
	</div>
</div>
<script>
function captureReturnKey(e) { 
    if(e.keyCode==13 && e.srcElement.type != 'input'){
    	return false;	
    }
};
$("#backButton").click(function(){
	window.location = "shopMain.do";
});

$(function(){
	var price = Number($("#price").text());
	var shipping = Number($("#shipping").val());
	var count =  Number($("#count").val());
	var letter = "Total price(\\\) : ";
	$("h4").text(letter + Number(price*count+shipping));
	
	$("#shipping").change(function(){
		shipping = Number($("#shipping").val());
		$("h4").text(letter + Number(price*count+shipping));
	});
	
	$("#count").change(function(){
		count = Number($("#count").val());
		$("h4").text(letter + Number(price*count+shipping));
	});

});


</script>
</body>
</html>