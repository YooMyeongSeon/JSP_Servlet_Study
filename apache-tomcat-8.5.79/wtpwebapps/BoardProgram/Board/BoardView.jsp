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
<script src="./jQuery/jquery-3.6.0.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="/Header.html"/>
	<section>
		<p>게시물 조회</p>
		<form>
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
			<c:forEach items="${list}" var="comment">
				<tr>
					<td colspan="4">${comment.writer} / ${comment.content} / ${fn:substring(comment.regdate,0,16)} / <a href="javascript:delcmt(${comment.idx});">삭제</a></td>
				</tr>
			</c:forEach>
			
			<tr id="writeComment">
				<th>댓글 작성</th>
				<td colspan="3"><input id="c_writer" type="text" name="c_writer" placeholder="작성자" required><input id="c_content" type="text" name="c_content" placeholder="댓글 내용" required><input id="c_btn" type="button" value="댓글 작성" onclick="wrcmt()"></td>
			</tr>
		</table>
		</form>
		<button onclick="location.href='BUS?idx=${bVo.idx}'">게시물 수정</button>
		<button onclick="location.href='BDS?idx=${bVo.idx}'">게시물 삭제</button>
		<button onclick="location.href='BLS'">목록</button>
	</section>
	<jsp:include page="/Footer.html"/>
	<script type="text/javascript">
		function wrcmt() {
			alert("테스트");
			let writer = $('#c_writer').val();
			let content = $('#c_content').val();
			
			let comment = {"writer" : writer, "content" : content};
			///////////////////////////////////////////////////////////////////
			$.ajax({
				type : "post",
				async : true,
				url : "CWS",
				data : {"comment" : JSON.stringify(comment)},
				datetype : "text",
				success : function(data) {
					let Info = JSON.parse(data);
					
					let html = "";
					
					html += "<tr id=\"num" + num + "\">";
					html += "<td>" + Info.num + "</td>";
					html += "<td><a href=\"javascript:view(" + num + ");\">" + Info.title + "</a></td>";
					html += "<td>" + Info.content + "</td>";
					html += "<td>" + Info.date + "</td>";
					html += "<td><a href=\"javascript:del(" + num + ");\">삭제</a></td>";
					html += "</tr>";
								
					$("#writeComment").append(html);
				}
			});
		    $('#c_writer').val("");
			$('#c_content').val("");
		}
		
		function delcmt(delipx) {
			let delipx = "#num" + JSON.stringify(delipx);
			$(delipx).remove();
		}
	</script>
</body>
</html>