function fnvalidation(){
	var sno = document.getElementById("sno");
	var snm = document.getElementById("snm");
	var gman = document.getElementById("gman");
	var gwoman = document.getElementById("gwoman");
	
	if(!sno.value){
		alert("학번이 입력되지 않았습니다.");
		sno.focus();
		return false;
	}
	else if(!snm.value){
		alert("성명이 입력되지 않았습니다.");
		snm.focus();
		return false;
	}
	else if(!gman.checked && !gwoman.checked){
		alert("성별이 선택되지 않았습니다.");
		gman.focus();
		return false;
	}
	return true;
}

function fnreset(){
	alert("입력을 초기화 합니다.");
}

function fnselect(){
	var soption = document.getElementById("soption");
	var selec = document.getElementById("selec");
	
	if(soption.value == 0){
		alert("조회항목을 선택하지 않았습니다.");
		soption.focus();
		return false;
	}
	else if(!selec.value){
		alert("조회내용을 입력하지 않았습니다.");
		selec.focus();
		return false;
	}
	return true;
}