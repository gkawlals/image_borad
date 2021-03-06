<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.ImageDTO"%>
<%@page import="poly.dto.UserDTO"%>
<%@page import="poly.util.CmmUtil"%>
<%
	List<ImageDTO> rList = (List<ImageDTO>) request.getAttribute("rList");

	if( rList == null){
		rList = new ArrayList<ImageDTO>();
	}
	
	String SS_USER_ID = CmmUtil.nvl((String)session.getAttribute("SS_USER_ID"));
	
	int imageCnt = 0;
%>
<html lang="en">
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
    <title>instagram</title>
    <link rel="stylesheet" href="../resourceImg/css/reset.css">
    <link rel="stylesheet" href="../resourceImg/css/common.css">
    <link rel="stylesheet" href="../resourceImg/css/style.css">
    <link rel="stylesheet" href="../resourceImg/css/profile.css">
    <link rel="shortcut icon" href="../resourceImg/imgs/instagram.png">
</head>
<body>

<section id="container">

  	<%@ include file="/WEB-INF/view/user/top.jsp" %>
  	 
    <div id="main_container">

        <section class="b_inner">

            <div class="hori_cont">
                <div class="profile_wrap">
                    <div class="profile_img">
                        <img src="../resourceImg/imgs/thumb.jpeg" alt="착한호랑이">
                    </div>
                </div>

                <div class="detail">
                    <div class="top">
                        <div class="user_name" id="SS_USER_ID"><%=SS_USER_ID %></div>
                    </div>

                    <ul class="middle">
                        <li>
                            <span>게시물</span>
                            <% for(int i = 1; i <= rList.size(); i++){ 
                            	
                            	imageCnt += 1; 
                            
                            } %>
                            <%=imageCnt %>
                        </li>
                    </ul>
                </div>
                
            </div>
          	<%
				for (ImageDTO myList : rList){
	    	%>
	        <div class="mylist_contents contents_container active">
		            <div class="pic"> 
            	<form action="../image/imageDetail.do" style="text-align:center; display:table; border:1px solid #cecece; width:280px; height:250px;">
		            		<input type="text" value="<%=myList.getImage_no()%>" id="image_no" name="image_no" style="display:none " />
		            	<div style="display:table-cell; vertical-align:middle;">
			            	<button type="submit">
			            		<img src="../resourceImg/Image/<%=myList.getSave_folder_name()%>/<%=myList.getSave_file_name()%>" name="user_profile" style="width:100%;">
			            	</button>
		            	</div>
         		  </form>
		            </div>
	           </div>
            <%} %>
       </section>
    </div> 
</section>
<script>
/* 	function update_page(){
		var update_page = confirm("수정 및 삭제를 원하시나요? (확인 : 수정 , 취소 : 삭제 )");
		if( update_page == true ){
			location.replace("../image/imageDetail.do");
		}else {
			var del_evt = confirm(" 정말 삭제 하시겠습니까? ( 확인 : 삭제, 취소 : 돌아기기)")
			if(del_evt == true ){
				location.replace("../image/delImage.do");
			}else{
				location.replace("../image/MyPage.do");
			}
		}
	} */
	
	function loadUserImg(){
		var img_no = $('#img_no').val();
		
		
		if($('#img_no').val() == ""){
			$('#img_no').focus();
		}
		
		console.log("img_no : " + img_no);
		
		$.ajax({
			usl : '/image/loadUserImg.do',
			type : 'post',
			data : {
				"img_no" : img_no
			},
			success : function(data) {
				console.log("test");
				console.log(data);
				
				var resHTML = '';
				resHTML += '<input type="text" value="' + data.getImage_no() +'"  name="image_no" style="display:none"/>';
				resHTML += '<button type="submit">';
				resHTML += '<img src="../resourceImg/Image/'+data.getSave_folder_name()+'/'+ data.getSave_file_name() + '" name="user_profile"/>';
				resHTML += '</button>';
				
				if( data.length == 0){
					resHTML += '<form action="../image/imageDetail.do">';
					resHTML += '<input type="text" name="image_no" style="display:none"/>';
					resHTML += '<button type="submit">';
					resHTML += '<img src="../resourceImg/Imgs/thumb.jpeg" name=""/>';
					resHTML += '</button>';
					
				} else {
					for(var i = 0; i < data.length; i++){
						resHTML += '<input type="text" value="' + data.getImage_no() +'"  name="image_no" style="display:none"/>';
						resHTML += '<button type="submit">';
						resHTML += '<img src="../resourceImg/Image/'+data.getSave_folder_name()+'/'+ data.getSave_file_name() + '" name="user_profile" />';
						resHTML += '</button>';
						
					}
				}
				
			}
		})
	}
</script>
</body>
</html>