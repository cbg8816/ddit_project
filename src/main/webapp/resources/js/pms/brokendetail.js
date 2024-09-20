// 버튼 누를경우 input안에 원하는 값 넣기
function Autoinsert(){   
	document.getElementById("roomIdinsert").value = "ST304";
	document.getElementById("hkbDayinsert").value = "2024-09-20";
	document.getElementById("hkbLocationinsert").value = "304호 화장실";
	document.getElementById("hkbInforinsert").value = "수건걸이 파손. 수리요망";
}


function updateButton(){
	var hkbNo		= document.getElementById("hkbNo").value;
	var roomId		= document.getElementById("roomId").value;
	var hkbDay		= document.getElementById("hkbDay").value;
	var hkbLocation = document.getElementById("hkbLocation").value;
	var hkbInfor	= document.getElementById("hkbInfor").value;
	var hkbEmp 		= document.getElementById("hkbEmp").value;

	$.ajax({
		url: `/pms/brokenroom/brokenUpdate.do`,
		type: "POST",
		contenType : 'application/x-www-form-urlencoded',
		data: {
			"hkbNo" : hkbNo,
			"roomId" : roomId,
			"hkbDay" : hkbDay,
			"hkbLocation" : hkbLocation,
			"hkbInfor" : hkbInfor,
			"hkbEmp" : hkbEmp
		},
		success : function(response){
			console.log("성공", roomId)
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
			console.log("에러 발생", error);
				swal({
					title : '업데이트 실패!',
					text : '업데이트 처리가 되지 않았습니다...빈 공간이 없는지 확인해주세요',
					icon : 'error'
				});
		}
	})
}
function brokenroomInsert(){
	var roomId = document.getElementById("roomIdinsert").value;
	var hkbDay = document.getElementById("hkbDayinsert").value;
	var hkbLocation = document.getElementById("hkbLocationinsert").value;
	var hkbInfor = document.getElementById("hkbInforinsert").value;

	$.ajax ({
		url: `/pms/brokenroom/brokenInsert.do`,
		type: "POST",
		contentType: 'application/x-www-form-urlencoded',
		data:{
			"roomId" : roomId,
			"hkbDay" : hkbDay,
			"hkbLocation" : hkbLocation,
			"hkbInfor" : hkbInfor
		},
			success : function(response){
				console.log("성공함");
				swal({
					title : '수리 접수 성공!',
					text : '수리 접수 처리가 되었습니다!!',
					icon : 'success'
				});
				setTimeout(function() {

					location.href=location.href;
				}, 1500);
			},
			error : function(error){
				console.log("실패!!!", error);
				swal({
					title : '수리 접수 실패!',
					text : '수리 접수 처리가 되지 않았습니다...빈 공간이 없는지 확인해주세요',
					icon : 'error'
				});
			}
	});
}

/*
document.addEventListener("DOMContentLoaded", function(){

	$('.detail').on('click', function(e){

		var hkbNo = document.getElementById("hkbNo").value; // td에 data-hkpno 속성으로 키핑번호 저장
		alert("glgl", hkbNo);
		$.ajax({
			url: `/pms/brokenroom/brokenroomDetail.do?what=${hkbNo}`,
			type: "GET",
			success : function(response){
				console.log(response);
				// 서버로 부터 받은 데이터를 모달 폼에 채워넣기
				$("#hkbNo").val(response.hkbNo);
				$("#hkbDay").val(response.hkbDay);
				$("#roomId").val(response.roomId);
				$("#hkbLocation").val(response.hkbLocation);
				$("#hkbEmp").val(response.hkbEmp);
				$("#hkbInfor").val(response.hkbInfor);
				$("#hkbComple").val(response.hkbComple);

			// 모달 열기
			$("#detail").modal("show");
			},
			error: function(error) {
				console.log("Error : ",  error);
			}
		});
	});
});
*/
document.addEventListener('DOMContentLoaded', function() {
    // 모든 테이블의 링크 요소를 가져옵니다.
    const detailLinks = document.querySelectorAll('.test');

    // 각 링크 요소에 클릭 이벤트를 추가합니다.
    detailLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();  // 기본 동작을 막습니다.

            // 링크의 data- 속성에서 정보를 가져옵니다.
            const hkbNo = link.getAttribute('data-hkbno');
            const roomId = link.getAttribute('data-roomid');
            const hkbLocation = link.getAttribute('data-hkblocation');
            const hkbDay = link.getAttribute('data-hkbday');
            const hkbInfor = link.getAttribute('data-hkbinfor');
            const hkbEmp = link.getAttribute('data-hkbemp');
            const hkbComple = link.getAttribute('data-hkbcomple');

            // 모달의 input 요소에 데이터를 설정합니다.
            document.getElementById('hkbNo').value = hkbNo;
            document.getElementById('roomId').value = roomId;
            document.getElementById('hkbLocation').value = hkbLocation;
            document.getElementById('hkbDay').value = hkbDay;
            document.getElementById('hkbInfor').value = hkbInfor;
            document.getElementById('hkbEmp').value = hkbEmp;
            document.getElementById('hkbComple').value = hkbComple;

            // 모달을 띄웁니다. (이 부분은 이미 data-bs-toggle로 구현됨)
						// 모달 열기
			$("#detail").modal("show");


        });
    });
});
