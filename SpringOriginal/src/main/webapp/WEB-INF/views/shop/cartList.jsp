<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp" flush="false"/>
<div class="container">
	<h2>장바구니 내역</h2>
	
	<c:forEach var="cartItemList" items="${cartItemList}">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">장바구니 내역
				<span id="cartNum" class="pull-right">${cartItemList.cartNum}</span>
				<span class="pull-right">번호</span>
				</h3>
			</div>
			<div class="panel-body">
				<div class="col-md-3 col-md-offset-1">
					<img src="resources/images/good2.png"/>
				</div>
				
				<div class="col-md-6">
				<table class="table table-striped">
					<tbody>
						<tr>
							<td>물품 번호</td>
							<td>${cartItemList.cartItemNum}</td>
						</tr>
						<tr>
							<td>물품 이름</td>
							<td>${cartItemList.cartItemName}</td>
						</tr>
						<tr>
							<td>물품 갯수</td>
							<td>${cartItemList.cartItemCount}</td>
						</tr>
						<tr>
							<td>물품 가격</td>
							<td>${cartItemList.cartItemPrice}</td>
						</tr>
						<tr>
							<td>총 가격</td>
							<td>${cartItemList.cartItemPrice*cartItemList.cartItemCount}</td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
			<div class="panel-footer">
				<button class="btn btn-success center-block delete" value="${cartItemList.cartNum}">삭제</button>
			</div>
		</div>
	</c:forEach>
</div>
<script>
	$(function(){
		$("title").text($("title").text()+" | "+$("h2").text());
	});
	$('.delete').click(function(){
		var $cartNum = $(this);
		location.href="cartDelete.do?cartNum=" + $cartNum.val();
	});
</script>
</body>
</html>