<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>다음 지도 API</title>
</head>
<body>
	<div id="map" style="width:750px;height:500px;"></div>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9c780c934dfa44e8d6dcce448c147e8"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.55003810100931, 126.84223535396687), // 지도의 중심좌표
		        level: 5, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(37.55003810100931, 126.84223535396687), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});

		// 지도에 원을 표시한다
		var circle = new kakao.maps.Circle({
			map: map, // 원을 표시할 지도 객체
			center : new kakao.maps.LatLng(37.55003810100931, 126.84223535396687), // 지도의 중심 좌표
			radius : 200, // 원의 반지름 (단위 : m)
			fillColor: '#00f8ff', // 채움 색
			fillOpacity: 0.3, // 채움 불투명도
			strokeWeight: 2, // 선의 두께
			strokeColor: '#00f8ff', // 선 색
			strokeOpacity: 1, // 선 투명도 
			strokeStyle: 'solid' // 선 스타일
		});	
	</script>
</body>
</html>