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
			<input type="button" name="Rpoint" id="Rpoint" value="직선 만들기" onclick="lineMake()">
			<br><br><br>
			 <form enctype="multipart/form-data" action="/image/circleUpload.do" method="post">
				
				<input type="button" onclick='document.all.circleUpload.click();' id="circleBtn" value="test" name="circleBtn" />
				
				<input type="file" name="circleUpload" style="display:none" onchange="circleIn()" >
				
				<input type="text" id="cir_title" name="cir_title" style="display:none"/>
				
				<input type="text" id="location" name="location" style="display:none"/>
				
				<input type="submit" name="circleInsert" id="circleInstert" style="display:none"/>
				
			</form>
			<!-- 시연을 위해 좌표를 같게 만드는 버튼 -->
			<input type="button" onclick="Geo()" id="geo" value="geotest" name="geo">
		<script> 
		var location;
		// 좌표가 같을 때 실행할 수 있는 사진 저장 
			function circleIn(){
			
					console.log(user_id);
					
					if (Rlat == lat && Rlon == lon){
						
						clearInterval(MakeLocation);

	           	 	if(!user_id){
	           				
	           				alert("로그인을 하지않으면 실행 할 수 없습니다.");
	           				
	           			}else{ 
	           				
		           			var ppt2 = prompt("15자 이내의 간단한 제목을 정해주세요!","");
		           			
		           			if (!ppt2){
		           				
		           				alert(" 제목을 지어 주셔야 합니다 !");
		           				
		           				console.log(" 제목을 지어라 ");
		           				
		           			}else if( ppt2.length > 15){
		           				
		           				alert(" 제목의 길이가 너무 길어 저장에 실패 했습니다.");
		           				
		           			}else {
		           				
		           				$('input[name=cir_title]').attr('value', ppt2);
		           				
		           				$('input[name=location]').attr('value', Rlat + '/' + Rlon);
		           				
		           				console.log(location);
		           				console.log(cir_title.value);
		           				
			           			document.all.circleInsert.click();
		           				
		           			}
		           		}
	           		
					}else {
						
						alert(" 좌표가 달라 실행할 수 없습니다.");
					}
           			
				}
		</script>
			<br><br>
			<div id="map" style="width:100%;height:500px;"></div>
		</div>
	</div>
</section>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9c780c934dfa44e8d6dcce448c147e8"></script>
	<script>
		// WEB에서 Test하는 kakao map key = 78d567748187bb729022787116572022
		// SERBER에 올리는 kakao map key = e9c780c934dfa44e8d6dcce448c147e8
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.55003810100931, 126.84223535396687), // 지도의 중심좌표 현재위치를 받아와서 넣어주면 될듯
	        level: 6, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    }; 
		
	
		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
	
		var lat ; // 위도을 받아올 변수 
		var lon ; // 경도를 받아올 변수
		
		var marker; // 현재위치를 표시해주는 마커
		
		var Rmarker; // 검색한 키로수 내의 랜덤 표시되는 랜덤 마커
		
		// 현재위치를 가져오는데 시간이 오래걸린다. ajax로 가져오게 되면 빨라질까? 
		// 실험해 보자
		
		var arMarker = [];
		
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
					    
					    arMarker.push(marker);
					    
			      });
			    
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

				var locPosition = new kakao.maps.LatLng(lat, lon),    
			    
				message = 'geolocation을 사용할수 없어요..'
			
			}
			
		}
		
		// 반경 그려주기
		var arraycircle = [];
		
		function searchKm(){
			
			var Km = document.getElementById("Km").value;
			Km = (Km / 2) * 1000;
			console.log("2 거리는? : "  + Km);
    		// 지도에 원을 표시한다 거리를 검색 기본적으로 3Km로 해야함 
    		
    		delmaker();
    		
    		delcircle();
    		
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
    		
			arraycircle.push(circle); 
		}
		
		// 배열에 추가된 반경들을 삭제하는 함수입니다
		function delcircle(map) {
		    for (var i = 0; i < arraycircle.length; i++) {
		    	arraycircle[i].setMap(null);
		    }            
		}
		
		
		// 랜덤 마커 찍어주기 
		var Rlat;
		var Rlon;
		var arRmarker = [];
		
		// 그려진 라인들을 담는 변수
		var arrayLine = [];
		
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
			
			// 랜덤마커 생성을 다시 클릭했을때 있던 라인 지우기
			delline();
			// 랜덤가 계속 생성되는거 막기
			delmaker();
			
			// 랜덤범위안에 마커를 찍어주기
			 Rmarker = new kakao.maps.Marker({
	    		    position: new kakao.maps.LatLng(Rlat, Rlon), // 마커의 좌표
	    		    map : map
	    		});
			 
			arRmarker.push(Rmarker);
			
			/* console.log(Rlat, Rlon); */
			
		}
		
		//  test를 위한 좌표 조작 
		function Geo(){
			
			Rlat = lat; 
			Rlon = lon;
/* 			if(Rlat == lat && Rlon == lon){
				clearInterval(MakeLocation);
			} */
			console.log("그려주기");
			console.log(Rlat, Rlon);
			console.log(lat, lon);
			
		}
		
		function lineMake(){
			
				delline();
				
		        // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		        var linePath = [
		            new kakao.maps.LatLng(lat, lon),
		            new kakao.maps.LatLng(Rlat, Rlon) 
		        ];
				
		        // 지도에 표시할 선을 생성합니다
		        var polyline = new kakao.maps.Polyline({
		            path: linePath, // 선을 구성하는 좌표배열 입니다
		            map : map, // map의 표시하는 map 객체
		            strokeWeight: 5, // 선의 두께 입니다
		            strokeColor: '#FFAE00', // 선의 색깔입니다
		            strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid' // 선의 스타일입니다
		        });
		        // 지우기 위해 기억해주는 배열에 추가하기 
		        arrayLine.push(polyline);
		        // 
		        
				if(Rlat == lat && Rlon == lon){
					clearInterval(MakeLocation);
					document.getElementById('circleBtn').click();
					
				}else {
					  MakeLocation;
				}
		}
		
		<!-- 여기서 계속 자기자리를 찍어주는 함수를 실행시켜 계속해서 자기자리를 찍으면서 직선과 마커를 찍었다 지웠다 하면 됨-->
	       var MakeLocation = setInterval( function(){
	    	   
	        		if(Rlat > 0 && Rlon > 0){
					
	        			if (navigator.geolocation) {
	    		    	
			    		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    		    navigator.geolocation.getCurrentPosition(function(position) {
		    		    	
		  		    			delarMarker();
		  		    		
			    		    	lat = position.coords.latitude; // 위도
			    				lon = position.coords.longitude; // 경도
			    				
			    				console.log('5초마다 좌표 찍기');
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
		 					    lineMake();
		 					    arMarker.push(marker);
		    		    
		    		    	});
	       		 	}
				}
			}, 3000);
		
    	 // 배열에 추가된 마커들을 삭제하는 함수입니다
		function delarMarker(map) {
		    for (var i = 0; i < arMarker.length; i++) {
		    	arMarker[i].setMap(null);
		    }            
		}
		
		// 배열에 추가된 마커들을 삭제하는 함수입니다
		function delmaker(map) {
		    for (var i = 0; i < arRmarker.length; i++) {
		    	arRmarker[i].setMap(null);
		    }            
		}
		
		// 배열에 추가된 직선들을 삭제하는 함수입니다
		function delline(map){
		    for (var i = 0; i < arrayLine.length; i++) {
		    	arrayLine[i].setMap(null);
		    }  
		}
		
</script>
</body>
</html>