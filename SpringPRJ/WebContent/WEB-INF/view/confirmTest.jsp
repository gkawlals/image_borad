<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button id="Btn" class="Btn" value="TEST">
 </button>
</body>

		<script>
			$('#Btn').click(function() {
				var UpLoad = confirm("이미지를 저장 하시겠습니까?");
				
				if(UpLoad){
					location.replace("/image/imagetest.do");
				}else {
					
				}
				
		}
		</script>
</html>