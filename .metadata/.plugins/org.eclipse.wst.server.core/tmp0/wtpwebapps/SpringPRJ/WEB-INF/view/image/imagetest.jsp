<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<select id="container">
    <%@ include file="/WEB-INF/view/user/top.jsp" %>
	<form enctype="multipart/form-data" action="/image/imageUpload.do" method="post">
		이미지 업로드<input type="file" name="fileUpload">
		<br>한 줄평
		<input type="text" name="one_title">
		<br>
		<input type="submit" value="send it">
	</form>
	
</select>
</body>
</html>