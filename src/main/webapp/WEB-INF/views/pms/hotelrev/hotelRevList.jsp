<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">호텔예약 조회</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item">예약관리</li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item">객실예약조회</li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<button class="btn btn-primary" type="button" id="arriveListBtn"
								data-bs-toggle="modal">
								<i class="fa-solid fa-bars"></i>도착예정자
							</button>
						</nav>
					</div>
						<div id="searchUI">
							<form:form modelAttribute="hotelCondition" id="viewform">
								<div id="search-table" class="mb-2">
									<div class="d-flex justify-content-between align-items-center search-form">
										<div>예약번호</div>
										<div>
											<!-- 	<input name="condition.searchWord" value="revNum" /> -->
											<form:input path="revNum" class="form-control" />
										</div>
										<div>고객명</div>
										<div><form:input path="memName" class="form-control" /></div>
										<div>룸타입</div>
										<div>
											<div class="custom-select" style="width: 120px;">
												<form:select path="roomType">
													<form:option value="" label="타입선택" />
													<form:option value="" label="타입선택" />
													<c:forEach items="${roomTypeList }" var="rt">
														<form:option value="${rt.roomtypeId }"
															label="${rt.roomtypeNm }" />
													</c:forEach>
												</form:select>
											</div>
										</div>
										<div>입실일</div>
										<div><input type="date" name="chkin" value="${hotelCondition.chkin }"
											class="form-control" style="width: 100px; padding : .6rem 7px;" /></div>
<!-- 										<td>퇴실일</td> -->
<%-- 										<td><input type="date" name="chkout" value="${hotelCondition.chkout }" --%>
<!-- 											class="form-control" /></td> -->
										<div>예약상태</div>
										<div>
											<div class="custom-select" style="width: 100px;">
												<form:select path="status">
													<form:option value="" label="타입선택" />
													<form:option value="" label="타입선택" />
														<form:option value="RV" label="예약접수" />
														<form:option value="CF" label="예약확정" />
														<form:option value="CC" label="예약취소" />
														<form:option value="IN" label="입실" />
														<form:option value="OUT" label="퇴실" />
												</form:select>
											</div>
										</div>
										<div><button type="button" id="searchBtn" class="btn btn-primary" >검색</button></div>
										<div><button type="button" id="resetBtn" class="btn btn-primary" ><i class="fa-solid fa-rotate-right"></i></button></div>
									</div>
<!-- 											<tr> -->
<!-- 												<td>입실일</td> -->
<!-- 												<td><input type="date" name="chkin" value="chkin" -->
<!-- 													class="form-control" /></td> -->
<!-- 												<td>퇴실일</td> -->
<!-- 												<td><input type="date" name="chkout" value="chkout" -->
<!-- 													class="form-control" /></td> -->
<!-- 											</tr> -->
								</div>
							</form:form>
							<%-- 	<form:input path="condition.searchWord" /> --%>
						</div>
						<form:form id="searchform" method="get"
							modelAttribute="hotelCondition">
							<%-- 	<form:input path="revNum" /> --%>
							<%-- 	<form:input path="memName" /> --%>
							<%-- 	<form:input path="roomType" /> --%>
							<%-- 	<form:input path="chkin" /> --%>
							<%-- 	<form:input path="chkout" /> --%>
							<form:hidden path="revNum" />
							<form:hidden path="memName" />
							<form:hidden path="roomType" />
							<form:hidden path="chkin" />
							<form:hidden path="chkout" />
							<form:hidden path="status" />
							<input type="hidden" name="page" />
						</form:form>
<!-- 					</div> -->
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
								<colgroup>
<%-- 									<col width="0%" /> <!-- 예약번호  --> --%>
<%-- 									<col width="5%" /> <!-- 고객명 --> --%>
<%-- 									<col width="20%" /> <!-- 휴대폰 --> --%>
<%-- 									<col width="10%" /> <!-- 투숙일 --> --%>
<%-- 									<col width="10%" /> <!-- 퇴실일 --> --%>
<%-- 									<col width="5%" /> <!-- 숙박일 --> --%>
<%-- 									<col width="16%" /> <!-- 예약상태 --> --%>
<%-- 									<col width="5%" /> <!-- 룸타입 --> --%>
<%-- 									<col width="5%" /> <!-- 룸 --> --%>
<%-- 									<col width="13%" /> <!-- 성인수 --> --%>
<%-- 									<col width="13%" /> <!-- 아동수 --> --%>
<%-- 									<col width="5%" /> <!-- 요금 --> --%>
								</colgroup>
									<thead>
										<tr>
											<th>예약번호</th>
											<th>고객명</th>
											<th>휴대폰</th>
											<th>투숙일</th>
											<th>퇴실일</th>
											<th>숙박일</th>
											<th>예약상태</th>
											<th>룸타입</th>
											<th>룸</th>
											<th>성인/아동</th>
