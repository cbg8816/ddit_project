
// 체크박스 전체 선택
document.getElementById("checkAll").addEventListener("change", function(){
	let checkBoxs = document.querySelectorAll(".chk");
	checkBoxs.forEach(function(checkbox){
		checkbox.checked = document.getElementById("checkAll").checked;
	});

});
// 버튼 누를경우 input안에 원하는 값 넣기
function Autoinsert(){   
	document.getElementById("hkrRoominsert").value = "ST304";
	document.getElementById("hkrCostomerinsert").value = "장원영";
	document.getElementById("hkrCheckininsert").value = "2024-09-20";
	document.getElementById("hkrCheckoutinsert").value = "2024-09-23";
	document.getElementById("hkrHpinsert").value = "010-2873-5812";
	document.getElementById("hkrQtyinsert").value = "2";
}


// 한개의 체크박스 선택
document.getElementById("updateretal").addEventListener("click", function(){
	let selectrental = "";
	document.querySelectorAll(".chk:checked").forEach(function(checkbox){
		console.log(selectrental);
		selectrental += checkbox.value + ",";
	});

	let data = {
		hkrNos : selectrental
	};

	if(selectrental.length > 0){
		$.ajax({
		url: `/pms/rental/rentalUpdatefinish.do`,
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



function rentalInsert(){
	var hkrDate		= document.getElementById("hkrDateinsert").value;
	var hkrRoom		= document.getElementById("hkrRoominsert").value;
	var hkrCheckin	= document.getElementById("hkrCheckininsert").value;
	var hkrCheckout	= document.getElementById("hkrCheckoutinsert").value;
	var hkrCostomer = document.getElementById("hkrCostomerinsert").value;
	var hkrHp 		= document.getElementById("hkrHpinsert").value;
	var renprodName	= document.getElementById("renprodName").value;
	var hkrQty 		= document.getElementById("hkrQtyinsert").value;

	console.log(renprodName);

	$.ajax({
		url: `/pms/rental/rentalInsert.do`,
		type: "POST",
		contenType : 'application/x-www-form-urlencoded',
		data: {
			"hkrDate" 				: hkrDate,
			"hkrRoom" 				: hkrRoom,
			"hkrCheckin" 			: hkrCheckin,
			"hkrCheckout" 			: hkrCheckout,
			"hkrCostomer" 			: hkrCostomer,
			"hkrHp" 				: hkrHp,
			"renprod.renprodName" 	: renprodName,
			"hkrQty" 				: hkrQty,
		},

		success : function(response){
			console.log("성공")
				swal({
					title : '등록 성공!',
					text : '등록 처리가 되었습니다!!',
					icon : 'success'
				});
								setTimeout(function() {
					location.href=location.href;
				}, 1500);
		},
		error : function(error){
			console.log("에러 발생", error);
				swal({
					title : '등록 실패!',
					text : '등록 처리가 되지 않았습니다...빈 공간이 없는지 확인해주세요',
					icon : 'error'
				});
		}
	})
}

function rentalUpdate(){
	var hkrNo		= document.getElementById("hkrNo").value;
	var hkrDate		= document.getElementById("hkrDate").value;
	var hkrRoom		= document.getElementById("hkrRoom").value;
	var hkrCheckin	= document.getElementById("hkrCheckin").value;
	var hkrCheckout	= document.getElementById("hkrCheckout").value;
	var hkrCostomer = document.getElementById("hkrCostomer").value;
	var hkrHp 		= document.getElementById("hkrHp").value;
	var hkrKind	= document.getElementById("hkrKind").value;
	var hkrQty 		= document.getElementById("hkrQty").value;


	$.ajax ({
		url: `/pms/rental/rentalUpdate.do`,
		type: "POST",
		contentType: 'application/x-www-form-urlencoded',
		data:{
			"hkrNo" : hkrNo,
			"hkrDate" : hkrDate,
			"hkrRoom" : hkrRoom,
			"hkrCheckin" : hkrCheckin,
			"hkrCheckout" : hkrCheckout,
			"hkrCostomer" : hkrCostomer,
			"hkrHp" : hkrHp,
			"hkrKind" : hkrKind,
			"hkrQty" : hkrQty
		},
			success : function(response){
				console.log("성공함");
				swal({
					title : '업데이트 성공!',
					text : '업데이트 처리가 되었습니다!!',
					icon : 'success'
				});
								setTimeout(function() {
					location.href=location.href;
				}, 1500);
			},
			error : function(error){
				console.log("실패!!!", error);
				swal({
					title : '업데이트 실패!',
					text : '업데이트 처리가 되지 않았습니다...빈 공간이 없는지 확인해주세요',
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
            const hkrNo = link.getAttribute('data-hkrNo');
            const hkrDate = link.getAttribute('data-hkrDate');
            const hkrRoom = link.getAttribute('data-hkrRoom');
            const hkrCheckin = link.getAttribute('data-hkrCheckin');
            const hkrCheckout = link.getAttribute('data-hkrCheckout');
            const hkrCostomer = link.getAttribute('data-hkrCostomer');
            const hkrKind = link.getAttribute('data-hkrKind');
            const hkrQty = link.getAttribute('data-hkrQty');
            const hkrHp = link.getAttribute('data-hkrHp');
            const hkrReturn = link.getAttribute('data-hkrReturn');

            // 모달의 input 요소에 데이터를 설정합니다.
            document.getElementById('hkrNo').value = hkrNo;
            document.getElementById('hkrDate').value = hkrDate;
            document.getElementById('hkrRoom').value = hkrRoom;
            document.getElementById('hkrCheckin').value = hkrCheckin;
            document.getElementById('hkrCheckout').value = hkrCheckout;
            document.getElementById('hkrCostomer').value = hkrCostomer;
            document.getElementById('hkrKind').value = hkrKind;
            document.getElementById('hkrQty').value = hkrQty;
            document.getElementById('hkrHp').value = hkrHp;
            document.getElementById('hkrReturn').value = hkrReturn;

            // 모달을 띄웁니다. (이 부분은 이미 data-bs-toggle로 구현됨)
						// 모달 열기
			$("#detail").modal("show");
        });
    });
});
