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
<title>Insert title here</title>
</head>
<body>
<form>
	<div>
	<% 
		for (ImageDTO img : rList){
	%>
		<input type="text" value="<%=img.getImage_no() %>" name="img_no"/>
		<input type="text" value="<%=img.getReg_id() %>" name="user_id"/>
		<img src="../resourceImg/Image/<%=img.getSave_folder_name() %>/<%=img.getSave_file_name() %>" name="imgfile"/>
		<input type="text" value="<%=img.getChg_dt() %>" name="InsertDate"/>
		<br>
		<br>
	<% 
		}
	%>
	</div>
</form>
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
					console.log(data)
		
					var resHTML = "";
					resHTML += '<input type="text"/>';
					resHTML += '<input type="text"/>';
					resHTML += '<img  height="300px" width="240px" name="imgfile" />';
					resHTML += '<input type="text"/>';
					resHTML += '<br><br>';
		
					if (data.length == 0) {
		
						resHTML += '<input type="text"/>';
						resHTML += '<input type="text"/>';
						resHTML += '<img  height="300px" width="240px" name="imgfile" />';
						resHTML += '<input type="text"/>';
						resHTML += '<br><br>';
		
					} else {
		
						for (var i = 0; i < data.length; i++) {
							
							resHTML += '<input type="text" value="' + data.getImage_no() +'" />';
							resHTML += '<input type="text" value="'+ data.getReg_id() +'"/>';
							resHTML += '<img src="../resourceImg/Image/'+data.getSave_folder_name()+'/'+data.getSave_file_name()'" name="imgfile" />';
							resHTML += '<input type="text" value ="'+ data.getChg_dt()+'"/>';
							resHTML += '<br><br>';
			
							
					}
					$("#searchList").html(resHTML);
		
				}
			})
		}
</script>
</html>