<!-- 											<th>아동수</th> -->
											<th>요금(원)</th>
										</tr>
									</thead>
									<tbody>
									<c:if test="${not empty hotelRevList }">
										<c:forEach items="${hotelRevList }" var="hotelRev">
											<c:forEach items="${hotelRev.revRoomList }" var="rrList">
										<tr>
											<td>
												<a href="${cPath }/hotelrev/hotelRevDetail.do?what=${hotelRev.htrevId }">${hotelRev.htrevId }-${rrList.revroomId }</a>
											</td>
											<td>${hotelRev.memName }</td>
											<td>${hotelRev.memTel }</td>
											<td>${hotelRev.htrevChkin }</td>
											<td>${hotelRev.htrevChkout }</td>
											<td>${hotelRev.htrevStay }</td>
											<td>${hotelRev.cdtypeKnm }</td>
											<td>${rrList.roomtypeNm }</td>
											<td>${rrList.roomId }</td>
											<td>${hotelRev.trevAdult }/${hotelRev.trevChild }</td>
<%-- 											<td>${hotelRev.trevChild }</td> --%>
											<td class="price">${hotelRev.htrevTprice }</td>
										</tr>
												</c:forEach>
											</c:forEach>
										</c:if>
										<c:if test="${empty hotelRevList }">
											<tr>
												<td colsapn="12">조회된 예약 없음</td>
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
<div class="modal fade" id="arriveListModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">도착예정자</h5>
			</div>
			<div id="modalSearchUI">
			<form:form modelAttribute="hotelCondition">
				<table>
					<tr>
						<td>예약번호</td>
						<td><form:input path="revNum" class="form-control" /></td>
						<td>고객명</td>
						<td><form:input path="memName" class="form-control" /></td>
						<td>룸타입</td>
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
						<td><button type="button" id="modalsearchBtn" class="btn btn-primary" >검색</button></td>
					</tr>
					</table>
				</form:form>
<!-- 					<nav class="nav-search d-lg-flex input-search table-nav ms-1"> -->
<!-- 						<div class="custom-select"> -->
<%-- 							<form:select path="condition.searchType"> --%>
<%-- 								<form:option value="" label="선택" /> --%>
<%-- 								<form:option value="" label="선택" /> --%>
<%-- 								<form:option value="revNo" label="예약번호" /> --%>
<%-- 								<form:option value="name" label="고객명" /> --%>
<%-- 								<form:option value="rType" label="룸타입" /> --%>
<%-- 							</form:select> --%>
<!-- 						</div> -->
<!-- 						<div class="input-group ms-2"> -->
<%-- 							<form:input path="condition.searchWord" cssClass="form-control" /> --%>
<!-- 							<div class="input-group-prepend"> -->
<!-- 								<button class="btn btn-search pe-1" id="modalsearchBtn"> -->
<!-- 									<i class="fa-solid fa-magnifying-glass"></i> -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</nav> -->
			</div>

			<div class="modal-body">
				<table class="table-header-fix table-input-in">
					<thead>
						<tr>
							<th>예약번호</th>
							<th>고객명</th>
							<th>객실타입</th>
<!-- 							<th>도착여부</th> -->
<!-- 							<th>비고</th> -->
							<th></th>
						</tr>
					</thead>
					<tbody id="list-body" >

					</tbody>
				</table>

			</div>

			<div class="page-footer">
				<div id="modalPaging"></div>
			</div>
			<form:form id="modalSearch" method="get" modelAttribute="hotelCondition">
				<form:hidden path="revNum" />
				<form:hidden path="memName" />
				<form:hidden path="roomType" />
				<input type="hidden" name="page" id="modalPage" />
			</form:form>


			<div class="modal-footer border-0">
				<button type="button" class="btn btn-danger" id="modalClose"
				data-dismiss="modal" data-bs-toggle="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<script src="${cPath }/resources/js/pms/hotelrev/hotelRevList.js"></script>
<script>
resetBtn.addEventListener("click", function(e){
	const vInps = viewform.querySelectorAll("input");
	const sInps = searchform.querySelectorAll("input");

	vInps.forEach((inp)=>{
		inp.value = "";
	});

	sInps.forEach((inp)=>{
		inp.value = "";
	});

	searchform.requestSubmit();
})
</script>

