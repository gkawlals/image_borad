<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<br> <br>
	<input type="button" id="btnTest" value="좌표 얻기">
	
<script>
var options = { 
				enableHighAccuracy : true,
				timeout : 5000,
				maximumAge : 0
				
		}
		function success(pos){
			
			var crd = pos.coords;
			console.log('위도 : ' + crd.latitude);
			console.log('경도 : ' + crd.longitude);
			lat = crd.latitude;
			lot = crd.longitude
			
		}
		
		function error (err) {
			
			console.log('Error (' + err.code + ')' + err.message);
		}
		
		$('#btnTest').click(function({
			navigator.geolocation.getCurrentPosition(success, error, options);
		})
		
		
		$ajax({
			url : 'https://dapi.kakao.com/v2/maps/sdk.js?appkey=e9c780c934dfa44e8d6dcce448c147e8'
			type : 'GET',
			success : function(data) { 
				console.log(data);
			},
			error : function(e) { 
				console.log(e);
			}			
		});
</script>
</body>
</html>