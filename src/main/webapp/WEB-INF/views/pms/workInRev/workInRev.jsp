<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card position-relative">
					<div class="reference">
						<button type="button" id="insert-data">시연용 데이터 입력</button>
						<button type="button" class="reference-view">가격보기</button>
						<div class="reference-content" style="width: 190px;">
							<c:if test="${not empty roomTypeList }">
								<c:forEach items="${roomTypeList }" var="rooms">
									<div class="d-flex">
										<p class="roomTypeName">${rooms.roomtypeNm }</p>
										<p class="price">
											<span class="roomPrices">${rooms.roomtypePrice }</span>원
										</p>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${empty roomTypeList }">

							</c:if>
						</div>
					</div>
					<div class="page-header">
						<h3 class="fw-bold mb-3">워크인 예약처리</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i
									class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">입실등록관리</a></li>
							<!-- 							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li> -->
							<!-- 							<li class="nav-item"><a href="#">직원 등록</a></li> -->
						</ul>
					</div>
					<form method="post" action="${cPath }/workInRev/insertRev.do"
						id="revform">
						<div class="page-body workin d-flex">
							<div class="workIn-left">
								<div class="d-flex  justify-content-end mb-2">
									<button type="button" class="btn btn-primary ms-2"
										id="changeRoomCnt">적용</button>
									<button type="button" class="btn btn-primary ms-2"
										id="resetRooms">초기화</button>
								</div>
								<div class="m-table-outer">
									<div class="m-table-inner">
										<table class="text-left-td workin-table">
											<tr>
												<th>회원구분</th>
												<td colspan="9" class="d-flex">
													<label class="d-flex">
														<span>회원</span>
														<input type="radio" name="isMemberYN" value="y">
													</label>
													<label class="d-flex ms-2">
														<span>비회원</span>
														<input type="radio" name="isMemberYN" value="n" checked>
													</label>
												</td>
											</tr>
											<tr>
												<th>회원정보</th>
												<td colspan="9">
													<input type="text" name="memId" value="" readonly="readonly">
													<p class="grade">
														회원 등급 : <span id="memRank"></span>
													</p>
													<p class="grade">
														보유 마일리지 : <span id="memMileage"></span>
													</p></td>
											</tr>
											<tr>
												<th>이름</th>
												<td colspan="2"><input type="text" name="memName"
													value=""></td>
												<th>전화번호</th>
												<td colspan="2"><input type="text" name="memTel"
													value=""></td>
												<th>차량번호</th>
												<td colspan="2"><input type="text" name="trevCarno"
													value=""></td>
												<td></td>
											</tr>
											<tr>
												<th>예약선택</th>
												<td colspan="2">
													<div class="custom-select" style="width: 100%;">
														<select id="revGubun">
															<option value>예약 구분</option>
															<option value="01">호텔</option>
															<option value="02">다이닝</option>
															<option value="03">연회</option>
														</select>
													</div>
												</td>
												<th>성인 수</th>
												<td colspan="2"><input type="text" name="trevAdult"
													value=""></td>
												<th>아동 수</th>
												<td colspan="2"><input type="text" name="trevChild"
													value=""></td>
												<td></td>
											</tr>
											<tr>
												<th>체크인</th>
												<td colspan="2"><input type="date" name="htervChkin"
													value=""></td>
												<th>체크아웃</th>
												<td colspan="2"><input type="date" name="htervChkout"
													value=""></td>
												<th>숙박일</th>
												<td colspan="2"><input type="text" name="htrevStay"
													value=""></td>
												<td></td>
											</tr>
											<tr>
												<c:if test="${not empty roomTypeList}">
													<c:forEach items="${roomTypeList }" var="rooms">
														<th>${rooms.roomtypeNm }</th>
														<td><input type="number" name="roomCnt" value="">
														</td>
													</c:forEach>

												</c:if>
												<c:if test="${empty roomTypeList}">
													<th></th>
													<td>방 조회 안됨</td>
												</c:if>
											</tr>
											<tr id="price-area">

											</tr>
										</table>
									</div>
								</div>
							</div>
							<div class="workIn-right" style="margin-top: 48px;">
								<%-- 여기는 고른 방 타입 별 개수만큼 방 배정되고 --%>
								<%-- select로 들어가서 가용 객실 중 고를 수 있게 --%>
								<table>
									<thead style="height: 65px;">
										<tr>
											<th>객실 타입</th>
											<th>객실 선택</th>
											<th>객실 호수</th>
										</tr>
									</thead>
									<tbody id="overview">

									</tbody>
								</table>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="roomModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document" style="max-width: 800px;">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">
					<span class="fw-mediumbold"> 가용 객실 리스트 </span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="rev-modal-body" style="padding: 2rem 5rem;">

			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" id="rev-confirm">확인</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-hidden="true" data-bs-backdrop="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">
					<span class="fw-mediumbold"> 결제 </span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" id="pay-confirm">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="pay-modal-body" >

			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal" aria-label="Close" >취소</button>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath }/resources/js/pms/workInRev/workInRev.js"></script>