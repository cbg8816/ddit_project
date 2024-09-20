/**
 *
 */
// console.log("체킁");

document.addEventListener("DOMContentLoaded", () => {
	// console.log("체킁");

	// body data-context-path.
	const contextPath = document.body.dataset.contextPath;

	// admin-body.
	const adminBody = document.querySelector("#admin-body");

	// admin-page
	const adminPage = document.querySelector("#admin-page");

	// 회원 목록 UI.
	const listUI = (l) => {
		return `
				<tr>
					<td>${l.no}</td>
					<td>${l.rankCode}</td>
					<td>${l.memName}</td>
					<td style="text-align:left">${l.memId}</td>
					<td style="text-align:left">${l.memTel}</td>
					<td style="text-align:left">${l.memEmail}</td>
					<td>${l.memYn}</td>
				</tr>
				`;
	}

	// 회원 목록. FETCH.
	const adminList = (param1 = "", param2 = "") => {
			fetch(`${contextPath}/admin?page=${param1}&memName=${param2}`, {
			method:"get",
			headers:{
				accept:"application/json"
			}
		}).then(resp => {
			resp.json().then(rslt => {
				// console.log(rslt);
				// console.log(rslt.list);
				let trTags = "";

				if(rslt.list.length > 0){
					trTags = rslt.list.map(listUI).join("\n");
				}else{
					trTags = `
							<tr>
								<td colspan="7">등록된 회원이 없습니다.</td>
							</tr>
							`;
				}
				adminBody.innerHTML = trTags;
				adminPage.innerHTML = rslt.pagingHTML;
			})
		})
	}

	// AXIOS.
	/*axios.get(`${contextPath}/admin`)
		.then(resp => {
			let rslt = resp.data;
			// console.log(rslt);
			// console.log(rslt.list);
		})*/

	// AJAX.
	/*$.ajax({
		url:`${contextPath}/admin`,
		method:"get",
		dataType:"json",
		success:function(resp){
			// console.log(resp);
			// console.log(resp.list);
		}
	})*/

	adminList();

	// 페이징 버튼.
	adminPage.addEventListener("click", (e) => {
		// console.log("체킁");
		// console.log(e.target);
		// console.log(e.target.dataset);
		// console.log(e.target.dataset.page);
		let param1 = e.target.dataset.page;
		$("#page").val(param1);

		adminList(param1);
	})

	// 검색 버튼.
	$("#adminBtn").click(() => {
		let param1 = $("#page").val();
		let param2 = $("#memName").val();
		console.log(param1);
		console.log(param2);
		adminList(param1, param2);
	})

	// 키보드 누를때마다 검색.
	$("#memName").keyup(() => {
		console.log($("#memName").val());
		$("#adminBtn").click();
	})
})