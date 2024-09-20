<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
p {
	margin-bottom: 0;
}

/* 테두리 색상 변경 */
.border-status-1 {
	border-color: green;
	background-color: hsl(120, 100%, 70%, 0.5);
	/* Example background color */
}

.border-status-2 {
	border-color: red;
	background-color: hsl(0, 100%, 70%, 0.5);
}

.border-status-3 {
	border-color: orange;
	background-color: hsl(30, 100%, 70%, 0.5);
}

.border-status-4 {
	border-color: purple;
	background-color: hsla(270, 100%, 70%, 0.5);
}

.border-status-5 {
	border-color: gray;
	background-color: hsl(0, 0%, 70%, 0.5);
}

.border-status-6 {
	border-color: blue;
	background-color: hsl(210, 100%, 70%, 0.5);
}

.maintain-main {
	border-width: 2px; /* Default border width */
	border-style: solid; /* Ensures border style is applied */
}

/* Additional styles for the <p> inside the maintain-main */
.maintain-main .maintain-room {
	border: 1px solid transparent; /* Default border */
	padding: 10px; /* Example padding */
}

.page-body {
    display: grid;
    gap: 10px;
    grid-template-columns: repeat(10, 1fr);
    padding-right: 10px;
}

#table-top-box {
	border-color: green;
	width: 100%
}

#explanation {
	width: 100%;
	height: 100px;
	background-color: #f5d682;
	border: 1px solid red;
}

.roombtn {
	width: 30px;
    height: 30px;
    border-color: #695c494d;
    padding: 0px;
    margin: 3px;
    background-color: #f9e4c6;
    border-radius: 5px;
	text-align: center;
}

.rounded-3 {
	    margin-right: 10px;
}

</style>



<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header" style="height: 20px;">
						<h3 class="fw-bold mb-3">객실 정비 조회</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="/pms/index.do"><i
									class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">객실정비조회</a></li>
						</ul>

					</div>
					<div class="table-top-box side align-items-end">
						<div class="" >

							<input class="roombtn" type="button" value="전체" onclick="location.href='${cPath}/roommaintenance/roomList.do'">

							<input class="roombtn list-group-item-action list-group-item-success"  aria-current="true" type="button" value="3" onclick="floor(this)">

							<input class="roombtn list-group-item-action list-group-item-success" type="button" value="4" onclick="floor(this)">

							<input class="roombtn list-group-item-action list-group-item-success" type="button" value="5" onclick="floor(this)">

							<input class="roombtn list-group-item-action list-group-item-success" type="button" value="6" onclick="floor(this)">

							<input class="roombtn list-group-item-action list-group-item-success" type="button" value="7" onclick="floor(this)">

							<input class="roombtn list-group-item-action list-group-item-success" type="button" value="8" onclick="floor(this)">

							<input class="roombtn list-group-item-action list-group-item-success" type="button" value="9" onclick="floor(this)">

							<input class="roombtn list-group-item-action list-group-item-success" type="button" value="10" onclick="floor(this)">

							<input class="roombtn list-group-item-action list-group-item-success" type="button" value="11" onclick="floor(this)">

							<input class="roombtn list-group-item-action list-group-item-success" type="button" value="12" onclick="floor(this)">
						</div>
						<nav class="button-box table-nav">
						<div>
							<div class="d-flex justify-content-end" >
								<p class="p1"
									style="display: inline-block;">
									스탠다드룸 :
									<input class="rounded-3 text-center" style="width: 40px;" value="${roomtypestatus1 }" readonly/>
								</p>
								<p class="p1"
									style="display: inline-block;"> 슈페리어룸 :
									<input class="rounded-3 text-center" style="width: 40px;" value="${roomtypestatus2 }" readonly/>
								</p>
								<p class="p1"
									style="display: inline-block;">
									디럭스룸 : <input class="rounded-3 text-center" style="width: 40px;"
										value="${roomtypestatus3 }" readonly />
								</p>
								<p class="p1"
									style="display: inline-block;">
									이그제큐티브룸 : <input class="rounded-3 text-center" style="width: 40px;"
										value="${roomtypestatus4 }" readonly/>
								</p>
								<p class="p1"
									style="display: inline-block;">
									스위트룸 : <input class="rounded-3 text-center" style="width: 40px;"
										value="${roomtypestatus5 }" readonly/>
								</p>
							</div>
						</div>
						<div class="mt-2">
							<div class="d-flex justify-content-end align-items-center roommain">

								<div class="border-status-1" style="height: 25px; width: 25px; display: inline-block; "></div>
								<p style="display: inline-block;"> 투숙중 :
								<input class="rounded-3 text-center" style="width: 40px;" value="${roomstatus1 }" readonly /></p>

								<div class="border-status-2" style="height: 25px; width: 25px; display: inline-block;"></div>
								<p style="display: inline-block;"> 퇴실 :
								<input class="rounded-3 text-center" style="width: 40px;" value="${roomstatus2 }" readonly /> </p>

								<div class="border-status-3" style="height: 25px; width: 25px; display: inline-block;"></div>
								<p style="display: inline-block;"> 정비중 :
								<input class="rounded-3 text-center" style="width: 40px;" value="${roomstatus3 }" readonly /> </p>

								<div class="border-status-4" style="height: 25px; width: 25px; display: inline-block;"></div>
								<p style="display: inline-block;"> 수리중 :
								<input class="rounded-3 text-center" style="width: 40px;" value="${roomstatus4 }" readonly /> </p>

								<div class="border-status-5" style="height: 25px; width: 25px; display: inline-block;"></div>
								<p style="display: inline-block;"> 고장 :
								<input class="rounded-3 text-center" style="width: 40px;" value="${roomstatus5 }" readonly /> </p>

								<div class="border-status-6" style="height: 25px; width: 25px; display: inline-block;"></div>
								<p style="display: inline-block;"> 입실가능 :
								<input class="rounded-3 text-center" style="width: 40px;" value="${roomstatus6 }" readonly /> </p>

							</div>
						</div>

						</nav>
						</div>


					<div class="page-body" id="roomContainer">
						<c:forEach items="${roomList}" var="room">
							<div
								class="maintain-main border-status-${room.roomstatus.roomSt}"
								data-floor="${room.roomFl}"
								onclick="openModal(this)" data-bs-target="#detail"
								id="roomupdate"
								data-detail-url="/roommaintenance/roomDetail.do?what=${room.roomId}"
								data-room-id="${room.roomId}">

								<p class="maintain-room">${room.roomId}</p>
								<p>${room.emp.empName}</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		</div>
