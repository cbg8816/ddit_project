/**
 *
 */
document.addEventListener("DOMContentLoaded", () => {
	// contextpath
	const cPath = document.body.dataset.contextPath;

	// voc-body
	const vocBody = document.querySelector("#voc-body");

	// paging
	const paging = document.querySelector(".paging-area");

	// voc modal 닫기 버튼
	const mClose = document.querySelector("#vocMClose");

	// voc 제목 div
	const vocTitle = document.querySelector("#vocTitle");

	// voc 접수일 div
	const vocDate = document.querySelector("#vocDate");

	// voc 작성자 div
	const vocName = document.querySelector("#vocName");

	// voc 연락처 div
	const vocTel = document.querySelector("#vocTel");

	// voc 이메일 div
	const vocEmail = document.querySelector("#vocEmail");

	// voc 내용 div
	const vocContent = document.querySelector("#vocContent");

	const vocUI = (inquire) => {
		return `
				<tr>
					<td>${inquire.no}</td>
					<td style="text-align:left">${inquire.inqTitle.substr(0, 20)}</td>
					<td style="text-align:left">${inquire.inqContent.substr(0, 30)}</td>
					<td>${inquire.inqRegdate}</td>
					<td>
						<a data-bs-toggle="modal"
						href="#vocModal"
						data-detail-url="${cPath}/voc/detail?what=${inquire.inqNo}">
						<button class="btn btn-primary" type="button">상세보기</button>
						</a>
					</td>
				</tr>
				`
	}

	searchform.addEventListener("submit", (e) => {
		e.preventDefault();

		// 페이지 번호
		const page = document.querySelector("#vocPage").value;
		console.log(page)

		fetch(`${cPath}/voc?page=${page}`, {
			method: "get",
			headers: {
				accept: "application/json"
			}
		}).then(resp => {
			resp.json().then(rslt => {
				console.log(rslt);
				console.log(rslt.vocList);
				let trTags = null;
				if (rslt.vocList.length > 0) {
					trTags = rslt.vocList.map(vocUI).join("\n");
				} else {
					trTags = `
						<tr>
							<td colspan="3">접수된 VOC가 없습니다.</td>
						</tr>
						`
				}
				vocBody.innerHTML = trTags;

				paging.innerHTML = rslt.pagingHTML;
			})
		})
	})
	searchform.requestSubmit();

	// vocModal
	const modal = document.querySelector("#vocModal");

	modal.addEventListener("show.bs.modal", (event) => {
      	let aTag = event.relatedTarget;
		let url = aTag.dataset.detailUrl;
		console.log(url);
			fetch(url, {
					method: "get",
					headers: {
						accept: "application/json"
					}
				}).then(resp => {
					resp.json().then(rslt => {
						console.log("체킁", rslt);
						vocTitle.innerHTML = `<label>제목</label>` + rslt.inqTitle;
						vocDate.innerHTML = `<label>접수일</label>` + rslt.inqRegdate[0] + `-` + rslt.inqRegdate[1] + `-` + rslt.inqRegdate[2];
						vocName.innerHTML = `<label>성명</label>` + rslt.inqWriter;
						vocTel.innerHTML = `<label>연락처</label>` + rslt.memTel;
						vocEmail.innerHTML = `<label>이메일</label>` + rslt.memEmail;
						vocContent.innerHTML = `<label>내용</label>` + rslt.inqContent;
					})
				})
	})

	// vocModal 닫기
	mClose.addEventListener("click", () => {
		$("#vocModal").modal("hide");
	})
})