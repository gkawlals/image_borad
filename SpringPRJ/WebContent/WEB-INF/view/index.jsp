<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="poly.util.CmmUtil" %>
<%@page import="java.util.List"%>
<%@page import="poly.dto.ImageDTO"%>
<%@page import="poly.dto.UserDTO"%>

<%
	
	String user_id = CmmUtil.nvl((String)session.getAttribute("SS_USER_ID"));
	ImageDTO title = new ImageDTO();
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

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

    <link rel="stylesheet" href="../resourceImg/css/reset.css">
    <link rel="stylesheet" href="../resourceImg/css/common.css">
    <link rel="stylesheet" href="../resourceImg/css/style.css">
    <link rel="stylesheet" href="../resourceImg/css/profile.css">
    <link rel="shortcut icon" href="../resourceImg/imgs/instagram.png">
    <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>J
<title>Insert title here</title>
</head>
<body>
<select id="container">

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
               <input type="file" name="fileUpload" style="display:none" onchange="fileSelect()">
               <div class="sprite_camera_icon"
	               onclick='document.all.fileUpload.click();' 
	              	></div>
				<!-- 이미지 파일 저장 -->
						<input type="text" id="one_title" name="one_title" style="display:none"/>
               			<input type="submit" name="fileInsert" style="display:none"/>
           	 </form>
           	 <script>
	           		
	           		function fileSelect(){
	           			
	           			var ppt = prompt("15자 이내의 간단한 제목을 정해주세요!","");
	           			
	           			if (ppt.length > 0){
	           				
	           				$('input[name=one_title]').attr('value', ppt);
	           				
	           				console.log(one_title.value);
	           				
		           			document.all.fileInsert.click();
	           			}else {
	           				alert(" 제목을 지어 주셔야 합니다 !");
	           			}
	           		}
	           		
	           </script>
            </div>
        </section>
    </header>
   </select>
</body>
</html>