document.addEventListener("DOMContentLoaded", ()=>{


// arriveListModal
// arriveListBtn
// $('#lostitem').modal('show');

	// contextpath
	const cPath = document.body.dataset.contextPath;
	const listBtn = document.querySelector("#arriveListBtn");
	const arriveModal2 = document.querySelector("#arriveListModal");
	//const arriveModal = bootstrap.Modal.getOrCreateInstance(arriveModal2);
	const mClose = document.querySelector("#modalClose");
	const modalSearch = document.querySelector("#modalSearch");
	const mPaging = document.querySelector("#modalPaging");

	const listBody = document.querySelector("#list-body");
	const singleUI = (hotelRev) =>{
		const roomTypes = hotelRev.revRoomList.map(room => room.roomtypeNm).join(', ');
				//<td>${hotelRev.htrevArrive}</td>
				//<td>${hotelRev.htrevCn}</td>
		return `
			<tr id="row-${hotelRev.htrevId}">
				<td>
					<a href="/pms/hotelrev/hotelRevDetail.do?what=${hotelRev.htrevId }">${hotelRev.htrevId}</a>
				</td>
				<td>${hotelRev.memName}</td>
				<td>${roomTypes}</td>
				<td>
					<button type='button' onclick="updateArriveY('${hotelRev.htrevId}')">도착완료처리</button>
				</td>
			</tr>
		`
	};

	mClose.addEventListener("click", () => {
		console.log("체킁2");
		$("#modalClose").modal("hide");
	})

	listBtn.addEventListener("click", ()=>{
		//arriveModal2.show();
		//arriveModal.modal
		console.log("체킁");
		$("#arriveListModal").modal("show");
		arriveYNList();
	});

	function arriveYNList() {
/*		FetchUtils.fetchForJSON("/pms/hotelrev/arriveList", {
			headers:{
				"accept":"application/json"
			}
		}).then(({aList}) => {
			console.log("서버에서 받은값:", aList);
			let trTags = null;
			if(aList && aList.length > 0){
				trTags = aList.map(singleUI).join("\n");
			}else{
				trTags = `
					<tr>
						<td colsapn="5">조회된 내역 없음</td>
					</tr>
				`;
			}
			listBody.innerHTML = trTags;
		})*/


		modalSearch.addEventListener("submit", (e) => {
			e.preventDefault();
			let formData = new FormData(e.target);
			let data = new URLSearchParams(formData).toString();

			// const page = document.querySelector("#modalPage").value;
			// console.log("777777777777777>>", page);
			const url = `/pms/hotelrev/arriveList?${data}`

			FetchUtils.fetchForJSON(url, {
				method:"get",
				headers:{
					"accept":"application/json"
				}
			}).then(({aList, pagingHTML2}) => {
				console.log("서버에서 받은값:", aList);
				console.log("서버에서 받은값2:", pagingHTML2);
				let trTags = null;
				if(aList && aList.length > 0){
					trTags = aList.map(singleUI).join("\n");
				}else{
					trTags = `
						<tr>
							<td colsapn="4">조회된 내역이 없습니다.</td>
						</tr>
					`;
				}
				listBody.innerHTML = trTags;
				//mPaging.innerHTML = pagingHTML;
				$("#modalPaging").html(pagingHTML2);
			})
		})
		modalSearch.requestSubmit();
	}



/*	async function arriveYNList() {

		let resp = await fetch("/pms/hotelrev/arriveList");
		let aList = await resp.json();

		console.log("서버에서 받은값:", aList);
			let trTags = null;
			if(aList && aList.length > 0){
				trTags = aList.map(singleUI).join("\n");
			}else{
				trTags = `
					<tr>
						<td colsapn="5">조회된 내역 없음</td>
					</tr>
				`;
			}
			listBody.innerHTML = trTags;
	}*/
	function updateArriveY(htrevId) {
		console.log("체킁체킁체킁");
		const url = `/pms/hotelrev/arriveComplete?what=${htrevId}`;
		console.log("2222222222222", url)

	/*	FetchUtils.fetchForJSON(url,{
			'Content-Type': 'application/json'
		})*/

		fetch(url).then(response => {
	        if (response.ok) {
	            // 업데이트가 성공하면 테이블에서 해당 행을 제거
	      /*      const row = document.getElementById(`row-${htrevId}`);
	            if (row) {
	                row.remove();
	            }*/
				arriveYNList();
	            // alert('처리완료');
				swal("처리완료", "", "success")
	        } else {
	            // alert('처리실패!!');
				swal("처리실패!!", "", "error")
	        }
    	})

/*
		FetchUtils.fetchForText(url)
			.then(resp => {
				console.log("resp>>>", resp);
        if (resp.ok) {
            // 업데이트가 성공하면 테이블에서 해당 행을 제거
            const row = document.getElementById(`row-${htrevId}`);
			console.log("rrrrrrrrwo", row);
            if (row) {
                row.remove();
            }
            alert('Arrival status updated successfully.');
        } else {
            alert('Failed to update arrival status.');
        }
    })*/

	}

	window.updateArriveY = updateArriveY;

});








