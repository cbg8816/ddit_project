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
						<h3 class="fw-bold mb-3">지금 페이지</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item">예약관리</li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item">다이닝예약조회</li>
						</ul>
					</div>
					<div class="table-top-box side">
					</div>
						<div id="searchUI">
							<form:form modelAttribute="dinCondition">
								<table>
									<tr>
										<td>예약번호</td>
										<td>
											<form:input path="revNum" class="form-control" />
										</td>
										<td>고객명</td>
										<td><form:input path="memName" class="form-control" /></td>
										<td>다이닝타입</td>
										<td>
											<div class="custom-select">
												<form:select path="dinType">
													<form:option value="" label="타입선택" />
													<form:option value="" label="타입선택" />
													<c:forEach items="${dinTypeList }" var="dt">
														<form:option value="${dt.dintypeId }"
																label="${dt.dintypeNm }" />
														</c:forEach>
													</form:select>
											</div>
										</td>
										<td>이용날짜</td>
										<td><input type="date" name="dinDate" value="dinDate"
										class="form-control" /></td>
										<td>
											<form:button type="submit" class="btn btn-primary">검색</form:button>
										</td>
									</tr>
								</table>
<%-- 								<form:button type="submit">검색</form:button> --%>
<%-- 								<form:button type="reset">초기화</form:button> --%>
<!-- 								<button type="reset">초기화</button> -->
							</form:form>
<!-- 							<button id="searchBtn">검색</button> -->
						</div>
						<form:form id="searchform" method="get"
							modelAttribute="dinCondition">
<%-- 							<form:input path="revNum" /> --%>
<%-- 							<form:input path="memName" /> --%>
<%-- 							<form:input path="dinType" /> --%>
<%-- 							<form:input path="dinDate" /> --%>
							<form:hidden path="revNum" />
							<form:hidden path="memName" />
 							<form:hidden path="dinType" />
							<form:hidden path="dinDate" />
							<input type="hidden" name="page" />
 						</form:form>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>예약번호</th>
											<th>고객명</th>
											<th>휴대폰</th>
											<th>이용날짜</th>
											<th>예약상태</th>
											<th>다이닝타입</th>
											<th>성인수</th>
											<th>아동수</th>
											<th>요금(원)</th>
										</tr>
									</thead>
									<tbody>
									<c:if test="${not empty dinRevList }">
										<c:forEach items="${dinRevList }" var="dinRev">
										<tr>
											<td>
												<a href="${cPath }/dinrev/dinRevUpdate.do?what=${dinRev.dinId }">${dinRev.dinId }</a>
											</td>
											<td>${dinRev.memName }</td>
											<td>${dinRev.memTel }</td>
											<td>${dinRev.dinDate }</td>
											<td>${dinRev.trevSt }</td>
											<td>${dinRev.dintypeNm }</td>
											<td>${dinRev.trevAdult }</td>
											<td>${dinRev.trevChild }</td>
											<td class="price">${dinRev.dinTprice }</td>
										</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty dinRevList }">
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