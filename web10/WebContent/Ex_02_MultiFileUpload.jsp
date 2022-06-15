<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다수의 파일 업로드</title>
</head>
<body>
	<form action="MUS" method="POST" enctype="multipart/form-data">
		1. 파일 지정 <input type="file" name="fileUpload01" accept=".png"><br>
		2. 파일 지정 <input type="file" name="fileUpload02"><br>
		3. 파일 지정 <input type="file" name="fileUpload03"><br>
		4. 파일 지정 <input type="file" name="fileUpload04"><br>
		<input type="submit" value="업로드">
	</form>
</body>
</html>