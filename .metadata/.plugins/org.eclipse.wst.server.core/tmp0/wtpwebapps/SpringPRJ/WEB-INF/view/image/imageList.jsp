<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <link rel="stylesheet" href="../resourceImg/css/reset.css">
    <link rel="stylesheet" href="../resourceImg/css/common.css">
    <link rel="stylesheet" href="../resourceImg/css/style.css">
    
    
<title>Insert title here</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
<section id="container" class="scroll" id="autsoScroll">


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
    <section id="main_container">
        <div class="inner">
        
            <div class="contents_box">
            
                <article class="contents">
                    <header class="top">
                        <div class="user_container">
                            <div class="profile_img">
                                <img src="../resourceImg/imgs/thumb.jpeg" alt="프로필이미지">
                            </div>
                            <div class="user_name">
                                <div class="nick_name m_text">KindTiger</div>
                                <div class="country s_text">Seoul, South Korea</div>
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
                            <div><img src="../resourceImg/imgs/img_section/img01.jpg" alt="visual01"></div>
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
                        <span id="like-count-39">2,346</span>
                        <span id="bookmark-count-39"></span>
                        개
                    </div>

                    <div class="comment_container">
                        <div class="comment" id="comment-list-ajax-post37">
                            <div class="comment-detail">
                                <div class="nick_name m_text">dongdong2</div>
                                <div>강아지가 너무 귀여워요~!</div>
                            </div>
                        </div>
                        <div class="small_heart">
                            <div class="sprite_small_heart_icon_outline"></div>
                        </div>
                    </div>


                    <div class="comment_field" id="add-comment-post37">
                         
                        <div class="upload_btn m_text" data-name="comment">게시</div>
                    </div>
                </article>

            </div>
            <input type="hidden" id="page" value="1">
        </div>
    </section>
</section>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</body>
</html>