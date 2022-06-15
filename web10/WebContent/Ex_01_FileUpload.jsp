<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<form action="US" method="POST" enctype="multipart/form-data">
		글쓴이 : <input type="text" name="name"><br>
		제　목 : <input type="text" name="title"><br>
		파　일 : <input type="file" name="fileUpload"><br>
		<input type="submit" value="업로드">
	</form>
</body>
</html>