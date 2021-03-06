<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="poly.dto.ImageDTO"%>
<%@page import="poly.dto.UserDTO"%>
<%@page import="poly.util.CmmUtil"%>
<%
	String SS_USER_ID = CmmUtil.nvl((String)session.getAttribute("SS_USER_ID"));

	List<ImageDTO> rList = (List<ImageDTO>)request.getAttribute("rList");
	
	List<UserDTO> uList = (List<UserDTO>)request.getAttribute("uList");
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
</head>
<body>
<section id="container">

 	 <%@ include file="/WEB-INF/view/user/top.jsp" %>
    
    
		<div class="hidden_menu" id="hidden_menu">
			    <div class="scroll_inner">
			    <% for (UserDTO userId : uList) {%>
			    	<div class="user">
			    	<input type="text" style="display:none" name="user_no" value="<%=userId.getUser_no() %>"/>
			    		<div class="thumb_img">
			    			<img src="../resourceImg/<%=userId.getUser_folder_name()%>/<%=userId.getUser_profile_name()%>" /> <!-- 프로필 사진 경로 -->
			    		</div>
			    		<%=userId.getUser_id()%>
			    	</div>
			    	 <% } %>
			    </div>
			 </div>
	<script>
		function userList(){
			var user_no = $('#user_no').val();
			
			if($('#user_no').val() == ""){
				$('#user_no').focus();
			}
			
			console.log("user_no : " + user_no);
			
			$.ajax({
				url : '/image/userListAll.do',
				type : 'post',
				data : {
					"user_no" : user_no
				},
				success : function(data) { 
					console.log("test");
					
					var userHTML = ""; // 게시판위의 나타내어 줄 userId, userProfile 정보 들고오기
					userHTML = 'div class="user">';
					userHTML = '<div style="display:none" name="user_no">'+data.getUser_no()+'</div>';
					userHTML = '<div class="thumb_img"> <img src="../resourceImg/'+data.getUser_folder_name()+'/'+data.getUser_profile_name()+'"/></div>';
					userHTML = data.getReg_id()+'</div> ';	
					
					if(data.length == 0){
						userHTML = 'div class="user">';
						userHTML = '<div style="display:none" name="user_no"></div>';
						userHTML = '<div class="thumb_img"> <img src="../resourceImg/imgs/thumb.jpeg"/></div>';
						userHTML = '</div> '
					}else{
						for(var i = 0;  i < data.lenth(); i++){
							userHTML = 'div class="user">';
							userHTML = '<div style="display:none" name="user_no">'+data.getUser_no()+'</div>';
							userHTML = '<div class="thumb_img"> <img src="../resourceImg/'+data.getUser_folder_name()+'/'+data.getUser_profile_name()+'"/></div>';
							userHTML = data.getReg_id()+'</div>';	
						}
						$("#scroll_inner").html(userHTML);
					}
				}
			});
		}
	</script>
	<section id="main_container">
		<div class="inner">
		<% for(ImageDTO userInfo : rList) { %>
            <div class="contents_box">
                <article class="contents" id="contents" >
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
                                <div class="sprite_heart_icon_outline" name="39" data-name="heartbeat" onclick="location.href='image/LikeCnt.do'"></div>
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
                                <div><h1><%=userInfo.getOne_title() %></h1></div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="page" value="1">
				</article>
			</div>
			<%
		     	}
			%>
		</div>
	</section>
