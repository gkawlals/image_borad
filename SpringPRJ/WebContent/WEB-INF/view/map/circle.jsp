<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>다음 지도 API</title>
</head>
<body>
	거리<input type="text" id="Km"/> Km <input type="button" value="검색" name="Kmsearch" id="btnTest" onclick="searchKm()"/>
	<br><br>
	<input type="button" name="Rpoint" id="Rpoint" value="랜덤좌표 만들기" onclick="Rpoint()">
	<input type="button" name="Load" id="LoadTest" value="왕복거리 검색하기" onclick="Load()"/>
	<input type="button" name="center" id="centerTest" value="현재위치 가져오기" onclick="setCenter()"/>
	
	<div id="map" style="width:750px;height:750px;"></div>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9c780c934dfa44e8d6dcce448c147e8"></script>
	<script>
		
		
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.55003810100931, 126.84223535396687), // 지도의 중심좌표 현재위치를 받아와서 넣어주면 될듯
	        level: 5, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    }; 
	
		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		
		var lat; 
		var lon;
		// 현재위치를 가져오는데 시간이 오래걸린다. ajax로 가져오게 되면 빨라질까? 
		// 실험해 보자
		function setCenter(){
			if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		    	
		    	lat = position.coords.latitude; // 위도
				lon = position.coords.longitude; // 경도
				console.log(lat, lon);

						// 지도에 마커를 생성하고 표시한다
			    		var marker = new kakao.maps.Marker({
			    		    position: new kakao.maps.LatLng(lat, lon),// 마커의 좌표
			    		    map : map
			    		});
				
			    		// 이동할 위도 경도 위치를 생성합니다 
					    var moveLatLon = new kakao.maps.LatLng(lat, lon);
					    
					    // 지도 중심을 이동 시킵니다
					    map.setCenter(moveLatLon);
					    console.log(map.getCenter());
			      });
			    
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

				var locPosition = new kakao.maps.LatLng(37.55003810100931, 126.84223535396687),    
			    
				message = 'geolocation을 사용할수 없어요..'
			
			}
			
		}
		
		
		function searchKm(){
			var ellipse ;
			
			var Km = document.getElementById("Km").value;
			Km = (Km / 2) * 1000;
			console.log("2 거리는? : "  + Km);
    		// 지도에 원을 표시한다 거리를 검색 기본적으로 3Km로 해야함 
			var	circle = new kakao.maps.Circle({
				map: map, // 원을 표시할 지도 객체
				center : new kakao.maps.LatLng(lat, lon), // 지도의 중심 좌표
				radius : Km, // 원의 반지름 (단위 : m)
				fillColor: '#00f8ff', // 채 색
				fillOpacity: 0.1, // 채움 불투명도
				strokeWeight: 2, // 선의 두
				strokeColor: '#00f8ff', // 선 색
				strokeOpacity: 2, // 선 투명도 
				strokeStyle: 'solid' // 선 스타일
			});
    		
 			
		}
    	
		function Load() {
			//왕복 거리 찍어주기 api Odsay사용 
		}
		
		
		function Rpoint(){
			
			Km = document.getElementById("Km").value;
			Km = (Km / 2) * 1000;
			// km == 1500 =  0.00655
			// 랜덤 좌표 찍어주기
			var centerPosition = map.getCenter(); // 원의 중심좌표 입니다.
			// 랜덤 범위를 잡아주는 기준 구하기
			var RlatTest = ( Km / 229007.633587786259542);
			var RlonTest = ( Km / 90909.090909090909091 );
			console.log(RlatTest , RlonTest);
			// 랜덤 좌표를 만들어주는 식, 범위를 잡아준다.
			var Rlat = (Math.random() * ((lat + RlatTest) - (lat - RlatTest)) + ( lat - RlatTest));
			var Rlon = (Math.random() * ((lon + RlonTest) - (lon - RlonTest)) + (lon - RlonTest));
			
    		var marker1 = new kakao.maps.Marker({
    		    position: new kakao.maps.LatLng(Rlat, Rlon),// 마커의 좌표
    		    map : map
    		});
			console.log(Rlat, Rlon);
			
		}
		
		
	</script>
</body>
</html>