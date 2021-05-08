<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="poly.dto.ImageDTO"%>
<%@page import="poly.util.CmmUtil"%>
<%
	List<ImageDTO> rList = (List<ImageDTO>) request.getAttribute("rList");
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <link rel="stylesheet" href="../resourceImg/css/reset.css">
    <link rel="stylesheet" href="../resourceImg/css/common.css">
    <link rel="stylesheet" href="../resourceImg/css/style.css">
    
    
<title>안녕 디지몬</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<section id="container">
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
                <a href="login.html"><div class="sprite_compass_icon"></div></a>
                <a href="follow.html"><div class="sprite_heart_icon_outline"></div></a>
                <a href="profile.html"><div class="sprite_user_icon_outline"></div></a>
            </div>
        </section>
    </header>
		<div class="hidden_menu">
		    <div class="scroll_inner">
		    	<div class="user">
		    		<div class="thumb_img">
		    			<img src="../resourceImg/imgs/thumb.jpeg"/>
		    		</div>
		    	</div>
		    </div>
		 </div>
	<section id="main_container">
	<% for(ImageDTO userInfo : rList) { %>
		<div class="inner">
            <div class="contents_box">
                <article class="contents">
                    <header class="top">
                        <div class="user_container">
                            <div class="profile_img">
                                <img src="../resourceImg/imgs/thumb.jpeg" alt="프로필이미지">
                            </div>
                            <div class="user_name">
                            	<div class="board_number" name="img_no" id="img_no" style="display:none"> <%=userInfo.getImage_no() %></div>
                                <div class="nick_name m_text" name="user_id"> <%=userInfo.getReg_id()%></div>
                                <div class="country s_text" name="LastEdit_DT"><%=userInfo.getChg_dt() %></div>
                            </div>

                        </div>

                        <div class="sprite_more_icon" data-name="more">
                            <ul class="toggle_box">
                               <li><input type="submit" class="follow" value="팔로우" data-name="follow"></li>
                                <li>수정</li>
                                <li>삭제</li>
                            </ul>
                        </div>
                 </header>
                  <div class="img_section">
                    <div class="trans_inner">
                            <div><img src="../resourceImg/Image/<%=userInfo.getSave_folder_name() %>/<%=userInfo.getSave_file_name() %>" alt="visual01"></div>
                        </div>
                    </div>
                    <div class="bottom_icons">
                        <div class="left_icons">
                            <div class="heart_btn">
                                <div class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
                            </div>                            
                        </div>
                    </div>
					<div class="likes m_text">
                        좋아요
                        <span id="like-count-39"><%=userInfo.getLike_cnt()%></span> <span id="bookmark-count-39"></span>
                        개
                    </div>
					<div class="comment_container">
                        <div class="comment" id="comment-list-ajax-post37">
                            <div class="comment-detail">
                                <div class="nick_name m_text" name="user_id" ></div>
                                <div style="text-align : center;" ><h1><%=userInfo.getOne_title() %></h1></div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="page" value="1">
				</article>
			</div>
		</div>
	</section>
</section>
<%
     }
%>
</body>
<script>
		function search() {
			//alert("test");
			var img_no = $('#img_no').val();
			//alert("제목 : " + post_title);
			if ($('#img_no').val() == "") {
				$('#img_no').focus();
				return false;
			}
		
			console.log("img_no : " + img_no);
		
			$.ajax({
				url : '/image/searchList.do',
				type : 'post',
				data : {
					"post_title" : post_title
				},
				success : function(data) {
					console.log("test");
					console.log(data);
		
					var resHTML = "";
					resHTML += '<input type="text"/>';
					resHTML += '<input type="text"/>';
					resHTML += '<input type="text"/>';
					resHTML += '<br/>';
					resHTML += '<img  src=" "  />';
					resHTML += '<br/>';
					resHTML += '<input type="text"/>';
					resHTML += '<br>';
		
					if (data.length == 0) {
		
						resHTML += '<input type="text"/>';
						resHTML += '<input type="text"/>';
						resHTML += '<input type="text"/>';
						resHTML += '<br/>';
						resHTML += '<img  src="" width = 300px height= 300px name="imgfile" />';
						resHTML += '<br/>';
						resHTML += '<input type="text"/>';
						resHTML += '<br>';
		
					} else {
		
						for (var i = 0; i < data.length; i++) {
							
							resHTML += '<input type="text" value="' + data.getImage_no() +'" />';
							resHTML += '<input type="text" value="'+ data.getReg_id() +'"/>';
							resHTML += '<input type="text" value="'+ data.getOne_title() +'"/>';
							resHTML += '<br/>';
							resHTML += '<img src="../resourceImg/Image/'+data.getSave_folder_name()+'/'+ data.getSave_file_name()'" width = 300px height= 300px name="imgfile"/>';
							resHTML += '<br/>';
							resHTML += '<input type="text" value ="'+ data.getChg_dt()+'"/>';
							resHTML += '<br>';
							
					}
					$("#searchList").html(resHTML);
		
				}
			})
		}
			
		$(function(){
				
				var ListCount = <% rList.size(); %>;
			    var count=1;
			    
			    //$(window).scroll(function() { });
			    
			    //문서가 로드되면 20 row 생성 그리고 생성이 완료되면 scroll 이벤트 바인딩
			    for(var i = 1; i < ListCount.length; i++) {
			        count = i;
			        
			    	$.ajax({
						url : '/image/searchList.do',
						type : 'post',
						data : {
							"post_title" : post_title
						},
						success : function(data) {
							console.log("test");
							console.log(data);
							
							var resHTML = "";
			        

			        if(count == ListCount) {
			            $(window).bind("scroll",infinityScrollFunction);
			        }
			    }

			    function infinityScrollFunction() {

			        //현재창의 높이를 구함.
			        var documentHeight  = $(document).height();
			        console.log("documentHeight : " + documentHeight);
			        
			        //scrollTop() 메서드는 선택된 요소의 세로 스크롤 위치를 설정하거나 반환    
			        //스크롤바가 맨 위쪽에 있을때 , 위치는 0
			        console.log("window의 scrollTop() : " + $(window).scrollTop()); 
			        //height() 메서드는 브라우저 창의 높이를 설정하거나 반환
			        console.log("window의 height() : " + $(window).height());
			        
			        //세로 스크롤위치 max값과 창의 높이를 더하면 현재문서의 높이를 구할수있음.
			        //세로 스크롤위치 값이 max이면 문서의 끝에 도달했다는 의미
			        var scrollHeight = $(window).scrollTop()+$(window).height();         
			        console.log("scrollHeight : " + scrollHeight);
			            
			        if(scrollHeight == documentHeight) { //문서의 맨끝에 도달했을때 내용 추가 
			            for(var i = 0; i<10; i++) {
			            	// ajax를 추가 하는 곳
			                //count = count + 1;
			                count++;
			                //$("<h1> infinity scroll </h>").appendTo("body");
			                $("<h1>"+count+" line scroll</h1>").appendTo("body");
			            }
			        }
			    }//function infinityScrollFunction()


			});

</script>

</html>