</section>
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
				url : '/image/searchList.do', // 내가 설정한 controller의 url로 이동함 
				type : 'post',
				data : {
					"img_no" : img_no
				},
				success : function(data) {
					console.log("test");
					console.log(data);
					
					var resHTML = ""; // 게시판 정보 들고오기
					resHTML += '<div class="board_number" name="img_no" id="img_no" style="display:none">'+ data.getImage_no() + '</div>';
					resHTML += '<div class="nick_name m_text" name="user_id">'+ data.getReg_id() + '</div>';
					resHTML += '<div class="country s_text" name="LastEdit_DT">'+ data.getChg_dt() + '</div>';
					resHTML += '<div><img src="../resourceImg/Image/' + data.getSave_folder_name() + '/' + data.getSave_file_name() +'" alt="visual01"></div>';
					resHTML += '<div class="likes m_text"> 좋아요 <span id="like-count-39">' + userInfo.getLike_cnt() +'</span> <span id="bookmark-count-39"></span> 개 </div>';
					resHTML += '<div class="comment_container"><div class="comment" id="comment-list-ajax-post37"><div class="comment-detail"><div class="nick_name m_text" name="user_id" ></div><div><h1>' +data.getOne_title()+'</h1></div></div></div></div>';
		
					if (data.length == 0) {
		
						resHTML += '<div class="board_number" name="img_no" id="img_no" style="display:none"></div>';
						resHTML += '<div class="nick_name m_text" name="user_id"></div>';
						resHTML += '<div class="country s_text" name="LastEdit_DT"></div>';
						resHTML += '<div><img src="../resourceImg/imgs/thumb.jepg" alt="visual01"></div>';
						resHTML += '<div class="likes m_text"> 좋아요 <span id="like-count-39"></span> <span id="bookmark-count-39"></span> 개 </div>';
						resHTML += '<div class="comment_container"><div class="comment" id="comment-list-ajax-post37"><div class="comment-detail"><div class="nick_name m_text" name="user_id" ></div><div><h1></h1></div></div></div></div>';
						userHTML = '<div style="display:none" name="user_no"></div>';
						userHTML = '<div class="thumb_img"> <img src="../resourceImg/imgs/thumb.jpeg"/></div>';
						userHTML = '</div> </div> </div>';
			
		
					} else {
		
						for (var i = 0; i < data.length; i++) {
							
							resHTML += '<div class="board_number" name="img_no" id="img_no" style="display:none">'+ data.getImage_no() + '</div>';
							resHTML += '<div class="nick_name m_text" name="user_id">'+ data.getReg_id() + '</div>';
							resHTML += '<div class="country s_text" name="LastEdit_DT">'+ data.getChg_dt() + '</div>';
							resHTML += '<div><img src="../resourceImg/Image/' + data.getSave_folder_name() + '/' + data.getSave_file_name() +'" alt="visual01"></div>';
							resHTML += '<div class="likes m_text"> 좋아요 <span id="like-count-39">' + userInfo.getLike_cnt() +'</span> <span id="bookmark-count-39"></span> 개 </div>';
							resHTML += '<div class="comment_container"><div class="comment" id="comment-list-ajax-post37"><div class="comment-detail"><div class="nick_name m_text" name="user_id" ></div><div><h1>' +data.getOne_title()+'</h1></div></div></div></div>';
							userHTML = '<div class="scroll_inner"><div class="user">';
							userHTML = '<div class="thumb_img"> <img src="../resourceImg/imgs/thumb.jpeg"/></div>';
							userHTML = data.getReg_id()+'</div> </div> </div>';
				
							
					}
						// 게시판의 대한 정보 들고오기 
					$("#contents").html(resHTML); // 설정된 div, span, selection 등의 contents id값 밑으로 html을 생성한다. 
				}
			}
		});
	}
		/* $(function(){
			var index= 0;
			$(window).scroll(function(){
				var $window = $(this); 
				var scrollTop = $window.scrollTop();
				 //현재문서의 높이를 구함.
				var documentHeight  = $(document).height();
				 //세로 스크롤위치 max값과 창의 높이를 더하면 현재문서의 높이를 구할수있음.
				var scrollHeight = $(window).scrollTop()+$(window).height(); 
				var windowHeight = $(document).height();
				 
				if( scrollTop + windowHeight +1>= documentHeight){
					index ++; 
					setTimeout(scroll,200);
					scroll();
				}
			})
		});
		
		function scroll() {
			//alert("test");
			var img_no = $('#img_no').val();
			//alert("제목 : " + post_title);
			if ($('#img_no').val() == "") {
				$('#img_no').focus();
				return false;
			}
		
			console.log("img_no : " + img_no);
	
			$.ajax({
				url : '/image/scrollList.do', // 내가 설정한 controller의 url로 이동함 
				type : 'post',
				data : {
					"img_no" : img_no
				},
				success : function(data) {
					console.log("test");
					console.log(data);
					
					var resHTML = ""; // 게시판 정보 들고오기
					resHTML += '<div class="board_number" name="img_no" id="img_no" style="display:none">'+ data.getImage_no() + '</div>';
					resHTML += '<div class="nick_name m_text" name="user_id">'+ data.getReg_id() + '</div>';
					resHTML += '<div class="country s_text" name="LastEdit_DT">'+ data.getChg_dt() + '</div>';
					resHTML += '<div><img src="../resourceImg/Image/' + data.getSave_folder_name() + '/' + data.getSave_file_name() +'" alt="visual01"></div>';
					resHTML += '<div class="likes m_text"> 좋아요 <span id="like-count-39">' + userInfo.getLike_cnt() +'</span> <span id="bookmark-count-39"></span> 개 </div>';
					resHTML += '<div class="comment_container"><div class="comment" id="comment-list-ajax-post37"><div class="comment-detail"><div class="nick_name m_text" name="user_id" ></div><div><h1>' +data.getOne_title()+'</h1></div></div></div></div>';
		
					if (data.length == 0) {
		
						resHTML += '<div class="board_number" name="img_no" id="img_no" style="display:none"></div>';
						resHTML += '<div class="nick_name m_text" name="user_id"></div>';
						resHTML += '<div class="country s_text" name="LastEdit_DT"></div>';
						resHTML += '<div><img src="../resourceImg/imgs/thumb.jepg" alt="visual01"></div>';
						resHTML += '<div class="likes m_text"> 좋아요 <span id="like-count-39"></span> <span id="bookmark-count-39"></span> 개 </div>';
						resHTML += '<div class="comment_container"><div class="comment" id="comment-list-ajax-post37"><div class="comment-detail"><div class="nick_name m_text" name="user_id" ></div><div><h1></h1></div></div></div></div>';
						userHTML = '<div style="display:none" name="user_no"></div>';
						userHTML = '<div class="thumb_img"> <img src="../resourceImg/imgs/thumb.jpeg"/></div>';
						userHTML = '</div> </div> </div>';
			
		
					} else {
		
						for (var i = 0; i < data.length; i++) {
							
							resHTML += '<div class="board_number" name="img_no" id="img_no" style="display:none">'+ data.getImage_no() + '</div>';
							resHTML += '<div class="nick_name m_text" name="user_id">'+ data.getReg_id() + '</div>';
							resHTML += '<div class="country s_text" name="LastEdit_DT">'+ data.getChg_dt() + '</div>';
							resHTML += '<div><img src="../resourceImg/Image/' + data.getSave_folder_name() + '/' + data.getSave_file_name() +'" alt="visual01"></div>';
							resHTML += '<div class="likes m_text"> 좋아요 <span id="like-count-39">' + userInfo.getLike_cnt() +'</span> <span id="bookmark-count-39"></span> 개 </div>';
							resHTML += '<div class="comment_container"><div class="comment" id="comment-list-ajax-post37"><div class="comment-detail"><div class="nick_name m_text" name="user_id" ></div><div><h1>' +data.getOne_title()+'</h1></div></div></div></div>';
							userHTML = '<div class="scroll_inner"><div class="user">';
							userHTML = '<div class="thumb_img"> <img src="../resourceImg/imgs/thumb.jpeg"/></div>';
		 					userHTML = data.getReg_id()+'</div> </div> </div>';
				
							
					}
						// 게시판의 대한 정보 들고오기 
					$("#contents").append(resHTML); // 설정된 div, span, selection 등의 contents id값 밑으로 html을 생성한다. 
					$(resHTML).appendTo("#contents");
				}
			}
		});
	} */
		
</script>

</html>