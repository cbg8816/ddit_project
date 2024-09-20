/**
 *
 */
document.addEventListener("DOMContentLoaded", ()=>{
	$("#modalPaging").on("click", "a[data-page]" , function(){
		let page = this.dataset.page;
		modalSearch.page.value = page;
		modalSearch.requestSubmit();
	});

	const $modalSearchUI = $("#modalSearchUI").on("click", "#modalsearchBtn", function(){
		$modalSearchUI.find(":input[name]").each(function(index, input){
			let name = this.name;
			let value = $(this).val();
			modalSearch[name].value = value;
		});
		modalSearch.requestSubmit();
	});

	$(".paging-area").on("click", "a[data-page]" , function(){
		let page = this.dataset.page;
		searchform.page.value = page;
		searchform.requestSubmit();
	});

	const $searchUI = $("#searchUI").on("click", "#searchBtn", function(){
		$searchUI.find(":input[name]").each(function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchform[name].value = value;
		});
		searchform.requestSubmit();
	});

});