// 버튼 누를경우 input안에 원하는 값 넣기
function Autoinsert(){   
	document.getElementById("hksPlaceinsert").value = "3층 엘리베이터 앞";
	document.getElementById("hksAcquirerinsert").value = "고동현";
	document.getElementById("hksKindinsert").value = "스타벅스 텀블러";
	document.getElementById("hksNoteinsert").value = "3층 엘리베이터 왼쪽 문 앞에 떨어져 있었음, 바디 초록색, 헤드부분 회색 ";
}

function updatelostitem(){
	var hksNo		= document.getElementById("hksNo").value;
	var hksDate		= document.getElementById("hksDate").value;
	var hksPlace	= document.getElementById("hksPlace").value;
	var hksAcquirer = document.getElementById("hksAcquirer").value;
	var hksKind		= document.getElementById("hksKind").value;
	var hksNote 	= document.getElementById("hksNote").value;

	$.ajax({
		url: `/pms/lostitem/lostitemUpdate.do`,
		type: "POST",
		contenType : 'application/x-www-form-urlencoded',
		data: {
			"hksNo" : hksNo,
			"hksDate" : hksDate,
			"hksPlace" : hksPlace,
			"hksAcquirer" : hksAcquirer,
			"hksKind" : hksKind,
			"hksNote" : hksNote
		},
		success : function(response){
			console.log("성공", hksNo);
				swal({
					title : '업데이트 성공!',
					text : '업데이트 처리가 되었습니다!!',
					icon : 'success'
				});
				setTimeout(function() {
					location.href=location.href;
				}, 1500);
            // 모달 닫기
            var myModal = bootstrap.Modal.getInstance(document.getElementById('detail'));
            myModal.hide();
		},
		error : function(error){
			console.log("에러 발생", error);
				swal({
					title : '업데이트 실패!',
					text : '업데이트 처리가 되지 않았습니다...빈 공간이 없는지 확인해주세요',
					icon : 'error'
				});
		}
	})

}
// 체크박스 전체 선택
document.getElementById("checkAll").addEventListener("change", function(){
	let checkBoxs = document.querySelectorAll(".chk");
	checkBoxs.forEach(function(checkbox){
		checkbox.checked = document.getElementById("checkAll").checked;
	});

});

// 한개의 체크박스 선택
document.getElementById("updatelostitem").addEventListener("click", function(){
	let selectrental = "";
	document.querySelectorAll(".chk:checked").forEach(function(checkbox){
		console.log(selectrental);
		selectrental += checkbox.value + ",";
	});

	let data = {
		hksNos : updatelostitem
	};

	if(updatelostitem.length > 0){
		$.ajax({
		url: `/pms/lostitem/.do`,
		type: "POST",
		contentType : 'application/json',
		data: JSON.stringify(data),
		success: function(response) {
                swal({
					title : '업데이트 성공!',
					text : '업데이트 처리가 되었습니다!!',
					icon : 'success'
				});
				setTimeout(function() {
                location.reload(); // 페이지 새로고침으로 업데이트된 내용을 반영
				}, 1500);
            },
            error: function() {
                swal({
					title : '업데이트 실패!',
					text : '업데이트 처리가 되지 않았습니다...빈 공간이 없는지 확인해주세요',
					icon : 'error'
				});
            }
        });
    } else {
        alert("선택된 항목이 없습니다.");
    }
});


function lostitemInsert(){
	var hksDate = document.getElementById("hksDateinsert").value;
	var hksPlace = document.getElementById("hksPlaceinsert").value;
	var hksAcquirer = document.getElementById("hksAcquirerinsert").value;
	var hksKind = document.getElementById("hksKindinsert").value;

	var hksNote = document.getElementById("hksNoteinsert").value;


	console.log("hksDate :", hksDateinsert);

	$.ajax ({
		url: `/pms/lostitem/lostitemInsert.do`,
		type: "POST",
		contentType: 'application/x-www-form-urlencoded',
		data:{
			"hksDate" : hksDate,
			"hksPlace" : hksPlace,
			"hksAcquirer" : hksAcquirer,
			"hksKind" : hksKind,
			"hksNote" : hksNote,
		},
			success : function(response){
				console.log("성공함");
				swal({
					title : '등록 성공!',
					text : '등록 처리가 되었습니다!!',
					icon : 'success'
				});
				setTimeout(function() {
                	location.reload(); // 페이지 새로고침으로 업데이트된 내용을 반영
				}, 1500);
			
			},
			error : function(error){
				console.log("실패!!!", error);
				swal({
					title : '등록 실패!',
					text : '등록 처리가 되지 않았습니다...빈 공간이 없는지 확인해주세요',
					icon : 'error'
				});
			}
	});
}



document.addEventListener('DOMContentLoaded', function() {
    // 모든 테이블의 링크 요소를 가져옵니다.
    const detailLinks = document.querySelectorAll('.test');

    // 각 링크 요소에 클릭 이벤트를 추가합니다.
    detailLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();  // 기본 동작을 막습니다.

            // 링크의 data- 속성에서 정보를 가져옵니다.
            const hksNo = link.getAttribute('data-hksno');
            const hksDate = link.getAttribute('data-hksDate');
            const hksPlace = link.getAttribute('data-hksPlace');
            const hksAcquirer = link.getAttribute('data-hksAcquirer');
            const hksKind = link.getAttribute('data-hksKind');
            const hksNote = link.getAttribute('data-hksNote');
            // 모달의 input 요소에 데이터를 설정합니다.
            document.getElementById('hksNo').value = hksNo;
            document.getElementById('hksDate').value = hksDate;
            document.getElementById('hksPlace').value = hksPlace;
            document.getElementById('hksAcquirer').value = hksAcquirer;
            document.getElementById('hksKind').value = hksKind;
            document.getElementById('hksNote').value = hksNote;

            // 모달을 띄웁니다. (이 부분은 이미 data-bs-toggle로 구현됨)
						// 모달 열기
			$("#detail").modal("show");


        });
    });
});