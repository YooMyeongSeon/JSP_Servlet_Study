<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호 입력 성공 페이지</title>
</head>
<body>
	<script>
		if (window.name == "update") {
			window.opener.parent.location.href="BS?command=BoardUpdateFrom&num=${param.num}";
		} else if (window.name == "delete") {
			alert('게시글이 삭제 되었습니다.');
			window.opener.parent.location.href="BS?command=BoardDelete&num=${param.num}";
		}
		window.close();
	</script>
</body>
</html>