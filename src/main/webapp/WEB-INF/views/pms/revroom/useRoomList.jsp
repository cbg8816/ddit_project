<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">재실내역 조회</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item">예약관리</li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item">재실내역조회</li>
						</ul>
					</div>
<!-- 					<div class="table-top-box side"> -->
						<div id="searchUI">
							<form:form modelAttribute="hotelCondition">
								<table>
									<tr>
										<td>예약번호</td>
										<td>
											<form:input path="revNum" class="form-control" />
										</td>
										<td>고객명</td>
										<td><form:input path="memName" class="form-control" /></td>
										<td>룸번호</td>
										<td><form:input path="roomNo" class="form-control" /></td>
										<td>룸타입</td>
										<td>
										</td>
										<td>
											<div class="custom-select">
												<form:select path="roomType">
													<form:option value="" label="타입선택" />
													<form:option value="" label="타입선택" />
													<c:forEach items="${roomTypeList }" var="rt">
														<form:option value="${rt.roomtypeId }"
															label="${rt.roomtypeNm }" />
													</c:forEach>
												</form:select>
											</div>
										</td>
										<td>입실일</td>
										<td><input type="date" name="chkin" value="chkin"
											class="form-control" /></td>
										<td>퇴실일</td>
										<td><input type="date" name="chkout" value="chkout"
											class="form-control" /></td>
										<td><button type="button" id="searchBtn" class="btn btn-primary" >검색</button></td>
									</tr>
								</table>
							</form:form>
						</div>
						<form:form id="searchform" method="get" modelAttribute="hotelCondition">
							<form:hidden path="revNum" />
							<form:hidden path="roomNo" />
							<form:hidden path="roomType" />
							<form:hidden path="memName" />
							<form:hidden path="chkin" />
							<form:hidden path="chkout" />
							<input type="hidden" name="page" />
						</form:form>
<!-- 					</div> -->
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
								<colgroup>
									<col width="0%" /> <!-- 예약번호  -->
									<col width="5%" /> <!-- 룸 -->
									<col width="8%" /> <!-- 룸타입 -->
									<col width="10%" /> <!-- 고객명 -->
									<col width="22%" /> <!-- 휴대폰 -->
									<col width="10%" /> <!-- 투숙일 -->
									<col width="10%" /> <!-- 퇴실일 -->
									<col width="5%" /> <!-- 숙박일 -->
									<col width="13%" /> <!-- 예약상태 -->
									<col width="13%" /> <!-- 성인수 -->
									<col width="13%" /> <!-- 아동수 -->
									<col width="5%" /> <!-- 요금 -->
								</colgroup>
									<thead>
										<tr>
											<th>예약번호</th>
											<th>룸</th>
											<th>룸타입</th>
											<th>고객명</th>
											<th>휴대폰</th>
											<th>투숙일</th>
											<th>퇴실일</th>
											<th>숙박일</th>
											<th>예약상태</th>
											<th>성인수</th>
											<th>아동수</th>
											<th>요금(원)</th>
										</tr>
									</thead>
									<tbody>
									<c:if test="${not empty useRoomList }">
										<c:forEach items="${useRoomList }" var="useRoom">
										<tr>
											<td>
												<a href="${cPath }/hotelrev/hotelRevUpdate.do?what=${useRoom.htrevId }">${useRoom.htrevId }-${useRoom.revroomId }</a>
											</td>
											<td>${useRoom.roomId }</td>
											<td>${useRoom.roomtypeNm }</td>
											<td>${useRoom.memName }</td>
											<td>${useRoom.memTel }</td>
											<td>${useRoom.htrevChkin }</td>
											<td>${useRoom.htrevChkout }</td>
											<td>${useRoom.htrevStay }</td>
											<td>${useRoom.cdtypeKnm }</td>
											<td>${useRoom.trevAdult }</td>
											<td>${useRoom.trevChild }</td>
											<td class="price">${useRoom.htrevTprice }</td>
										</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty useRoomList }">
											<tr>
												<td colspan="12">조회된 예약 없음</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="page-footer">
						<div class="paging paging-area">
							${pagingHTML }
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

