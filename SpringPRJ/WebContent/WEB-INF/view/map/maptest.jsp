<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:100%;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9c780c934dfa44e8d6dcce448c147e8"> 
	</script>
	<script>
	
	var OdSayApiKey = "93pKzmOErRnE+40DxD%2FwkK99bvgQbAQlvJPpsrPvvVw";
	
 	var mapContainner = document.getElementById('map');
	var mapOptions = {
		center: new kakao.maps.LatLng(37.3595704, 127.105399),// 지도를 켰을때 중심으로 잡을좌표
		level: 10, // kakao map의 zoom상태
		mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	};
	
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainner, mapOptions); 
	
	var sx = 126.93737555322481;
	var sy = 37.55525165729346;
	var ex = 126.88265238619182;
	var ey = 37.481440035175375;
	
	function searchPubTransPathAJAX() {
		console.log(OdSayApiKey);
		var xhr = new XMLHttpRequest();
		//ODsay apiKey 입력
		var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&apiKey={"+ OdSayApiKey +"}";
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
			console.log( JSON.parse(xhr.responseText) ); // <- xhr.responseText 로 결과를 가져올 수 있음
			
			//노선그래픽 데이터 호출
			callMapObjApiAJAX((JSON.parse(xhr.responseText))["result"]["path"][0].info.mapObj);
			
			}
		}
	}
	
	//길찾기 API 호출
	searchPubTransPathAJAX();
	
	function callMapObjApiAJAX(mabObj){
		var xhr = new XMLHttpRequest();
		//ODsay apiKey 입력
		var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@"+mabObj+"&apiKey={"+ OdSayApiKey +"}";
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultJsonData = JSON.parse(xhr.responseText);
				drawkakaoMarker(sx,sy);					// 출발지 마커 표시
				drawkakaoMarker(ex,ey);					// 도착지 마커 표시
				drawkakaoPolyLine(resultJsonData);		// 노선그래픽데이터 지도위 표시
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
	
	// 지도위 마커 표시해주는 함수
	function drawkakaoMarker(x,y){
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(y, x),
		    map: map
		});
	}
	
	// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
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
</script>
</body>
</html>