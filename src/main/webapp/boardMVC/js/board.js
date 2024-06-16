/*
수정 삭제
>> boardDelUpdChk.jsp
01. 해당 번호의 pwd, 사용자 입력값 비교
02. 불일치 >> alert : 비밀번호가 일치하지 않습니다.
		 >> select() 적용
03. 일치 >> alert : 비밀번호 일치 해당 메뉴로 이동합니다.
	- del : boardDelPro.jsp 이동 >> msg : boardDelFrame.jsp 파일입니다.
	- upd : boardUpdFrame.jsp 이동
*/

var form;
var bod_no;
var number;

var vPwd;

function mInit(){
	bod_no = document.getElementById("bod_no");
	form = document.forms[0];
}

function chkInit(){
	vPwd = document.getElementById("pwd");
	form = document.forms[0];
	vPwd.focus();
}

function valSend(idx){
	bod_no.value = idx;
	console.log(bod_no.value);
	form.submit();
}

function valSend2(no, pwd, category){
	//let prjPath = "/webPro01/ControllerBoard.do?";
	//let prjPath = "/webPro01/MVCJSTLBoard.do?";
	if(pwd == vPwd.value){
		alert("비밀번호 일치 확인. 해당 메뉴로 이동합니다.");
		document.getElementById("bod_no").value = no;
		document.getElementById("bodCtg").value = (category == "del") ?
												"bodDelete" : "pageUpdate";
		/*form.action = (category == "del") ?
			prjPath+"bodCtg=bodDelete" : prjPath+"bodCtg=pageUpdate";*/
		form.submit();
	} else {
		alert("비밀번호가 일치하지 않습니다.");
		vPwd.select();
	}
}