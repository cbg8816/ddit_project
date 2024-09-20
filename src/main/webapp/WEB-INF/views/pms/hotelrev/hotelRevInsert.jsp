<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">호텔예약 등록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i
									class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">중분류</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">소분류</a></li>
						</ul>
					</div>
					<form method="post" id="insertForm" class="form-group notif-scroll scrollbar-outer">
						<div class="table-top-box right-side">
							<nav class="button-box table-nav">
								<button type="submit" class="btn btn-primary">저장</button>
								<a href="<c:url value='/hotelrev/hotelRevList.do' />"
									class="btn btn-primary">취소</a>
							</nav>
						</div>
						<div class="page-body">
							<div class="m-table-outer">
								<div class="m-table-inner">
									<div class="form-group notif-scroll scrollbar-outer">
										<input type="hidden" name="trevId" value="${hotelRev.trevId }" />
										<input type="hidden" name="trevRtype"
											value="${hotelRev.trevRtype }" />

										<table class="table-header-fix table-input-in">
											<tr>
												<th>예약번호</th>
												<td><input type="text" name="htrevId"
													value="${hotelRev.htrevId }"
													class="form-control form-control" /> <span
													class="text-danger">${errors.htrevId }</span></td>
												<td><input type="text"
													class="form-control form-control"
													value="${hotelRev.totalRev.trevSt}"></td>
											</tr>
											<tr>
												<th>통합예약상태</th>
												<td><select name="trevSt">
														<%-- 															<option label="${hotelRev.totalRev.trevSt }" value="${hotelRev.totalRev.trevSt}"> --%>
														<option value>타입선택</option>
														<option label="예약접수" value="RV" />
														<option label="예약확정" value="CF" />
														<option label="예약취소" value="CC" />
														<option label="입실" value="IN" />
														<option label="퇴실" value="OUT" />
												</select></td>
											</tr>
											<tr>
												<!-- 													<th>예약구분</th> -->
												<!-- 													<td><input type="text" name="trevRtype" -->
												<!-- 														class="form-control form-control" -->
												<%-- 														value="${hotelRev.trevRtype}"> --%>
												<%-- 														<span class="text-danger">${errors.trevRtype }</span> --%>
												<!-- 													</td> -->
											</tr>
											<!-- 												<tr> -->
											<!-- 													<th>객실타입ID</th> -->
											<!-- 													<td> -->
											<!-- 														<input type="text" class="form-control" -->
											<%-- 														name="revroomId" value="${hotelRev.revroomId }" /> --%>
											<!-- 													</td> -->
											<!-- 													<th>객실타입명</th> -->
											<!-- 													<td> -->
											<!-- 														<select name="roomtypeId" required="required"> -->
											<!-- 															<option value>타입선택</option> -->
											<%-- 															<c:forEach items="${roomTypeList }" var="roomType"> --%>
											<%-- 																<option label="${roomType.roomtypeNm }" value="${roomType.roomtypeId }" --%>
											<%-- 																	${roomType.roomtypeId eq hotelRev.roomtypeId ? "selected" : "" } --%>
											<!-- 																 /> -->
											<%-- 															</c:forEach> --%>
											<!-- 														</select> -->
											<%-- 														<span class="text-danger">${errors.roomtypeId }</span> --%>
											<!-- 													</td> -->
											<!-- 													<th>객실번호</th> -->
											<!-- 													<td><input type="text" name="roomId" -->
											<!-- 														class="form-control form-control" -->
											<%-- 														value="${hotelRev.roomId}"> --%>
											<%-- 														<span class="text-danger">${errors.roomId }</span> --%>
											<!-- 													</td> -->
											<!-- 												</tr> -->
											<tr>
												<th>고객명</th>
												<td><input type="text" name="memName"
													class="form-control form-control"
													value="${hotelRev.memName}" required="required"> <span
													class="text-danger">${errors.memName }</span></td>
											</tr>
											<tr>
												<th>투숙일</th>
												<td><input type="date" name="htrevChkin"
													value="${hotelRev.htrevChkin }"
													class="form-control form-control" required="required" /> <span
													class="text-danger">${errors.htrevChkin }</span></td>
											</tr>
											<tr>
												<th>퇴실일</th>
												<td><input type="date" name="htrevChkout"
													value="${hotelRev.htrevChkout }"
													class="form-control form-control" required="required" /> <span
													class="text-danger">${errors.htrevChkout }</span></td>
											</tr>
											<tr>
												<th>숙박일</th>
												<td><input type="number" name="htrevStay"
													value="${hotelRev.htrevStay }"
													class="form-control form-control" /> <span
													class="text-danger">${errors.htrevStay }</span></td>
											</tr>
											<tr>
												<th>휴대폰</th>
												<td><input type="text" name="memTel"
													class="form-control form-control"
													value="${hotelRev.memTel}"> <span
													class="text-danger">${errors.memTel }</span></td>
											<tr>
												<th>이메일</th>
												<td><input type="text" name="memEmail"
													class="form-control form-control"
													value="${hotelRev.memEmail}"> <span
													class="text-danger">${errors.memEmail }</span></td>
											</tr>
											<tr>
												<th>성인수</th>
												<td><input type="number" name="trevAdult"
													class="form-control form-control"
													value="0${hotelRev.trevAdult}"> <span
													class="text-danger">${errors.trevAdult }</span></td>
											</tr>
											<tr>
												<th>아동수</th>
												<td><input type="number" name="trevChild"
													class="form-control form-control"
													value="0${hotelRev.trevChild}"> <span
													class="text-danger">${errors.trevChild }</span></td>
											</tr>
											</tr>
											<tr>
												<th>예약플랫폼</th>
												<td><input type="text" name="htrevPlatform"
													value="${hotelRev.htrevPlatform }"
													class="form-control form-control" /> <span
													class="text-danger">${errors.htrevPlatform }</span></td>
											<tr>
												<th>패키지사용여부</th>
												<td><input type="text" name="htrevPakyn"
													value="${hotelRev.htrevPakyn }"
													class="form-control form-control" /> <span
													class="text-danger">${errors.htrevPakyn }</span></td>
											</tr>
											<tr>
												<th>객실총금액</th>
												<td><input type="number" name="htrevTprice"
													value="0${hotelRev.htrevTprice }"
													class="form-control form-control" /> <span
													class="text-danger">${errors.htrevTprice }</span></td>
											</tr>
											<tr>
												<th>객실가격</th>
												<td><input type="number" name="revroomPrice"
													value="0${hotelRev.revroomPrice }"
													class="form-control form-control" /> <span
													class="text-danger">${errors.revroomPrice }</span></td>
											</tr>
											<tr>
												<th>예약내용</th>
												<td><input type="text" name="htrevCn"
													value="${hotelRev.htrevCn }"
													class="form-control form-control" /> <span
													class="text-danger">${errors.htrevCn }</span></td>
											</tr>
											<tr>
												<th>차량번호</th>
												<td><input type="text" name="trevCarno"
													class="form-control form-control"
													value="${hotelRev.trevCarno}"> <span
													class="text-danger">${errors.trevCarno }</span></td>
											</tr>
											<!-- 												<tr> -->
											<!-- 													<th>예약일</th> -->
											<!-- 													<td><input type="date" name="trevDate" id="trevDate" -->
											<!-- 														class="form-control form-control" -->
											<%-- 														value="${hotelRev.trevDate }"> --%>
											<%-- 														<span class="text-danger">${errors.trevDate }</span> --%>
											<!-- 													</td> -->
											<!-- 												</tr> -->
										</table>

										<table class="table-header-fix table-input-in" id="roomtypes">
											<thead>
												<tr>
													<td>룸타입아이디</td>
													<td>객실아이디</td>
												</tr>
											</thead>
											<tbody>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<button type="button" onclick="fHsMake2()">데이터 맹글깅</button>
										<button type="button" onclick="hotelRevInsert()">체킁</button>
									</form>
									<!-- 								<button type="submit" class="btn btn-primary">전송</button> -->
									<button onclick="addRow()">추가</button>
									<button onclick="deleteRow(-1)">삭제</button>
								</div>
							</div>
						</div>
				</div>
			</div>
<%-- <script src="${cPath }/resources/js/pms/hotelrev/hotelRevInsert.js"></script> --%>
<script>

function addRow() {

	const table = document.getElementById('roomtypes');

	 const newRow = table.insertRow();
	  let newIndex = table.rows.length - 2;


	 const newCell1 = newRow.insertCell(0);
	 const newCell2 = newRow.insertCell(1);
// 	 const newCell3 = newRow.insertCell(2);


	 newCell1.innerHTML = `<td><input name='revRoomList[\${newIndex}].roomtypeId' /></td>`;
	 newCell2.innerHTML = `<td><input name='revRoomList[\${newIndex}].roomId' /></td>`;
// 	 newCell3.innerHTML = `<td><input type="hidden" name='revRoomList[\${newIndex}].revroomId' /></td>`;
}

function deleteRow(rownum) {
	const table = document.getElementById('roomtypes');

	const newRow = table.deleteRow(rownum);
}


</script>








