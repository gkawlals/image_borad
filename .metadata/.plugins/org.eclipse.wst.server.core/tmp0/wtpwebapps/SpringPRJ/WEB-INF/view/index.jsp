<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table, th, td{
		border : 1px solid black;
	}
</style>
</head>
<body>
와! 스프링 아시는구나!
참고로 겁.나.어.렵.습.니.다
<br>
<br>
<br>
<input type="button" name="imageList" onclick="location.href='image/imageList'" value="게시판으로 가기"/>
 <br>
 <br>
 <button id="Btn" class="Btn" onclick="location.href='javascript:delete_check()'">TEST CONFIRM
 </button>
 
 <button id="Btn2" class="Btn2" onclick="location.href='javascript:prompt_test()'">TEST PROMPT
 </button>
 
 <br>
 <br>
 <br>
 <input type="text" id="text_test">
 <br>
 <button id="Btn2" class="Btn2" onclick="location.href='javascript:alert_test()'">TEST ALERT
 </button>
</body>
		<script>
		function delete_check(){
				var UpLoad = confirm("이미지를 저장 하시겠습니까?");
				
				if(UpLoad == true ){
					location.replace("../image/imagetest.do");
				}else {
					
				}
		}
		function prompt_test(){
			var PPT = prompt("삭제", "수정");
			
		}
		
		
		function alert_test(){
			var text_test = document.getElementById('text_test').value;
			if(text_test == "" || text_test == null ){
			
				var AL = alert("회원가입에서 빈칸일때 사용할 것 ");
				console.log(text_test);
				
			}else {
				AL = alert("빈칸이 아님");
				console.log(text_test);
			}
		}
		
		
		</script>
</html>