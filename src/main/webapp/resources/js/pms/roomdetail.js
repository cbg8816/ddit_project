
	function rePair(){
		var roomId = document.getElementById("roomId").value;
		var roomtypeId = document.getElementById("roomtypeId").value;
		var roomFl = document.getElementById("roomFl").value;
		var hkbInfor = document.getElementById("hkbInfor").value;
		var empname = document.getElementById("empname").value;
		$.ajax({
			url:`/pms/roommaintenance/roombrokenUpdateRepair.do`,
			type:"POST",
			contentType: 'application/x-www-form-urlencoded',
			data:{
				"roomId" : roomId,
				"roomtypeId" : roomtypeId,
				"roomFl" : roomFl,
				"broken.hkbInfor" : hkbInfor,
				"emp.empName" : empname
				},
				success : function(response){
				console.log("성공함");
				swal({
					title : '수리 배정 성공!',
					text : '수리 배정 처리가 되었습니다!!',
					icon : 'success'
				});
				let room = response;
				let newdiv =
					$(`<div
					class="maintain-main border-status-${room.roomstatus.roomSt}"
					data-floor="${room.roomFl}"
					style="width: 100%; height: 100px; display: block; margin-top: 0px; margin-left: 0px; margin-bottom: 0px; margin-right: 0px;"
					onclick="openModal(this)" data-bs-target="#detail" id="roomupdate"
					data-detail-url="/rooommaintenance/roomDetail.do?what=${room.roomId}"
					data-room-id="${room.roomId}">
					<p class="maintain-room">${room.roomId}호</p>
					<p>${room.emp?.empName??""}</p>

				</div>`).get(0);
				let finddiv = roomContainer.querySelector(`[data-room-id="${room.roomId}"]`);
				roomContainer.replaceChild(newdiv, finddiv);

            // 모달 닫기
            var myModal = bootstrap.Modal.getInstance(document.getElementById('detail'));
            myModal.hide();


			},
			error : function(error){
				console.log("실패!!!", error);
swal({
					title : '수리 배정 실패!',
					text : '수리 배정 처리가 않았습니다...',
					icon : 'error'
				});
			}
		});
	}


	function room(){
		var roomId = document.getElementById("roomId").value;
		var roomtypeId = document.getElementById("roomtypeId").value;
		var roomFl = document.getElementById("roomFl").value;
		var hkbInfor = document.getElementById("hkbInfor").value;
		var empname = document.getElementById("empname").value;
		$.ajax({
			url:`/pms/roommaintenance/roomUpdateSt.do`,
			type:"POST",
			contentType: 'application/x-www-form-urlencoded',
			data:{
				"roomId" : roomId,
				"roomtypeId" : roomtypeId,
				"roomFl" : roomFl,
				"broken.hkbInfor" : hkbInfor,
				"emp.empName" : empname
				},
				success : function(response){
				console.log("성공함");

				let room = response;
				let newdiv =
					$(`<div
					class="maintain-main border-status-${room.roomstatus.roomSt}"
					data-floor="${room.roomFl}"
					style="width: 100%; height: 100px; display: block; margin-top: 0px; margin-left: 0px; margin-bottom: 0px; margin-right: 0px;"
					onclick="openModal(this)" data-bs-target="#detail" id="roomupdate"
					data-detail-url="/rooommaintenance/roomDetail.do?what=${room.roomId}"
					data-room-id="${room.roomId}">
					<p class="maintain-room">${room.roomId}호</p>
					<p>${room.emp?.empName??""}</p>

				</div>`).get(0);
				let finddiv = roomContainer.querySelector(`[data-room-id="${room.roomId}"]`);
				roomContainer.replaceChild(newdiv, finddiv);

				swal({
					title : '정비완료 성공!',
					text : '정비완료 처리가 되었습니다!!',
					icon : 'success'
				});

            // 모달 닫기
            var myModal = bootstrap.Modal.getInstance(document.getElementById('detail'));
            myModal.hide();


			},
			error : function(error){
				console.log("실패!!!", error);
				swal({
					title : '정비완료 실패!',
					text : '정비완료 처리가 되지 않았습니다...',
					icon : 'error'
				});
			}
		});
	}

	function broken(){
		var roomId = document.getElementById("roomId").value;
		var roomtypeId = document.getElementById("roomtypeId").value;
		var roomFl = document.getElementById("roomFl").value;
		var hkbInfor = document.getElementById("hkbInfor").value;
		var empname = document.getElementById("empname").value;
		$.ajax({
			url:`/pms/roommaintenance/roombrokenUpdateSt.do`,
			type:"POST",
			contentType: 'application/x-www-form-urlencoded',
			data:{
				"roomId" : roomId,
				"roomtypeId" : roomtypeId,
				"roomFl" : roomFl,
				"broken.hkbInfor" : hkbInfor,
				"emp.empName" : empname
				},
			success : function(response){
				console.log("성공함");
			/* 동적으로 화면의 정보를 업데이트
            var roomElement = document.querySelector(`[data-room-id="${roomId}"]`);
            if (roomElement) {
                roomElement.querySelector('.maintain-room').innerText = `${roomId}호`;
                roomElement.querySelector('p:nth-child(2)').innerText = empname;

                // 상태 변경이 필요한 경우 업데이트
                 //roomElement.classList.add(`border-status-${newStatus}`);
            }
			location.href=location.href;
*/
				let room = response;
				let newdiv =
					$(`<div
					class="maintain-main border-status-${room.roomstatus.roomSt}"
					data-floor="${room.roomFl}"
					style="width: 100%; height: 100px; display: block; margin-top: 0px; margin-left: 0px; margin-bottom: 0px; margin-right: 0px;"
					onclick="openModal(this)" data-bs-target="#detail" id="roomupdate"
					data-detail-url="/rooommaintenance/roomDetail.do?what=${room.roomId}"
					data-room-id="${room.roomId}">
					<p class="maintain-room">${room.roomId}호</p>
					<p>${room.emp?.empName??""}</p>

				</div>`).get(0);
				let finddiv = roomContainer.querySelector(`[data-room-id="${room.roomId}"]`);
				roomContainer.replaceChild(newdiv, finddiv);

				swal({
					title : '수리완료처리 성공!',
					text : '수리완료 처리가 되었습니다!!',
					icon : 'success'
				});

            // 모달 닫기
            var myModal = bootstrap.Modal.getInstance(document.getElementById('detail'));
            myModal.hide();
        },

			error : function(error){
				console.log("실패!!!", error);
				swal({
					title : '수리완료처리 실패!',
					text : '수리완료 처리가 되지 않았습니다...',
					icon : 'error'
				});
			}
		});
	}

	function assignRoom() {

		// jsp에서 해당 값을 가져옴
		var roomId = document.getElementById("roomId").value;
		var roomtypeId = document.getElementById("roomtypeId").value;
		var roomFl = document.getElementById("roomFl").value;
		var hkbInfor = document.getElementById("hkbInfor").value;
		var empname = document.getElementById("empname").value;

		$.ajax({
			url:`/pms/roommaintenance/roomInsert.do`,
			type:"POST",
			contentType: 'application/x-www-form-urlencoded',
			data:{
				"roomId" : roomId,
				"roomtypeId" : roomtypeId,
				"roomFl" : roomFl,
				"broken.hkbInfor" : hkbInfor,
				"emp.empName" : empname
			},

			success : function(response){
				console.log("성공함", response);

            let room = response;
				let newdiv =
					$(`<div
					class="maintain-main border-status-${room.roomstatus?.roomSt??""}"
					data-floor="${room.roomFl}"
					style="width: 100%; height: 100px; display: block; margin-top: 0px; margin-left: 0px; margin-bottom: 0px; margin-right: 0px;"
					onclick="openModal(this)" data-bs-target="#detail" id="roomupdate"
					data-detail-url="/rooommaintenance/roomDetail.do?what=${room.roomId}"
					data-room-id="${room.roomId}">
					<p class="maintain-room">${room.roomId}호</p>
					<p>${room.emp?.empName??""}</p>
				</div>`).get(0);

				console.log(newdiv);

				let finddiv = roomContainer.querySelector(`[data-room-id="${room.roomId}"]`);
				roomContainer.replaceChild(newdiv, finddiv);

				swal({
					title : '배정 성공!',
					text : '배정 되었습니다!!',
					icon : 'success'
				});

            // 모달 닫기
            var myModal = bootstrap.Modal.getInstance(document.getElementById('detail'));
            myModal.hide();

			},
			error : function(error){
				console.log("실패!!!", error);
				swal({
					title : '배정 실패!',
					text : '배정 되지 않았습니다...',
					icon : 'error'
				});
			}
		});
	}


	// 특정 층의 방을 필터링하고 모달을 열 수 있는 함수
	function filterRoomsAndOpenModal(button, roomId = null) {
		console.log("Selected floor:", button.value); // 디버깅용 콘솔 로그

		var rooms = document.querySelectorAll(".maintain-main");
		rooms.forEach(function(room) {
			if (room.getAttribute("data-floor") === button.value) {
				room.style.display = "block";
				// 만약 roomId가 null이 아니고, room의 ID와 일치하는 경우에만 모달을 엽니다.
				if (roomId && room.getAttribute("data-room-id") === roomId) {
					openModal(room);
				}
			} else {
				room.style.display = "none";
			}
		});
	}

	// 기존 openModal 함수 유지
	function openModal(element) {
		// 클릭된 요소에서 roomId 가져오기
		var roomId = element.getAttribute("data-room-id");
		document.getElementById("roomId").value = roomId;

		// 모달 띄우는 곳
		var myModal = new bootstrap.Modal(document.getElementById('detail'));
		myModal.show();

		// 데이터 로딩 함수 호출하는 부분
		loadModalDate(roomId);
	}

	// AJAX 요청을 통해 데이터를 가져와 모달 내용을 업데이트 하는 함수
	function loadModalDate(roomId){
		$.ajax({
			url: `/pms/roommaintenance/roomDetail.do?what=${roomId}`,
			type: "GET",
			success : function(response){
				console.log("성공함");

				document.getElementById("roomFl").value = response.roomFl;
				document.getElementById("roomtypeId").value = response.broken.roomtypeId;
				document.getElementById("hkbInfor").value = response.broken.hkbInfor;
				 var options = document.getElementById("empname").querySelectorAll("option");
				for(let i = 0; i < options.length; i++){
					if(response.emp != null){
						if(options[i].value == response.emp.empName){
							options[i].selected = true;
						}
					}else{
						options[0].selected = true;
					}
				}

			//roomSt를 구분으로 색상 나누는 부분
            var roomSt = response.roomstatus.roomSt;
            document.getElementById("completeMaintenance").style.display = (roomSt == 3) ? "block" : "none";
            document.getElementById("completeRepair").style.display = (roomSt == 4) ? "block" : "none";
            document.getElementById("assignRoom").style.display = (roomSt == 2) ? "block" : "none";
            document.getElementById("rePair").style.display = (roomSt == 5) ? "block" : "none";

			// empname 값이 null 또는 빈 문자열인지 확인 후 버튼 비활성화
			var empname = response.emp ? response.emp.empName : "";

			if((roomSt == 2 || roomSt == 5)&& empname === ""){
				documnet.getElementById("assignRoom").disabled = true;
				documnet.getElementById("rePair").disabled = true;
			}else {
				documnet.getElementById("assignRoom").disabled = false;
				documnet.getElementById("rePair").disabled = false;
			}



				console.log(options);
				$("#detail").modal("show");
			},
			error:function(error){
				console.error("Error :" ,error);

			}
		});
	}


	// 기존 floor 필터링 함수 (기존의 필터링만을 위한 용도로 사용 가능)
	function floor(button) {
		filterRoomsAndOpenModal(button);
	}
