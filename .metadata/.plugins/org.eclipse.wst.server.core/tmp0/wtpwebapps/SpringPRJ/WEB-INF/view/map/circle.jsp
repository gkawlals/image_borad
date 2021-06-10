<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <!-- Facebook Meta Tags / 페이스북 오픈 그래프 -->
    <meta property="og:url" content="http://kindtiger.dothome.co.kr/insta">
    <meta property="og:type" content="website">
    <meta property="og:title" content="instagram">
    <meta property="og:description" content="instagram clone">
    <meta property="og:image" content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">
    .
    <!-- Twitter Meta Tags / 트위터 -->
    <meta name="twitter:card" content="instagram clone">
    <meta name="twitter:title" content="instagram">
    <meta name="twitter:description" content="instagram clone">
    <meta name="twitter:image" content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">

    <!-- Google / Search Engine Tags / 구글 검색 엔진 -->
    <meta itemprop="name" content="instagram">
    <meta itemprop="description" content="instagram clone">
    <meta itemprop="image" content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">


    <title>circle</title>
    <link rel="stylesheet" href="../resourceImg/css/reset.css">
    <link rel="stylesheet" href="../resourceImg/css/common.css">
    <link rel="stylesheet" href="../resourceImg/css/style.css">
    <link rel="stylesheet" href="../resourceImg/css/detail-page.css">
    <link rel="shortcut icon" href="../resourceImg/imgs/instagram.png">

</head>
<body>

<section id="container">

<%@ include file="/WEB-INF/view/user/top.jsp" %>
	<div id="main_contaner">
	<br><br><br><br><br>
		<div>
			<input type="button" name="center" id="centerTest" value="현재위치 가져오기" onclick="setCenter()"/>
			<br><br>
			거리<input type="text" id="Km"/> Km <input type="button" value="검색" name="Kmsearch" id="btnTest" onclick="searchKm()"/>
			<input type="button" name="Rpoint" id="Rpoint" value="랜덤좌표 만들기" onclick="Rpoint()">
			<input type="button" name="Load" id="LoadTest" value="왕복거리 검색하기" onclick="Load()"/>
			
			<div id="map" style="width:750px;height:750px;"></div>
		</div>
	</div>
</section>
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
		
		
		var lat; // 위도을 받아올 변수 
		var lon; // 경도를 받아올 변수
		
		var marker; // 현재위치를 표시해주는 마커
		
		var marker1; // 검색한 키로수 내의 랜덤 표시되는 랜덤 마커
		
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
			    		 marker = new kakao.maps.Marker({
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
		
		var Rlat ;
		var Rlon;

		function Rpoint(){
			
			Km = document.getElementById("Km").value;
			Km = (Km / 2) * 1000;
			// km == 1500 =  0.00655
			// 랜덤 좌표 찍어주기
			var centerPosition = map.getCenter(); // 원의 중심좌표 입니다.
			// 랜덤 범위를 잡아주는 기준 구하기
			var RlatTest = ( Km / 229007.633587786259542 ); 
			var RlonTest = ( Km / 90909.090909090909091 ); 
			console.log(RlatTest , RlonTest);
			// 랜덤 좌표를 만들어주는 식, 범위를 잡아준다.
			Rlat = (Math.random() * ((lat + RlatTest) - (lat - RlatTest)) + ( lat - RlatTest));
			Rlon = (Math.random() * ((lon + RlonTest) - (lon - RlonTest)) + ( lon - RlonTest));
			
			markerMake();
			
			console.log(Rlat, Rlon);
			console.log();
			
		}
		
		function markerMake(){
			 marker1 = new kakao.maps.Marker({
    		    position: new kakao.maps.LatLng(Rlat, Rlon),// 마커의 좌표
    		    map : map
    		});
    		
		}
		
		 // 왕복 거리 나타내는 api를 불러오는 function 
		function searchPubTransPathAJAX() {
			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX="+lat+"&SY="+lon+"&EX="+Rlat+"&EY="+Rlon+"&apiKey=VIBF%2BBDBYawcGbKFbkcTJw";
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
				console.log( JSON.parse(xhr.responseText) ); // <- xhr.responseText 로 결과를 가져올 수 있음
				//노선그래픽 데이터 호출
				callMapObjApiAJAX((JSON.parse(xhr.responseText))['result']['path"][0].info.mapObj);
				}
			}
		}
		 
		function callMapObjApiAJAX(mabObj){
			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@"+mabObj+"&apiKey=VIBF%2BBDBYawcGbKFbkcTJw";
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var resultJsonData = JSON.parse(xhr.responseText);
					//drawkakaoMarker(lat,lon);					// 출발지 마커 표시
					maker;
					//drawkakaoMarker(Rlat,Rlon);					// 도착지 마커 표시
					maker1;
					drawkakaoPolyLine(drawkakaoPolyLine);		// 노선그래픽데이터 지도위 표시
					// boundary 데이터가 있을경우, 해당 boundary로 지도이동
					if(resultJsonData.result.boundary){
							var boundary = new kakao.maps.LatLngBounds(
					                new kakao.maps.LatLng(resultJsonData.result.boundary.top, resultJsonData.result.boundary.left),
					                new kakao.maps.LatLng(resultJsonData.result.boundary.bottom, resultJsonData.result.boundary.right)
					                );
							map.panToBounds(boundary);
					}
				}
			}
		}
		
    	
		function Load() {
			
			function drawkakaoPolyLine(data){
				var lineArray;
				
				for(var i = 0 ; i < data.result.lane.length; i++){
					for(var j=0 ; j <data.result.lane[i].section.length; j++){
						lineArray = null;
						lineArray = new Array();
						for(var k=0 ; k < data.result.lane[i].section[j].graphPos.length; k++){
							lineArray.push(new kakao.maps.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
						}
						
					//지하철결과의 경우 노선에 따른 라인색상 지정하는 부분 (1,2호선의 경우만 예로 들음)
						if(data.result.lane[i].type == 1){
							var polyline = new kakao.maps.Polyline({
							    map: map,
							    path: lineArray,
							    strokeWeight: 3,
							    strokeColor: '#003499'
							});
						}else if(data.result.lane[i].type == 2){
							var polyline = new kakao.maps.Polyline({
							    map: map,
							    path: lineArray,
							    strokeWeight: 3,
							    strokeColor: '#37b42d'
							});
						}else{
							var polyline = new kakao.maps.Polyline({
							    map: map,
							    path: lineArray,
							    strokeWeight: 3
							});
						}
					}
				}
			}
			
			//왕복 거리 찍어주기 api Odsay사용 길찾기 API 호출
			
			searchPubTransPathAJAX();
			
			// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
			
			callMapObjApiAJAX(map);
		}
	
</script>
</body>
</html>