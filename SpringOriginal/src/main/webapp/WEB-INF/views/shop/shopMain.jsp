<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp" flush="false"/>
<div class="container">
	<input type="button" class="btn btn-success pull-right" id="addItem" value="Add Item"/>
	<h1 class="text-center">Shop</h1>
	<div class="row">
		<c:forEach var="itemList" items="${itemList}">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<p class="hidden" id="itemNum">${itemList.itemNum}</p>
					<img src="resources/images/image_02.jpg" alt="...">
					<div class="caption text-center">
						<h3>${itemList.itemName}</h3>
						<p>가격 : ${itemList.itemPrice}</p>
						<p>판매량 : ${itemList.itemSellCount}</p>
						<p class="text-right">
							<a href="#" id="cartBtn" class="btn btn-primary" role="button">Cart</a>
							<a href="#" class="btn btn-warning" role="button">Like</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<script>
	$(function(){
		$("title").text($("title").text()+" | "+$("h1").text());
	});
	$('.thumbnail').hover(function(){
		$(this).addClass("gallery-color");
	});
	$('.thumbnail').mouseleave(function(){
		$(this).removeClass("gallery-color");
	});
	$('.thumbnail').click(function(){
		var itemNum = $(this).children('#itemNum').text();
		location.href="shopContent.do?itemNum="+itemNum;
	});
	$('#addItem').click(function(){
		location.href="admin/addItem.do";
	});
	$("#cartBtn").click(function(){
		location.href="shopCart.do"
	});
</script>
</body>
</html>