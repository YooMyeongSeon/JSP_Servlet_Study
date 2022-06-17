<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<link type="text/css" rel="stylesheet" href="Style/ProductCss.css">
</head>
<body>
	<div id="wrap" align="center">
		<h1>상품 수정 페이지 : 관리자 페이지</h1>
		<form action="PU" method="POST" enctype="multipart/form-data">
			<table>
				<tr>
					<td rowspan="4">
						<c:choose>
							<c:when test="${empty pVo.pictureurl}">
								<img alt="이미지 없음" src="./Upload/noimage.jpg">
							</c:when>
							<c:otherwise>
								<img alt="상품 이미지" src="./Upload/${pVo.pictureurl}">
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="code" value="${pVo.code}">
					</td>
					<th>상품 이름</th>
					<td><input type="text" name="name" value="${pVo.name}" required></td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td><input type="number" name="price" value="${pVo.price}" required>원</td>
				</tr>
				<tr>
					<th>상품 이미지</th>
					<td>
						<input type="file" name="pictureurl"><br>
						※ 이미지를 변경하고자 할때만 선택하세요.
						<input type="hidden" name="originPictureurl" value="${pVo.pictureurl}">
					</td>
				</tr>
				<tr>
					<th>상품 설명</th>
					<td><textarea rows="10" cols="80" name="description">${pVo.description}</textarea></td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="submit" value="수정">
						<input type="reset" value="다시 작성">
						<input type="button" value="취소" onclick="location.href='PL'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>