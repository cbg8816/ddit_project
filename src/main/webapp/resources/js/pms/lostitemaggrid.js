/**
 *  REST 관련 모든 UI 라이브러리의 model 은 동일함.
 */

// formData to JSON 데이터 변환
const formDataToJSON = (form)=>{
	let formData = new FormData(form);
	let data = {};
	for(let name of formData.keys()){
		let value = formData.get(name);
		data[name] = value;
	}
	return JSON.stringify(data);
}


// command object의 프로퍼티 값을 form 의 입력 태그(type='password' 제외)의 값으로 초기화
const objectToFormData = (obj, form)=>{
	Object.keys(obj)
			.map(p=>form[p])
			.filter(i=>i && i.type!="password")
			.forEach(i=>i.value=obj[i.name]);
}


// 글 목록 조회
const lostitemList = ()=>  FetchUtils.fetchForJSON(baseURI);
// 글 상세 조회
const lostitemDetail = (hksNo)=> FetchUtils.fetchForJSON(`${baseURI}/${hksNo}`);
// 글 수정
const lostitemUpdate = (form) => FetchUtils.fetchForJSON(form.action, {
									method:"put",
									headers:{
										"content-type":"application/json",
										"accept":"application/json"
									},
									body:formDataToJSON(form)
							  });
// 글 삭제
const lostitemDelete = (data) => FetchUtils.fetchForJSON(`${baseURI}/${data.hksNo}`, {
									method:"delete"
									, headers:{
										"content-type":"application/json"
										, "accept":"application/json"
									}, body : JSON.stringify(data)
							  });

const lostitemInsert = (form) => FetchUtils.fetchForJSON(baseURI, {
								method:form.method,
								headers:{
									"content-type":"application/json",
									"accept":"application/json"
								},
								body:formDataToJSON(form)
							});


// 글 목록 조회 컨트롤
const readlostitemList = async () => {
	let list = await lostitemList();
	gridApi.setGridOption("rowData", list); // 목록 조회
};

// 상세 조회 컨트롤
const readlostitem = async (e)=>{
	let gridApi = e.api;
	let sellostitem= gridApi.getSelectedRows()[0];


	let modalEl = document.getElementById(detailModalId);
	let modal = bootstrap.Modal.getOrCreateInstance(modalEl);

	let lostitemOne = await lostitemDetail(sellostitem.hksNo);

	let form = modalEl.querySelector("form");
	form.action = `${baseURI}/${lostitemOne.hksNo}`;
	objectToFormData(lostitemOne, form);
	// 조회수 갱신
	gridApi.getRowNode(lostitemOne.hksNo).updateData(lostitemOne);
	modal.show();
}

// 글 수정 컨트롤
const modifylostitem = async (e)=>{
	e.preventDefault();

	let form = e.target;
	let modal = bootstrap.Modal.getInstance(`#${detailModalId}`);
	let rslt = await lostitemUpdate(form);

	if(rslt.success){
		gridApi.applyTransaction({ update: [rslt.target] });
		modal.hide();
	}else{
		alert(rslt.message ?? JSON.stringify(rslt.errors));
		for(let prop in rslt.errors){
			if(form[prop]){
				console.log(rslt.errors[prop]);
				form[prop].focus();
				break;
			}
		}
	}
}

// 글 삭제 컨트롤
const removelostitem = async ()=>{
	let modalEl = document.getElementById(detailModalId);
	let modal = bootstrap.Modal.getInstance(`#${detailModalId}`);
	let form = modalEl.querySelector("form");
	let data = {
		hksNo : form.hksNo.value
	}

	let rslt = await lostitemDelete(data);

	if(rslt.success){
		const sel = gridApi.getSelectedRows();
 		gridApi.applyTransaction({remove: sel});
		modal.hide();
	}else{
		alert(rslt.message ?? JSON.stringify(rslt.errors));
	}
}

