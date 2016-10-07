<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <jsp:include page="../header.jsp" flush="false"/>
<div class="col-md-8 col-md-offset-2">
	<div class="container">
		<div class="col-md-8 col-md-offset-2">
			<h1 class="text-center page-header">noName 소개</h1>
			<div>
				<h2>오시는 길</h2>
				<div id="map" class="col-md-12"></div>
				<p class="text-right" id="companyAddr">서울특별시 송파구 백제고분로 69</p>
			</div>
		</div>
		
	</div>
</div>
<script src="//apis.daum.net/maps/maps3.js?apikey=3283fe99558bf610a870f5a13f06c452"></script>
	<script>
	$(function(){
		$("title").text($("title").text()+" | "+$("h2").text());
	});
		var xPoint = 37.510525;
		var yPoint = 127.079040;
		var mapContainer = document.getElementById('map'), //지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(xPoint, yPoint), // 지도의 중심좌표
		        level: 4, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		    }; 
		
		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 

		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new daum.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
				
		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(xPoint, yPoint), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
		
		var infowindow = new daum.maps.InfoWindow({
		    content : '<div style="padding:5px;"> We are here! :D</div>' // 인포윈도우에 표시할 내용
		});
		
		infowindow.open(map, marker);
	</script>
</body>
</html>