</div>



<!-- Modal detail부분	 -->
<div class="modal fade" id="detail" tabindex="-1" data-bs-backdrop="#"
	data-bs-keyboard="false" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">
					<span class="fw-mediumbold">정비 </span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="roomtypeId" name="roomtypeId" />

				<table class="table table-bordered">
					<tr>
						<th>룸번호</th>
						<td><input type="text" id="roomId" name="roomId"
							class="form-control" readonly /></td>

					</tr>
					<tr>
						<th>위치</th>
						<td><input type="text" id="roomFl" name="roomFl"
							class="form-control" readonly /></td>
					</tr>
					<tr>
						<th>비고</th>
						<td><textarea id="hkbInfor" name="hkbInfor"
								class="form-control"></textarea></td>
					</tr>
					<tr>
						<th>담당자</th>
						<td><select id="empname" name="empname" class="form-control">
								<option value="">-선택-</option>
								<c:forEach items="${empList }" var="emp">
									<option value="${emp.empName }">${emp.empName }</option>
								</c:forEach>
						</select></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer border-0">
				<div class="modal-footer border-0">
					<button type="button" id="completeMaintenance"
						class="btn btn-success" style="display: none;" onclick="room()">정비
						완료</button>
					<button type="button" id="completeRepair" class="btn btn-warning"
						style="display: none;" onclick="broken()">수리 완료</button>
					<button type="button" id="assignRoom" class="btn btn-primary"
						style="display: none;" onclick="assignRoom()">배정</button>
					<button type="button" id="rePair" class="btn btn-primary"
						style="display: none;" onclick="rePair()">수리배정</button>
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function floor(button) {

		var rooms = document.querySelectorAll(".maintain-main");
		rooms.forEach(function(room) {
			if (room.getAttribute("data-floor") === button.value) {
				room.style.display = "block";
			} else {
				room.style.display = "none";
			}
		});

	}
</script>

<script type=text/javascript src="${cPath }/resources/js/pms/roomdetail.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
