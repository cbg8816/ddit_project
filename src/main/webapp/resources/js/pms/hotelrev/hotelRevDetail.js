document.addEventListener("DOMContentLoaded", ()=>{

	const revStForm = document.querySelector("#revSt-form");
	const revSt = document.querySelector("#revSt");
	const revId = document.querySelector("#revId");

		// 예약상태 업데이트
	function revStUpdate(){
		const url = `/pms/hotelrev/updateRevSt`;

		let roomSt = revSt.value;
		let revIdVal = revId.value;
		let data = {
			"trevSt":roomSt,
			"trevId":revIdVal
		}
		console.log("data", data);

		fetch(url, {
			method:"post",
			headers:{
				"accept":"application/json",
				"Content-Type":"application/json"
			},
			body:JSON.stringify(data)
		}).then(resp => {
			if(resp.ok){
				// alert("처리완료");
				swal("변경완료", "", "success")
			}else{
				// alert("처리실패!!");
				console.log("resp", resp);
				swal("변경실패!!", "", "error")
			}
		})

	}

	revStForm.addEventListener("submit", (e)=>{
		e.preventDefault();
		revStUpdate();
	})























});