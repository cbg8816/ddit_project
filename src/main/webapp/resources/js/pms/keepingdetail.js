/**
 *
 */
function updatekeeping(){
	var hkpNo = document.getElementById("hkpNo").value;
	var hkpRoom = document.getElementById("hkpRoom").value;
	var hkpLocation = document.getElementById("hkpLocation").value;
	var hkpManager = document.getElementById("hkpManager").value;
	var hkpStatus = document.getElementById("hkpStatus").value;
	var hkpNote = document.getElementById("hkpNote").value;

	$.ajax ({
		url: `/pms/housekeeping/keepingUpdate.do`,
		type: "POST",
		contentType: 'application/x-www-form-urlencoded',
		data:{
			"hkpNo" : hkpNo,
			"hkpRoom" : hkpRoom,
			"hkpLocation" : hkpLocation,
			"hkpManager" : hkpManager,
			"hkpStatus" : hkpStatus,
			"hkpNote" : hkpNote
		},
			success : function(response){
				console.log("성공함");
				location.href=location.href;   // 페이지 동기로 새로고침
			},
			error : function(error){
				console.log("실패!!!", error);
			}
	});
}


document.addEventListener("DOMContentLoaded", function(){
	// 특정 td 클릭시 이벤트 발생

	$('.detail').on('click', function(e){
		var hkpNo = e.target.parentElement.parentElement.children[0].id; // td에 data-hkpno 속성으로 키핑번호 저장
		console.log(hkpNo)
		$.ajax({
			url: `/pms/housekeeping/keepingDetail.do?what=${hkpNo}`,
			type: "GET",
			success : function(response){
				console.log(response);
				// 서버로 부터 받은 데이터를 모달 폼에 채워넣기
				$("#hkpNo").val(response.hkpNo);
				$("#hkpDay").val(response.hkpDay);
				$("#hkpRoom").val(response.hkpRoom);
				$("#hkpLocation").val(response.hkpLocation);
				$("#hkpManager").val(response.hkpManager);
				$("#hkpStatus").val(response.hkpStatus);
				$("#hkpNote").val(response.hkpNote);

			// 모달 열기
			$("#detail").modal("show");
			},
			error: function(error) {
				console.log("Error : ",  error);
			}
		});
	});
});