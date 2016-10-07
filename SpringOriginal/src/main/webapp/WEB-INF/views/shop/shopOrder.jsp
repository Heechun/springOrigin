<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush="false"/>
<link href="resources/css/fotorama.css" rel="stylesheet">
<script src="resources/js/fotorama.js"></script>
<div class="container">
	<h1>상품주문</h1>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">주문내역</h3>
	  </div>
	  <div class="panel-body">
	  <div class="col-md-3 col-md-offset-1">
	  	<img class="shopOrderImage" src="resources/images/image_03.jpg" alt="" />
	  </div>
	  <div class="col-md-3 col-md-offset-5">
	  	<p>가격 : ${orderVO.orderItemPrice} 갯수 : ${orderVO.orderItemCount}</p>
	  	<p>택배비 : ${orderVO.orderShipping}</p>
	  	<p>총합 : ${orderVO.orderItemPrice}*${orderVO.orderItemCount} = ${orderVO.orderItemPrice*orderVO.orderItemCount}</p>
	  	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;&nbsp;${orderVO.orderShipping}</p>
	  	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = ${orderVO.orderTotalPrice}</p>
	  </div>
	  </div>
	</div>
	<div class="panel panel-warning">
	  <div class="panel-heading">
	    <h3 class="panel-title">주문자 정보</h3>
	  </div>
	  <div class="panel-body">
	  	<form role="form" action="addItemImpl.do" method="POST" enctype="multipart/form-data">
	  <div class="form-group">
	    <label for="itemName">주문자 이름</label>
	    <input type="text" class="form-control" id="orderClientName" name="orderClientName">
	  </div>
	  <div class="form-group">
	    <label for="itemCount">주문자 핸드폰 번호</label>
	    <input type="text" class="form-control" id="orderClientPhone" name="orderClientPhone" placeholder="ex) 010-OOOO-OOOO">
	  </div>
	  <div class="form-group">
	    <label for="itemPrice">주문자 주소</label>
	    <input type="text" class="form-control" id="orderClientAddress" name="orderClientAddress">
	  </div>
	  <div class="form-group">
	    <label for="itemContent">주문 메모</label>
	    <textarea name="itemContent" id="itemContent" class="form-control" rows="5"></textarea>
	  </div>
	</form>
	  </div>
	</div>
	<div class="panel panel-success">
	  <div class="panel-body">
	  	<form role="form" action="addItemImpl.do" method="POST" enctype="multipart/form-data">
	  <div class="form-group">
	    <input type="submit" class="btn btn-primary" value="Order"/>
	    <button type="reset" class="btn btn-danger">reset</button>
	  </div>
	</form>
	  </div>
	</div>
</div>
</body>
</html>