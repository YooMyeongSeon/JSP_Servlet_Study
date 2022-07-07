<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<link type="text/css" rel="stylesheet" href="CSS/Board.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/Header.html"/>
	<section>
		<p>게시물 조회</p>
		<table>
			<tr>
				<th>제목</th>
				<td colspan="3">${bVo.subject}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${bVo.writer}</td>
				<th>작성일</th>
				<td>${fn:substring(bVo.regdate,0,16)}</td>
			</tr>
			<tr>
				<td colspan="4" id="content">${bVo.content}</td>
			</tr>
			<tr>
				<th colspan="4">댓글 조회</th>
			</tr>
			<tbody id="writeComment">
				<c:forEach items="${list}" var="comment">
					<tr id="idx${comment.idx}">
						<td colspan="4">${comment.writer} / ${comment.content} / ${fn:substring(comment.regdate,0,16)} / <a href="javascript:delcmt();">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
			
			<tr>
				<th>댓글 작성</th>
				<td colspan="3">
					<input id="c_writer" type="text" name="c_writer" placeholder="작성자" required>
					<input id="c_content" type="text" name="c_content" placeholder="댓글 내용" required>
					<button id="c_btn" onclick="wrcmt()">댓글 작성</button>
				</td>
			</tr>
		</table>
		<button onclick="location.href='BUS?idx=${bVo.idx}'">게시물 수정</button>
		<button onclick="location.href='BDS?idx=${bVo.idx}'">게시물 삭제</button>
		<button onclick="location.href='BLS'">목록</button>
	</section>
	<jsp:include page="/Footer.html"/>
	<script type="text/javascript">
		function wrcmt() {
			let writer = $('#c_writer').val();
			let content = $('#c_content').val();
			
			let comment = {"writer" : writer, "content" : content};
			$.ajax({
				type : "post",
				async : true,
				url : "CWS",
				data : {"comment" : JSON.stringify(comment)},
				datetype : "text",
				success : function(data) {
					let Info = JSON.parse(data);
					
					let html = "";
					
					html += "<tr id=\"idx" + Info.idx + "\">";
					html += "<td colspan=\"4\">";
					html += Info.writer + " / " + Info.content + " / " + ${fn:substring(Info.regdate,0,16)} + " / ";
					html += "<a href=\"javascript:delcmt();\">삭제</a>";
					html += "</td>";
					html += "</tr>";
								
					$("#writeComment").append(html);
				}
			});
		    $('#c_writer').val("");
			$('#c_content').val("");
		}
		
		function delcmt() {
			alert("테스트");
		}
	</script>
</body>
</html>