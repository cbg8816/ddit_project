/**
 *
 */
document.addEventListener("DOMContentLoaded", function(){
	const contextPath = document.body.dataset.contextPath;
	const sheetArea = document.querySelector("#sheet-area");
	const formArea = document.querySelector("#form-area");

	const formMonth = (budget) => {
		return `
		<tr><td>1월</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>2월</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>3월</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>4월</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>5월</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>6월</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>7월</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>8월</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>9월</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>10월</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>11월</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>12월</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		`
	}

	const formQuater = (budget) => {
		return `
		<tr><td>1/4분기</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>2/4분기</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>3/4분기</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>4/4분기</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		`
	}

	const formHalf = (budget) => {
		return `
		<tr><td>상반기</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		<tr><td>하반기</td><td><input type="text" name="front" value="${budget}"></td><td><input type="text" name="house" value="${budget}"></td><td><input type="text" name="asset" value="${budget}"></td><td><input type="text" name="personnel" value="${budget}"></td><td><input type="text" name="manage" value="${budget}"></td><td>${budget}</td></tr>
		`
	}

	const selForm = document.querySelector("sel-form");

	FetchUtils.fetchForText(`${contextPath}/budget/budgetList.do`,{
		method:"post",
		headers:{"accept":"text/html"}
	}).then(html=>{
		sheetArea.innerHTML = html;
		sheetArea.querySelector(".page-header").remove();
	});

	FetchUtils.fetchForJSON(`${contextPath}/budget/budgetUpdate.do`,{
		headers:{"accept":"application/json"}
	}).then(({budget})=>{
		if(budget && budget.length > 0){
			if(selForm.value == "form1"){
				sheetArea.innerHTML = budget.map(formMonth).join("\n");
			}else if(selForm.value == "form2"){
				sheetArea.innerHTML = budget.map(formQuater).join("\n");
			}else{
				sheetArea.innerHTML = budget.map(formHalf).join("\n");
			}
		}else{
			formArea.innerHTML = `<tr><td colspan="7">데이터 없음.</td></tr>`
		}
	});


});