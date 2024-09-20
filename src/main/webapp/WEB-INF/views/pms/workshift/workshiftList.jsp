<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">근무표 조회</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item">근무표</li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item">근무표리스트</li>
						</ul>
					</div>
						<div class="table-top-box side">
						<nav class="button-box table-nav">
<%-- 							<a href="<c:url value='/workshift/workshiftInsert' />" class="btn btn-primary"><i class="fa-solid fa-bars"></i>등록</a> --%>
						</nav>
						<div class="right">
							<div id="searchUI">
								<nav class="nav-search d-lg-flex input-search table-nav ms-1">
<!-- 									<div class="custom-select"> -->
<%-- 										<form:select path="condition.searchType"> --%>
<%-- 											<form:option value="" label="전체" /> --%>
<%-- 										</form:select> --%>
<!-- 									</div> -->
									<div class="input-group ms-2">
<%-- 										<form:input path="condition.searchWord" cssClass="form-control" /> --%>
<!-- 										<div class="input-group-prepend"> -->
<!-- 											<button class="btn btn-search pe-1" id="searchBtn"> -->
<!-- 												<i class="fa-solid fa-magnifying-glass"></i> -->
<!-- 											</button> -->
<!-- 										</div> -->
									</div>
								</nav>
							</div>
						</div>
					</div>

							<form method="get">
								<table id="workshift-list-search-table">
									<tr>
										<td><input type="month" id="dal" name="dal" class="form-control"/></td>
										<td><button type="submit" id="searchBtn" class="btn btn-primary" >검색</button></td>
									</tr>
								</table>
							</form>

						<div class="reference">
							<button type="button" class="reference-view">타입 자세히</button>
							<div class="reference-content">
								<p>A. 06:00~14:00</p>
								<p>B. 08:00~16:00</p>
								<p>C. 10:00~18:00</p>
								<p>D. 14:00~22:00</p>
								<p>E. 22:00~06:00</p>
								<p>휴. 휴일</p>
							</div>
						</div>


<%-- 					<form:form id="searchform" method="get"> --%>
<!-- 						<input type="hidden" name="page" /> -->
<!-- 						<input type="text" name="page" /> -->
<%-- 					</form:form> --%>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">

								<table class="table-header-fix table-input-in">
									<thead>
									<tr>
									<c:set value="${dayList[0].workDay }" var="month"/>
									<th>${fn:substring(month, 5, 7) }월</th>
									<c:forEach items="${dayList }" var="dayList">
									<th>${fn:substring(dayList.workDay, 8, 10) }</th>
									</c:forEach>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${empList }" var="empList">
										<tr>
											<td>${empList.empName }</td>
										<c:forEach items="${empList.workshiftList }" var="workshiftList">
											<c:choose>
												<c:when test="${fn:substring(workshiftList.workType, 0, 1) eq '휴'}">
													<td><span style="color: red;">${fn:substring(workshiftList.workType, 0, 1)}</span></td>
												</c:when>
												<c:otherwise>
													<td>${fn:substring(workshiftList.workType, 0, 1) }</td>
												</c:otherwise>
											</c:choose>
											</c:forEach>
										</tr>
<%-- 										${empList.workshiftList } --%>
									</c:forEach>
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

<script src="${cPath }/resources/js/pms/workshift/workshiftInsert.js"></script>