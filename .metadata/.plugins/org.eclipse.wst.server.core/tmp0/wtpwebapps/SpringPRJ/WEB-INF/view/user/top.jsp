<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="poly.util.CmmUtil" %>
<%@page import="java.util.List"%>
<%@page import="poly.dto.ImageDTO"%>
<%@page import="poly.dto.UserDTO"%>
<%
	String user_id = CmmUtil.nvl((String)session.getAttribute("SS_USER_ID"));
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header id="header">
        <section class="inner">
            <h1 class="logo">
                <a href="index.html">
                    <div class="sprite_insta_icon"></div>
                    <div class="sprite_write_logo"></div>
                </a>
            </h1>
            <div class="search_box">
                <input type="text" placeholder="검색" id="search-field">

                <div class="fake_field">
                    <span class="sprite_small_search_icon"></span>
                    <span>검색</span>
                </div>
            </div>
            <div class="right_icons">
            <form enctype="multipart/form-data" action="/image/imageUpload.do" method="post">
                
                <div class="sprite_camera_icon" onclick='document.all.fileUpload.click();' ></div>
                
                <input type="file" name="fileUpload" style="display:none" onchange="fileSelect()">
                
                <input type="text" id="one_title" name="one_title" style="display:none"/>
               	
               	<input type="submit" name="fileInsert" style="display:none"/>
           	 
           	 </form> <!-- prompt를 이용해 제목 값을 불러오기 -->
           	    <script>
           	 		var user_id = '<%=user_id%>';
           	 		// 카메라 이미지 클릭시 저장 실행
	           		function fileSelect(){
	           			
	           			if(!user_id){
	           				
	           				alert("로그인을 하지않으면 실행 할 수 없습니다.");
	           				
	           				
	           			}else{
	           				
		           			var ppt = prompt("15자 이내의 간단한 제목을 정해주세요!","");
		           			
		           			if (!ppt){
		           				
		           				alert(" 제목을 지어 주셔야 합니다 !");
		           				
		           				console.log(" 제목을 지어라 ");
		           				
		           			}else if( ppt.length > 15){
		           				
		           				alert(" 제목의 길이가 너무 길어 저장에 실패 했습니다.");
		           				
		           			} else {
		           				
		           				$('input[name=one_title]').attr('value', ppt);
		           				
		           				//console.log(one_title.value);
		           				
			           			document.all.fileInsert.click();
		           				
		           			}
	           				
	           			}
	           			
	           		}
	           		
	           </script>
                <a onclick="location.href='../map/circle.do'"><div class="sprite_compass_icon"></div></a><!-- 카카오 지도 api연결 -->
                <a onclick="location.href='../user/MyPage.do'" ><div class="sprite_user_icon_outline" name="SS_USER_ID" value="<%=user_id%>"></div></a>
                
            </div>
        </section>
    </header>
</body>
</html>