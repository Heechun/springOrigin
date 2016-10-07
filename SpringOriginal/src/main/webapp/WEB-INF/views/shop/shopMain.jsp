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
<!-- 							<label class="btn btn-primary cart">Cart</label> -->
							<a class="btn btn-primary cart" href="#" role="button" data-toggle="modal" data-target="#cartModal">Cart</a>
							<a href="#" class="btn btn-warning" role="button">Like</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content text-center">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">장바구니에 추가 되었습니다.</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">Keep shopping</button>
        <button type="button" class="btn btn-primary" onclick="goCart()">Go to cart</button>
      </div>
    </div>
  </div>
</div>
<script>

	var cartClickCheck = false;
	$(function(){
		$("title").text($("title").text()+" | "+$("h1").text());
	});
	$('#cartModal').on('shown.bs.modal', function () {
	});
	$('.thumbnail').hover(function(){
		$(this).addClass("gallery-color");
	});
	$('.thumbnail').mouseleave(function(){
		$(this).removeClass("gallery-color");
	});
	$('.cart').click(function(){
		cartClickCheck = true;
		var cartItemNum = $(this).parent().parent().parent().children('p').text();
		$.get("cartPut.do?cartItemNum="+cartItemNum);
	});
	function goCart(){
		location.href="cartList.do";
	};
	$('.thumbnail').click(function(){
		if(cartClickCheck===false){
			var itemNum = $(this).children('#itemNum').text();
			location.href="shopContent.do?itemNum="+itemNum; 
		}
		else{
			cartClickCheck = false;
		}
	});
	$('#addItem').click(function(){
		location.href="admin/addItem.do";
	});

	
</script>
</body>
</html>