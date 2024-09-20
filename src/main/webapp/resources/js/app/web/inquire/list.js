/**
 *
 */
document.addEventListener("DOMContentLoaded", () => {
	// contextPath
	const cPath = document.body.dataset.contextPath;

	// memId
	const principal = document.querySelector("#principal").value;
	// console.log(principal);

	// list-body
	const listBody = document.querySelector("#list-body");

	const paging = document.querySelector(".paging-area");

	const inqInsert = document.querySelector("#inquire-btn");

	inqInsert.addEventListener("click", () => {
		location.href = `${cPath}/web/inquire/insert.do`;
	})

	// UI
	const singleUI = (inquire) => {
		return `
				<tr>
					<td>${inquire.inqLock == 2 ? "<i class='fa-solid fa-lock'></i>" : "" }</td>
					<td>${inquire.inqCategory == 1 ? "이용문의" : "불만사항"}</td>
					<td style="text-align: left;">
						${inquire.inqLock == 1 ? `<a href='${cPath}/web/inquire/detail.do?what=${inquire.inqNo}'>` : ""}
						${inquire.inqLock == 2 &&inquire.memId == principal ? `<a href='${cPath}/web/inquire/detail.do?what=${inquire.inqNo}'>`
														: ""}
						${inquire.inqTitle.substring(0,30)}
					</td>
					<td>${inquire.inqWriter.substring(0,1) + '*' + inquire.inqWriter.substring(2)}</td>
					<td>${inquire.inqRegdate}</td>
					<td><span>${inquire.inqComment ? "답변완료" : ""}</span></td>
				</tr>
				`;
	};

	searchform.addEventListener("submit", (e) => {
		e.preventDefault();

		let formData = new FormData(e.target);
		let data = new URLSearchParams(formData).toString();

		FetchUtils.fetchForJSON(`${cPath}/web/inquire/list.do?${data}`, {
			method:"get",
			headers:{
				"accept":"application/json"
			}
		}).then(({inquireList, pagingHTML}) => {
			// console.log(json.inquireList);
			// console.log(inquireList);
			let trTags = null;
			if(inquireList.length > 0){
				//alert("체킁");
				trTags = inquireList.map(singleUI).join("\n");
			}else{
				trTags = `
							<tr>
								<td colspan="6">이용문의 게시글이 없습니다.</td>
							</tr>
						`;
			}
			listBody.innerHTML = trTags;

			paging.innerHTML = pagingHTML;
		}).finally(() => {
			e.target.page.value="";
		})
	})

	searchform.requestSubmit();
})