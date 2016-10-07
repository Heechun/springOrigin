<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush="false"/>
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
	    <label for="itemPrice">주문자 주소</label></br>
	    <input type="text" id="company_postcode" placeholder="우편번호">
		<input type="button" onclick="find_location()" value="우편번호 찾기" class="btn btn-warning btn-sm" onclick="find_location()"><br>
		<input type="text" placeholder="주소" class="form-control" id="company_raw_location" name="orderClientAddress">

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
	  	<form role="form" action="#" method="POST">
	  <div class="form-group pull-right">
	    <input type="submit" class="btn btn-primary" value="Order"/>
	    <button onclick="goHome()" class="btn btn-danger">cancel</button>
	  </div>
	</form>
	  </div>
	</div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function goHome(){
		location.href="main.do";
	};
	function find_location() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                    fullAddr += ' ';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('company_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('company_raw_location').value = fullAddr;
				
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('company_raw_location').focus();
            }
        }).open();
    }
</script>
</body>
</html>