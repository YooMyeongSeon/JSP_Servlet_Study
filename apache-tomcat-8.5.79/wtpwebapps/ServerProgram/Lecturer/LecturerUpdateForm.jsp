<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 프로그램 구현</title>
<link type="text/css" rel="stylesheet" href="CSS/Style.css">
<style>
	div {
		width: 600px;
	}
	table {
		margin: 20px auto;
		width: 600px;
	}
	th {
		width: 200px;
	}
	td {
		width: 400px;
		padding: 10px 20px;
	}
	.input {
		width: 380px;
		outline: none;
		border: none;
		color: #ccc;
	}
	.input {
		width: 360px;
		outline: none;
		border: none;
	}
	#field {
		float: left;
	}
	#sbm, #del, #lst {
		width: 80px;
		height: 25px;
		float: left;
		margin: 0px 10px;
	}
	#sbm {
		margin-left: 160px;
	}
</style>
</head>
<body>
	<jsp:include page="/Header.html"/>
	<div>
		<h3>강사 수정</h3>
		<form action="CS" method="post">
			<input type="hidden" name="command" value="lecturerUpdateAction">
			<table>
				<tr>
					<th>강사 번호</th>
					<td><input style="color:black;" class="input" type="number" name="idx" value="${lVo.idx}" readonly></td>
				</tr>
				<tr>
					<th>강사 이름</th>
					<td><input class="input" type="text" name="name" value="${lVo.name}" required></td>
				</tr>
				<tr>
					<th>전공</th>	
					<td><input class="input" type="text" name="major" value="${lVo.major}" required></td>
				</tr>
				<tr>
					<th>세부 전공</th>
					<td><span id="field">${lVo.field}</span></td>
				</tr>
			</table>
			<input id="sbm" type="submit" value="수정" id="submit">
		</form>
		<button id="del" class="but" onclick="check()">삭제</button>
		<button id="lst" class="but" onclick="location.href='CS?command=lecturerListAction'">취소</button>
	</div>
	<jsp:include page="/Footer.html"/>
	<script type="text/javascript">
		function check() {
			if (!confirm("강사를 삭제하시겠습니까?")) {
				return false;
		    } else {
		    	location.href="CS?command=lecturerDeleteAction&idx=${lVo.idx}";
		    }
		}
	</script>
</body>
</html>