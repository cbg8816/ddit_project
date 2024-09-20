
/*function hotelRevInsert(form) {
	FetchUtils.fetchForJSON("/hotelrev/hotelRevInsert.do", {
		method:form.method,
		headers:{
			"content-type":"application/json",
			"accept":"application/json"
		},
		body:formDataToJSON(form)
	}).then(rslt => {
		console.log("서버에서 받은값:", rslt);
	})
}*/




/*	// formData to JSON 데이터 변환
	const formDataToJSON = (form)=>{
		let formData = new FormData(form);
		let data = {};
		for(let name of formData.keys()){
			let value = formData.get(name);
			data[name] = value;
		}
		console.log(data)
		return JSON.stringify(data);
	}*/

	const hsForm = document.querySelector("#insertForm");
	    function fHsMake2() {
            let elems = hsForm.elements; // 사용자 입력태그만 가져옴
            let htrevVO = {};  // 빈객체
            for (let i = 0; i < elems.length; i++) {
                let elem = elems[i];
                if (elem.name) {
                    htrevVO[elem.name]=elem.value;
                }
            }
            console.log("htrevVO:", htrevVO);
			return htrevVO;
        }


/*	function insert(){
		let htrevVO = {

		}
	}*/

	function hotelRevInsert() {
		// let data = JSON.stringify(fHsMake2());
		FetchUtils.fetchForJSON("/pms/hotelrev/hotelRevInsert.do", {
			method:"post",
			headers:{
				"accept":"application/json",
				"Content-Type":"application/json",
			},
			body:JSON.stringify(fHsMake2())
		}).then(rslt => {
			console.log("서버에서 받은값:", rslt);
		})
	}
function addRow() {

	const table = document.getElementById('roomtypes');

	 const newRow = table.insertRow();
	 let newIndex = table.rows.length - 2;

	 const newCell1 = newRow.insertCell(0);
	 const newCell2 = newRow.insertCell(1);

	 newCell1.innerHTML = `<td><input name='revRoomList[\${newIndex}].roomtypeId' /></td>`;
	 newCell2.innerHTML = `<td><input name='revRoomList[\${newIndex}].roomId' /></td>`;
}

function deleteRow(rownum) {
	const table = document.getElementById('roomtypes');

	const newRow = table.deleteRow(rownum);
}

document.addEventListener("DOMContentLoaded", ()=>{
	//document.getElementById("insertForm").addEventListener("submit", hotelRevInsert)


});




