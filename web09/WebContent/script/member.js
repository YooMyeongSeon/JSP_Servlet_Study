function loginCheck() {
	//아이디 입력 여부
	if (document.frm.userId.value.length == 0) {
		alert('아이디를 입력하세요');
		document.frm.userId.focus();
		return false;
	}
	//비밀번호 입력 여부
	if (document.frm.userPw.value.length == "") {
		alert('비밀번호를 입력하세요');
		document.frm.userPw.focus();
		return false;
	}
	return true;
}

function joinCheck() {
	//이름 입력 여부
	if (document.frm.name.value.length == 0) {
		alert('이름을 입력하세요');
		document.frm.name.focus();
		return false;
	}
	//아이디 입력 여부
	if (document.frm.userId.value.length == 0) {
		alert('아이디를 입력하세요');
		document.frm.userId.focus();
		return false;
	}
	//암호 입력 여부
	if (document.frm.userPw.value.length == 0) {
		alert('비밀번호를 입력하세요');
		document.frm.userPw.focus();
		return false;
	}
	//전화번호 입력 여부
	if (document.frm.phone.value.length == 0) {
		alert('전화번호를 입력하세요');
		document.frm.phone.focus();
		return false;
	}
	//암호 일치 여부
	if (document.frm.userPw.value != document.frm.pwCheck.value) {
		alert('비밀번호 확인이 일치하지 않습니다.');
		document.frm.userPw.value = "";
		document.frm.pwCheck.value = "";
		document.frm.userPw.focus();
		return false;
	}
	//중복 체크 여부
	if (document.frm.reid.value.length == 0) {
		alert('중복 체크를 하지 않았습니다.');
		document.frm.userId.focus();
		return false;
	}
	return true;
}

function idCheck() {
	//아이디 입력 여부
	if (document.frm.userId.value.length == 0) {
		alert('아이디를 입력하세요');
		document.frm.userId.focus();
		return false;
	}
	let url = "ICS?userId="+document.frm.userId.value;
	
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbar=yes, resizeable=no, width=450, height=200")
}

function idOk() {
	opener.frm.userId.value = document.frm.userId.value;
	opener.frm.reid.value = document.frm.userId.value;
	
	self.close();
}