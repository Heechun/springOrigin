<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="false"/>
<link href="resources/css/fotorama.css" rel="stylesheet">
<script src="resources/js/fotorama.js"></script>
<div class="container">
	<h1>상품주문</h1>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">주문현황</h3>
	  </div>
	  <div class="panel-body">
	  	<label>가격 : ${orderVo.orderPrice}</label>
	  	<label>갯수 : ${orderVo.orderCount}</label>
	  	<label>택배비 : ${orderVo.orderShipping}</label>
	  	<label>총합 : ${orderVo.orderPrice}*${orderVo.orderCount}+${orderVo.orderShipping} = ${orderVo.orderCount}</label>
	   
	  </div>
	</div>
</div>
</body>
</html>