// 글 작성 컨트롤
const createlostitem = async (e)=>{
	e.preventDefault();
	let form = e.target;
	let modal = bootstrap.Modal.getInstance(`#${insertModalId}`);
	let rslt = await lostitemInsert(form);

	if(rslt.success){
		gridApi.applyTransaction({add: [rslt.target], addIndex:0}); // 데이터 추가
		modal.toggle();
	}else{
		alert(rslt.message ?? JSON.stringify(rslt.errors));
		for(let prop in rslt.errors){
			if(form[prop]){
				console.log(rslt.errors[prop]);
				form[prop].focus();
				break;
			}
		}
	}
}

// 선언
const baseURI = "./lostItem";
const gridId = "myGrid";

const detailModalId = "detaillostitemmodal";
const insertModalId = "newlostitemModal";
const insertFormId = "insertForm";
const updateFormId = "updateForm";
const delBtnId = "deleteBtn";

let gridApi;


//헤더 가운데 정렬 및 값 가운데 정렬
const style = document.createElement('style');
style.type = 'text/css';
style.innerHTML = '.centered .ag-header-cell-label { justify-content: center !important; }';
style.innerHTML = `  .ag-row .ag-cell {	display: flex; justify-content: center; /* align horizontal */  align-items: center; }`;
// 스타일 태그를 head에 추가
document.head.appendChild(style);


//데이터 불러오는 부분 중요!!!
const gridOptions = {
	getRowId : (params) => `${params.data.hksNo}`,
	pagination: true,
	defaultColDef: {
        sortable: true,
		filter : true,
		headerClass: "centered"
    },
	columnDefs: [
	    { field: "hksNo", headerName:"물품번호", width: 130 },
	    { field: "hksDate", headerName:"등록날짜", width: 130 },
	    { field: "hksPlace", headerName:"습득장소", width: 200 },
	    { field: "hksAcquirer", headerName:"습득자",width: 100 },
	    { field: "hksKind", headerName:"물품명", sortable:true, width: 200 },
	    { field: "hksRegi", headerName:"담당자", sortable: true,width: 100 },
	    { field: "hksNote", headerName:"비고", sortable: true, width: 500 },
	    { field: "", headerName:"상태", sortable: true, width: 100 },
	],
	rowSelection: "single",

	 // localeText 설정
    localeText: {
        // 필터 관련 텍스트
        filterOoo: '검색단어...',
        equals: '검색번호',
        notEqual: '제외 검색',
        lessThan: '설정값보다 작은 값',
        greaterThan: '설정값보다 큰 값',
        lessThanOrEqual: '보다 적거나 같음',
        greaterThanOrEqual: '보다 크거나 같음',
        inRange: '범위 내',
        contains: '검색',
        notContains: '포함하지 않음',
        startsWith: '시작함',
        endsWith: '끝남',

        // 필터 버튼
        applyFilter: '필터 적용',
        resetFilter: '필터 리셋',
        clearFilter: '필터 지우기',
        andCondition: '그리고',
        orCondition: '또는',

        // 페이지 네비게이션
        page: '페이지',
        more: '더보기',
        to: '~',
        of: '의',
        next: '다음',
        last: '마지막',
        first: '처음',
        previous: '이전',

        // 기타
        loadingOoo: '로딩 중...',
        noRowsToShow: '표시할 행이 없습니다',
        searchOoo: '검색...',
    }

};

// 실질적으로 데이터를 불러옴
document.addEventListener("DOMContentLoaded", async ()=>{
	const myGridElement = document.querySelector(`#${gridId}`);
	gridApi = agGrid.createGrid(myGridElement, gridOptions);

	readlostitemList();  // 목록 조회
	gridApi.addEventListener("rowClicked", readlostitem); // 상세 조회

	document.getElementById(updateFormId).addEventListener("submit", modifylostitem); // 수정
	document.getElementById(delBtnId).addEventListener("click", removelostitem); // 삭제
	document.getElementById(insertFormId).addEventListener("submit", createlostitem); // 등록
	document.addEventListener("hidden.bs.modal", ({target})=>target.querySelector("form")?.reset());
});