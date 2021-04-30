<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String image_nanme = ""; %>
<form enctype="multipart/form-data" action="/image/imageUpload.do" method="post">
	이미지 업로드<input type="file" name="fileUpload">
	<input type="submit" value="send it">
	<input type="text" value="fileUpload">
</form>
</body>
</html>