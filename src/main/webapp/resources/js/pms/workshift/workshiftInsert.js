

	// 폼태그 정보 가져오기
/*	function getWorkshiftForm(){

	    let elems = workshiftForm.elements; // 사용자 입력태그만 가져옴
        let workshiftVO = {};  // 빈객체
        for (let i = 0; i < elems.length; i++) {
            let elem = elems[i];
            if (elem.name) {
                workshiftVO[elem.name]=elem.value;
            }
        }
        console.log("workshiftVO:", workshiftVO);
		return workshiftVO;
	}*/

document.addEventListener("DOMContentLoaded", ()=>{

	const listBody = document.querySelector("#list-body");
	const listBody2= document.querySelector("#list-body2");

	const workshiftForm = document.querySelector("#workshift-form");
	const workshiftSearch = document.querySelector("#workshift-search");

	const singleUI = (emp)=>{
		let dal = null;
		return `
			<tr onClick="empWorkshiftList('${emp.empId}', ${dal})" style="cursor: pointer;">
				<td>${emp.empId}</td>
				<td>${emp.empName}</td>
				<td>${emp.position.posiNm}</td>
				<td>${emp.department.depNm}</td>
				<td>${emp.empTel}</td>
			</tr>
		`
	};


	console.log("singlUI >>>>>>>>> ", singleUI);

	function empList(){
		const url = `/pms/workshift/workshiftInsert/empList`;

		FetchUtils.fetchForJSON(url,{
			mehtod:"get",
			headers:{
				"accept":"application/json"
			}
		}).then(({eList})=>{
			console.log("서버에서 받은값:", eList);
			let trTags = null;
			if(eList && eList.length > 0){
				trTags = eList.map(singleUI).join("\n");
			}else{
					trTags = `
					<tr>
						<td colsapn="5">조회된 내역 없음</td>
					</tr>
				`;
			}
			listBody.innerHTML = trTags;
		})

	}


	const singleUI2 = (workshift)=>{
		return `
			<tr>
				<input type="hidden" name="workId" value="${workshift.workId}" />
				<input type="hidden" name="empId" value="${workshift.emp.empId}" />
				<td><input type="text" name="empName" value="${workshift.emp.empName}"
					class="form-control" readonly="readonly" /></td>
				<td><input type="text" name="workDay" value="${workshift.workDay}"
					class="form-control" readonly="readonly" /></td>
				<td><select name="workType" class="form-control">
					<option value="" label="타입선택" />
					<option label="A (06:00~14:00)" value="A (06:00~14:00)"
					 ${workshift.workType === 'A (06:00~14:00)' ? 'selected' : ''} >
					<option label="B (08:00~16:00)" value="B (08:00~16:00)"
					 ${workshift.workType === 'B (08:00~16:00)' ? 'selected' : ''} >
					<option label="C (10:00~18:00)" value="C (10:00~18:00)"
					${workshift.workType === 'C (10:00~18:00)' ? 'selected' : ''} >
					<option label="D (14:00~22:00)" value="D (14:00~22:00)"
					${workshift.workType === 'D (14:00~22:00)' ? 'selected' : ''} >
					<option label="E (22:00~06:00)" value="E (22:00~06:00)"
					${workshift.workType === 'E (22:00~06:00)' ? 'selected' : ''} >
					<option label="휴일" value="휴일"
					${workshift.workType === '휴일' ? 'selected' : ''} >
				</select></td>
				<td>
					<label class="input-container">
						<input type="checkbox" class="chk-one" name="workOffyn"
						${workshift.workOffyn === 'Y' ? 'checked' : ''}
						 onchange="this.value = this.checked ? 'Y' : 'N'" value="${workshift.workOffyn}" >
						<span class="checkmark"></span>
					</label>
				</td>
				<td><input type="text" name="workRemark" value="${workshift.workRemark}" class="form-control" /></td>
			</tr>
		`;

	}

	function empWorkshiftList(empId, dal){
		//const url = `/pms/workshift/workshiftInsert/empWorkshift?what=${empId}`;
		const url = `/pms/workshift/workshiftInsert/empWorkshift?what=${empId}&dal=${dal}`;
		console.log("체킁>>>>>>>>>>>", empId);

		FetchUtils.fetchForJSON(url,{
			mehtod:"get",
			headers:{
				"accept":"application/json"
			}
		}).then(({ewList}) => {
			console.log("서버에서 받은값:", ewList);
			let trTags = null;
			if(ewList && ewList.length > 0){
				trTags = ewList.map(singleUI2).join("\n");
			}else{
					trTags = `
					<tr>
						<td colsapn="5">조회된 내역 없음</td>
					</tr>
				`;
			}
			listBody2.innerHTML = trTags;
		})

	}

/*	function chooseMonth(empId, dal){
		console.log("empId 체킁 :", empId)
	}*/

	workshiftSearch.addEventListener("submit", (e) =>{
		e.preventDefault();
		let month = document.querySelector("#dal");
		let dal = month.value;
		let empId = document.querySelector("input[name='empId']").value;
		empWorkshiftList(empId, dal);


		console.log("value>>>>>", dal);
	})

		// 근무표 업데이트
	function workshiftUpdate(){
		const listBodyTr = document.querySelectorAll("#list-body2 tr");
		const url = `/pms/workshift/workshiftInsert/updateWorkshift`;
		const workshiftList = [];
		console.log("listBodyTr : ", workshiftList);
		listBodyTr.forEach(function(row) {
			 const workshift = {
	            empId: row.querySelector("input[name='empId']").value,
	            workId: row.querySelector("input[name='workId']").value,
	            empName: row.querySelector("input[name='empName']").value,
	            workDay: row.querySelector("input[name='workDay']").value,
	            workType: row.querySelector("select[name='workType']").value,
	            workOffyn: row.querySelector("input[name='workOffyn']").value,
	            workRemark: row.querySelector("input[name='workRemark']").value
	        };
	 		workshiftList.push(workshift);
		});

		console.log("workshiftList222", workshiftList);

		fetch(url, {
			method:"post",
			headers:{
				"accept":"application/json",
				"Content-Type":"application/json"
			},
			body:JSON.stringify(workshiftList)
		}).then(resp => {
			if(resp.ok){
				// alert("처리완료");
				swal("처리완료", "", "success")
			}else{
				// alert("처리실패!!");
				swal("처리실패!!", "", "error")
			}
		})

		/*		FetchUtils.fetchForJSON(url,{
			method:"post",
			headers:{
				"accept":"application/json",
				"Content-Type":"application/json",
			},
			body:JSON.stringify(workshiftList)
		}).then(rslt => {
			console.log("workshiftList 서버에서 받은값 >>>>>>:", rslt);
		})*/

	}


	window.empWorkshiftList = empWorkshiftList;

	empList();

	workshiftForm.addEventListener("submit", (e) =>{
		e.preventDefault();
		workshiftUpdate();
	})

	workshiftSearch.addEventListener("submit", (e) =>{
		e.preventDefault();
		empWorkshiftList();

	});






});