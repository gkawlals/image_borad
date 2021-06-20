<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="poly.dto.ImageDTO"%>
<%@page import="poly.dto.UserDTO"%>
<%@page import="poly.util.CmmUtil"%>
<%
	String SS_USER_ID = CmmUtil.nvl((String)session.getAttribute("SS_USER_ID"));

	ImageDTO rDTO = (ImageDTO)request.getAttribute("rDTO");

	UserDTO uDTO = (UserDTO)request.getAttribute("urDTO");

%>
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


    <title>instagram</title>
    <link rel="stylesheet" href="../resourceImg/css/reset.css">
    <link rel="stylesheet" href="../resourceImg/css/common.css">
    <link rel="stylesheet" href="../resourceImg/css/style.css">
    <link rel="stylesheet" href="../resourceImg/css/detail-page.css">
    <link rel="shortcut icon" href="../resourceImg/imgs/instagram.png">

</head>
<body>
<section id="container">

    <%@ include file="/WEB-INF/view/user/top.jsp" %>
    
    <form >
    <div id="main_container">

        <section class="b_inner">

            <div class="contents_box">

                <article class="contents cont01">

                    <div class="img_section">
                        <div class="trans_inner">
                            <div><img src="../resourceImg/Image/<%=rDTO.getSave_folder_name() %>/<%=rDTO.getSave_file_name()%>" alt=""></div>
                        </div>
                    </div>
                    <div class="detail--right_box">
						
                        <header class="top">
                            <div class="user_container">
                                <div class="profile_img">
                                    <img src="../resourceImg/<%=uDTO.getUser_folder_name() %>/<%=uDTO.getUser_profile_name() %>" alt="">
                                </div>
                                <div class="user_name">
                                    <div class="nick_name"><%=rDTO.getReg_id() %></div>
                                    <!-- 입력한 date-->
                                    <div class="chg_dt"><%=rDTO.getChg_dt() %></div>
                                </div>
                            </div>
                        </header>
                        <section class="scroll_section">
                            <div class="admin_container">
                                <div class="comment">
                                    <span class="user_id"></span>
                                    <input type="text" name="one_title" id="Update_one_title" value="<%=rDTO.getOne_title() %>"  />                         
                             	</div>
                             </div>
						</section>
                        <div class="bottom_icons">
                            <div class="left_icons"></div>
                            <div class="right_icon"></div>
                        </div>
                        <div class="commit_field">
                            <div class="heart_btn">
                                <div class="sprite_heart_icon_outline" data-name="heartbeat"></div>
                             </div>
                             <div class="count_likes">
                                좋아요
                                <span class="like_cnt"> </span>
                            </div>
                        </div>
                        <input type="button" value="수정" onclick="javascript:updateImage(<%=rDTO.getImage_no()%>)">
                        <input type="button" value="삭제" onclick="javascript:delImage(<%=rDTO.getImage_no()%>)">
                </article>
            </div>
        </section>
    </div>
   </form>
</section>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script >
	// 게시글을 삭제할때 버튼 클릭하면 실행되는 함수 
	function delImage(image_no) {
		
		 // 게시글의 번호를 불러와 하이퍼링크로 컨트롤러로 넘기기
	    console.log("게시글 번호 : " + image_no);
		 
		var delConfirm = "게시글을 삭제 하시겠습니까?";
		
			if(confirm(delConfirm)){
				$.ajax({
					url : "/image/delImage.do",
					type : "post",
					data : 
						{
						"image_no" : image_no
						},
					success : function(data){
						if(data == 1){
							alert("삭제에 성공했습니다.");
						}else if(data == 0){
							alert("삭제에 실패했습니다.");
						}
					}
				})
			}
		}
	
	// 게시글을 수정할때 버튼 클릭하면 실행되는 함수 
	function updateImage(image_no){
		
		var updateConfirm = "수정 하겠습니까?";
		
		var title = '<%=rDTO.getOne_title()%>';
		
		var one_title = document.getElementById('Update_one_title').value;
		
		if( title != one_title ){
			if(confirm(updateConfirm)){
				
				console.log(" load for DTO : " + title);
				console.log(" load for JSP : " + one_title);
				
				$.ajax({
					url : "/image/updateImage.do",
					type : "post",
					data : 
						{
						"image_no" : image_no,
						"one_title" : one_title
						},
					success : function(data){
						if(data == 1){
							alert("수정에 성공했습니다.");
						}else if(data == 0){
							alert("수정에 실패했습니다.");
						}
					}
				})
			}
		}
	}
	
</script>
<!--<script src="js/detail.js"></script>-->
</body>
</html>