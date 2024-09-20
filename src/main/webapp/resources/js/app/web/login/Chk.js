/**
 *
 */
document.addEventListener("DOMContentLoaded", () => {
	// contextPath
	const cPath = document.body.dataset.contextPath;

	// 아이디 찾기 버튼
	let idChkBtn = document.querySelector("#idChk-btn");

	// 비밀번호 찾기 버튼
	let pwChkBtn = document.querySelector("#pwChk-btn");

	// 아이디 찾기 버튼 이벤트
	idChkBtn.addEventListener("click", () => {
		// 성명 value
		let memName1 = document.querySelector("#memName");
		let memName = document.querySelector("#memName").value;
		// 전화번호 value
		let memTel1 = document.querySelector("#memTel");
		let memTel = document.querySelector("#memTel").value;
		console.log(memName);
		console.log(memTel);

		// axios
		axios.post(`${cPath}/web/member/idChk.do`, {
			memName:memName,
			memTel:memTel
		}).then((resp) => {
			let rslt = resp.data
			swal("아이디 찾기", rslt.message, "info");
			memName1.value = "";
			memTel1.value = "";
		})

	})

	// 비밀번호 찾기 버튼 이벤트
	pwChkBtn.addEventListener("click", () => {
		// 아이디 value
		let memLoginId1 = document.querySelector("#memLoginId1");
		let memLoginId = document.querySelector("#memLoginId1").value;

		// 섬영 value
		let memName1 = document.querySelector("#memName1");
		let memName = document.querySelector("#memName1").value;

		// 전화번호 value
		let memTel1 = document.querySelector("#memTel1");
		let memTel = document.querySelector("#memTel1").value;

		// axios
		axios.post(`${cPath}/web/member/pwChk.do`, {
			memLoginId:memLoginId,
			memName:memName,
			memTel:memTel
		}).then((resp) => {
			let rslt = resp.data
			if(rslt.message == "ok"){
				swal("비밀번호 찾기", "비밀번호 변경 페이지로 이동됩니다.", "info");
				location.href=`${cPath}/web/updatePw.do?what=${memLoginId}`
			}else{
				swal("비밀번호 찾기", rslt.message, "info");
				memLoginId1.value = "";
				memName1.value = "";
				memTel1.value = "";
			}
		})
	})
})