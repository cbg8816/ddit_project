<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>
	tr, td{
		display: flex;
		align-items:center;
	}
</style>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">워크인 예약처리</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 등록</a></li>
						</ul>
					</div>
					<form method="post" action="${cPath }/workInRev/insertRev.do" id="revform">
						<div class="table-top-box right-side">
							<nav class="button-box table-nav">
								<button type="submit" class="btn btn-primary">저장</button>
								<a href="<c:url value='/emp/empList.do' />" class="btn btn-primary">취소</a>
							</nav>
						</div>
						<div class="page-body">
							<div class="m-table-outer">
								<div class="m-table-inner">
										<table class="text-left-td" >
											<tr>
												<td>회원 <input type="radio" name="isMemberYN" value="y"></td>
												<td>비회원 <input type="radio" name="isMemberYN" value="n" checked></td>
												<td>회원번호 <input type="text" name="memId" value="">
												<td class="grade">회원 등급 : <span id="memRank"></span></td>
												<td class="grade">보유 마일리지 : <span id="memMileage"></span></td>
											</tr>
											<tr>
												<td>이름 <input type="text" name="memName" value=""></td>
												<td>전화번호 <input type="text" name="memTel" value=""></td>
												<td>차량번호 <input type="text" name="trevCarno" value=""></td>
											</tr>
											<tr>
												<td>성인 수 <input type="text" name="trevAdult" value=""></td>
												<td>아동 수 <input type="text" name="trevChild" value=""></td>
											</tr>
											<tr>
												<td>
													<div class="custom-select" >
														<select id="revGubun">
															<option value>예약 구분</option>
															<option value="01">호텔</option>
															<option value="02">다이닝</option>
															<option value="03">연회</option>
														</select>
													</div>
												</td>
												<td>
													체크인 <input type="date" name="htervChkin" value="">
													체크아웃 <input type="date" name="htervChkout" value="">
													숙박일 <input type="text" name="htrevStay" value="">
												</td>
											</tr>
											<tr>
												<td>객실 단가</td>
												<c:if test="${not empty roomTypeList }">
													<c:forEach items="${roomTypeList }" var="rooms">
														<td><span class="roomTypeName">${rooms.roomtypeNm }</span></td>
														<td class="price"><span class="roomPrices">${rooms.roomtypePrice }</span>원</td>
													</c:forEach>
												</c:if>
												<c:if test="${empty roomTypeList }">

												</c:if>
											</tr>
											<tr>
												<c:if test="${not empty roomTypeList}">
													<c:forEach items="${roomTypeList }" var="rooms">
														<td>
															${rooms.roomtypeNm }<input type="number" name="roomCnt" value="">
														</td>
													</c:forEach>
													<td><button type="button" class="btn btn-primary" id="changeRoomCnt">적용</button></td>
													<td><button type="button" class="btn btn-primary" id="resetRooms">초기화</button></td>
												</c:if>
												<c:if test="${empty roomTypeList}">
													<td>방 조회 안됨</td>
												</c:if>
											</tr>

											<%-- 여기는 새로고침 없이 금액 보일 수 있게 --%>
											<tr id="price-area">

											</tr>

											<%-- 여기는 고른 방 타입 별 개수만큼 방 배정되고 --%>
											<%-- select로 들어가서 가용 객실 중 고를 수 있게 --%>
											<tr>
												<table>
													<thead>
														<tr>
															<th>객실 타입</th>
															<th>객실 선택</th>
															<th>객실 호수</th>
														</tr>
													</thead>
													<tbody id="overview">

													</tbody>
												</table>
											</tr>

										</table>
									</form>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="roomModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
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