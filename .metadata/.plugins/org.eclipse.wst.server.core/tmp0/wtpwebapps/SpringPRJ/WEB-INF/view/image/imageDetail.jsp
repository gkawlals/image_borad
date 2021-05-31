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


    <style>
        #main_container {
            /*height: 6000px;*/
        }
    </style>
</head>
<body>
<section id="container">

    <%@ include file="/WEB-INF/view/user/top.jsp" %>
    
    <div id="main_container">
        <section class="b_inner">
            <div class="contents_box">
                <article class="contents cont01">
                    <div class="img_section">
                        <div class="trans_inner">
                            <div><img src="imgs/img_section/img03.jpg" alt=""></div>
                        </div>
                    </div>
                    <div class="detail--right_box">
                        <header class="top">
                            <div class="user_container">
                                <div class="profile_img">
                                    <img src="imgs/thumb.jpeg" alt="">
                                </div>
                                <div class="user_name">
                                    <div class="nick_name">KindTiger</div>
                                    <div class="country">Seoul, South Korea</div>
                                </div>
                            </div>
                            <div class="sprite_more_icon" data-name="more">
                                <ul class="more_detail">
                                    <li>팔로우</li>
                                    <li>수정</li>
                                    <li>삭제</li>
                                </ul>
                            </div>
                        </header>
                        <section class="scroll_section">
                            <div class="admin_container">
                                <div class="admin"><img src="imgs/thumb.jpeg" alt="user"></div>
                                <div class="comment">
                                    <span class="user_id">Kindtiger</span>
                                    <div type="text" name="one_title"> 강아지가 많이 힘들어 보이네요 ㅠㅠ 힘내!</div>                         
                                </div>
                            </div>
                        </section>
                        <div class="bottom_icons">
                            <div class="left_icons">
                            </div>
                            <div class="right_icon">
                            </div>
                        </div>
                        <div class="commit_field">
                            <div class="heart_btn">
                                <div class="sprite_heart_icon_outline" data-name="heartbeat"></div>
                            </div>
                            <div class="count_likes">
                                좋아요
                                <span class="count">2,351</span>
                                개
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </section>
    </div>
    <div class="del_pop">
        <div class="btn_box">
            <div class="del">삭제</div>
            <div class="cancel">취소</div>
        </div>
   </div>
</section>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!--<script src="js/detail.js"></script>-->
</body>
</html>