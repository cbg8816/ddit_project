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
						<h3 class="fw-bold mb-3">연회 리스트</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">연회</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">연회등록</a></li>
						</ul>
					</div>
<!-- 			<div class="table-top-box side"> -->
<!-- 					<div id="searchUI"> -->
<%-- 						<form:form modelAttribute="condition"> --%>
<!-- 							<table> -->
<!-- 								<tr> -->
<!-- 									<td>예약번호</td> -->
<!-- 									<td> -->
<%-- 										<form:input path="partyNo" class="form-control" /> --%>
<!-- 									</td> -->
<!-- 									<td>고객명</td> -->
<%-- 									<td><form:input path="memName" class="form-control" /></td> --%>
<!-- 									<td>핸드폰번호</td> -->
<%-- 									<td><form:input path="memTel" class="form-control" /></td> --%>
<!-- 									<td>이용날짜</td> -->
<!-- 									<td><input type="date" name="partyDate" value="partyStart" -->
<!-- 										class="form-control" /></td> -->
<!-- 									<td> -->
<!-- 										<div class="custom-select"> -->
<%-- 												<form:select path="partyNo"> --%>
<%-- 													<form:option value="" label="타입선택" /> --%>
<%-- 													<c:forEach items="${partyList }" var="party"> --%>

<%-- 													</c:forEach> --%>
<%-- 											</form:select> --%>
<!-- 										</div> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 							</table> -->
<!-- 								<button type="reset">초기화</button> -->
<%-- 							<form:button type="submit">검색</form:button> --%>
<%-- 							<form:button type="reset">초기화</form:button> --%>
<%-- 						</form:form> --%>
<!-- 							<button id="searchBtn">검색</button> -->
<!-- 						</div> -->
<%-- 					<form:form id="searchform" method="get" --%>
<%-- 						modelAttribute="dinCondition"> --%>
<%-- 						<form:hidden path="revNum" /> --%>
<%-- 						<form:hidden path="memName" /> --%>
<%-- 						<form:hidden path="partyDate" /> --%>
<!-- 						<input type="hidden" name="page" /> -->
<%-- 					</form:form> --%>
<!-- 			</div> -->
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>
												<label class="input-container">
													<input type="checkbox" class="chk-all">
													<span class="checkmark"></span>
												</label>
											</th>
											<th>예약번호</th>
											<th>연회장번호</th>
											<th>고객명</th>
											<th>핸드폰번호</th>
											<th>예약일</th>
											<th>연회명</th>
											<th>성인수</th>
											<th>아동수</th>
											<th>추가사항</th>
											<th>계약금</th>
										</tr>
									</thead>
									<tbody>
									<c:if test="${not empty partyList }">
										<c:forEach items="${partyList }" var="party">
										<tr>
											<td>
												<label class="input-container">
													<input type="checkbox" class="chk-one">
													<span class="checkmark"></span>
												</label>
											</td>
											<td>
												<a href="${cPath }/Partyservice/partydetail.do?what=${party.partyNo }">${party.partyNo }</a>
											</td>
											<td>${party.venueNo }</td>
											<td>${party.member.memName }</td>
											<td>${party.member.memTel }</td>
											<td>${party.partyStart }</td>
											<td>${party.partyName }</td>
											<td>${party.total.trevAdult }</td>
											<td>${party.total.trevChild }</td>
											<td>${party.partyRequest }</td>
											<td>${party.partyPercent }</td>
										</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty partyList }">
											<tr colsapn="12">
												<td>조회된 예약 없음</td>
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