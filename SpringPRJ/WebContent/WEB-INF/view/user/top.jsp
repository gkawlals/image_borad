<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="poly.util.CmmUtil" %>
<%
	String user_id = CmmUtil.nvl((String)session.getAttribute("name"));
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
                <a onclick="location.href='../map/circle.do'"><div class="sprite_compass_icon"></div></a><!-- 카카오 지도 api연결 -->
                <a href="follow.html"><div class="sprite_heart_icon_outline"></div></a>
                
                <a onclick="location.href='../user/MyPage.do'" ><div class="sprite_user_icon_outline" name="user_id" value=""></div></a>
                
            </div>
        </section>
    </header>
</body>
</html>