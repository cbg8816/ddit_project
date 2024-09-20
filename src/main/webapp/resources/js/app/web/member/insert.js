/**
 *
 */
document.addEventListener("DOMContentLoaded", () => {
	// contextPath
	const cPath = document.body.dataset.contextPath;

	// 중복확인 버튼
	let idChkBtn = document.querySelector(".double-chk-btn");

	// 메시지 div
	let msgDiv = document.querySelector("#msg");

	// 비밀번호
	let pw = document.querySelector("#memLoginPw");

	// 비밀번호 확인
	let pwChk = document.querySelector("#pwChk");

	// 회원가입 버튼
	let ist = document.querySelector("#insert");

	// 탭기능 체크
	memLoginId.addEventListener("blur", () => {
		idChkBtn.click();
	})

	// 중복확인 버튼 클릭 이벤트
	idChkBtn.addEventListener("click", () => {
		// 아이디 input
		let memLoginId = document.querySelector("#memLoginId");

		// 아이디 input value
		let memId = memLoginId.value;

		// 아이디 길이 체크
		if (memId.length <= 0) return false;

		let formData = new FormData();
		// console.log(formData);

		// memId 파라미터 전달
		formData.append("memId", memId);

		// Fetch
		FetchUtils.fetchForJSON(`${cPath}/web/member/idCheck.do`, {
			method: "post",
			headers: {
				"accept": "application/json"
			},
			body: formData
		}).then(json => {
			msgDiv.innerHTML = json.message;

			if (!json.valid) {
				memLoginId.value = "";
				memLoginId.focus();
			}
		});

	})

	// 비밀번호 확인
	pwChk.addEventListener("blur", () => {
		pwV = pw.value;
		pwChkV = pwChk.value;
		if (pwV != pwChkV) {
			alert("비밀번호 확인 실패! 다시 입력해 주세요.")
			pwChk.value = "";
			pw.focus();
		}else {
			ist.disabled = false;
		}
	})

	// 비밀번호 확인 입력 안할 경우 클릭이벤트
	ist.addEventListener("click", () => {
		if(pwChk.value.length <= 0){
			alert("비밀번호 확인 필수! 확인해주세요.")
			ist.disabled = true;
			memLoginId.focus();
		}
	})
})