<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표 프로그램</title>
<link type="text/css" rel="stylesheet" href="CSS/Style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/Header.html"/>
	<section id="contents">
		<h2>투표하기</h2>
		<form action="VS" method="post">
			<table>
				<tr>
					<th>주민번호</th>
					<td><input id="v_Jumin" class="input" type="number" name="v_Jumin" placeholder="주민번호 : 숫자로 입력 Ex)8906153154726"></td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input id="v_Name" class="input" type="text" name="v_Name" placeholder="이름 입력"></td>
				</tr>
				<tr>
					<th>후보번호</th>
					<td>
						<div class="left">
							<select name="m_No" id="m_No">
								<option value="" selected>후보를 선택하세요</option>
								<c:forEach items="${list}" var="member">
									<option value="${member.m_No}">[${member.m_No}]${member.m_Name}</option>
								</c:forEach>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>투표시간</th>
					<td><input id="v_Time" class="input" type="number" name="v_Time" placeholder="투표시간 : 숫자로 입력 Ex)09시 30분 : 0930"></td>
				</tr>
				<tr>
					<th>투표장소</th>
					<td><input id="v_Area" class="input" type="text" name="v_Area" placeholder="투표장소 입력"></td>
				</tr>
				<tr>
					<th>유권자확인</th>
					<td>
						<div class="left">
							<input class="v_Confirm" type="radio" name="v_Confirm" value="Y"> 확인　
							<input class="v_Confirm" type="radio" name="v_Confirm" value="N"> 미확인
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input class="button" type="submit" value="투표하기" onclick="return check()">
						<input class="button" type="reset" value="다시하기" onclick="re()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="/Footer.html"/>
	<script type="text/javascript">
		function check() {
			if ($('#v_Jumin').val() == "") {
				alert('주민번호가 입력되지 않았습니다!');
				$('#v_Jumin').focus();
				return false;
			}
			if ($('#v_Name').val() == "") {
				alert('성명이 입력되지 않았습니다!');
				$('#v_Name').focus();
				return false;
			}
			if ($('#m_No').val() == "") {
				alert('후보번호가 선택되지 않았습니다!');
				$('#m_No').focus();
				return false;
			}
			if ($('#v_Time').val() == "") {
				alert('투표시간이 입력되지 않았습니다!');
				$('#v_Time').focus();
				return false;
			}
			if ($('#v_Area').val() == "") {
				alert('투표장소가 입력되지 않았습니다!');
				$('#v_Area').focus();
				return false;
			}
			if ($('.v_Confirm').is(":checked") == false) {
				alert('유권자확인이 선택되지 않았습니다!');
				$('#v_Confirm').focus();
				return false;
			}
			alert('투표하기 정보가 정상적으로 등록 되었습니다!');
		}
		
		function re() {
			alert('정보를 지우고 처음부터 다시 입력합니다!');
			$('#v_Jumin').focus();
		}
	</script>
</body>
</html>