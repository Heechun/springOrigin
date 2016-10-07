<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp" flush="false"/>
<div class="container">
	<h2>장바구니 내역</h2>
	
	<c:forEach var="cartItemList" items="${cartItemList}">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">장바구니 내역</h3>
			</div>
			<div class="panel-body">
				<p>장바구니 번호 ${cartItemList.cartNum}</p>
				<p>물품 번호 ${cartItemList.cartItemNum} 물품 이름 ${cartItemList.cartItemName}</p>
				<p>물품 갯수 ${cartItemList.cartItemCount} 물품 가격 ${cartItemList.cartItemPrice}</p>
				<p>총 가격 ${cartItemList.cartItemPrice*cartItemList.cartItemCount}</p>
			</div>
			<div class="panel-footer">
				<button>삭제</button>
			</div>
		</div>
	</c:forEach>
</div>
<script>
$(function(){
	$("title").text($("title").text()+" | "+$("h2").text());
});
</script>
</body>
</html>