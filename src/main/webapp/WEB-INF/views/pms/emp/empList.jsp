<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">직원 관리 리스트</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리 리스트</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<a href="<c:url value='/emp/empInsert.do' />" class="btn btn-primary"><i class="fa-solid fa-bars"></i>등록</a>
						</nav>
						<div class="right">
							<div id="searchUI">
								<nav class="nav-search d-lg-flex input-search table-nav ms-1">
									<div class="custom-select">
										<form:select path="condition.searchType">
											<form:option value="" label="전체" />
											<form:option value="name" label="사원이름" />
											<form:option value="dep" label="부서명" />
										</form:select>
									</div>
									<div class="input-group ms-2">
										<form:input path="condition.searchWord" cssClass="form-control" />
										<div class="input-group-prepend">
											<button class="btn btn-search pe-1" id="searchBtn">
												<i class="fa-solid fa-magnifying-glass"></i>
											</button>
										</div>
									</div>
								</nav>
							</div>
						</div>
					</div>
					<form:form id="searchform" method="get" modelAttribute="condition">
						<form:hidden path="searchType"/>
						<form:hidden path="searchWord"/>
						<input type="hidden" name="page" />
					</form:form>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
<!-- 											<th> -->
<!-- 												<label class="input-container"> -->
<!-- 													<input type="checkbox" class="chk-all"> -->
<!-- 													<span class="checkmark"></span> -->
<!-- 												</label> -->
<!-- 											</th> -->
											<th>사번</th>
											<th>이름</th>
											<th>직책</th>
											<th>부서</th>
											<th>입사일</th>
											<th>전화번호</th>
											<th>연봉</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty empList }">
												<c:forEach items="${empList }" var="empList">
													<c:url value="/emp/empDetail.do" var="empDetailUrl">
														<c:param name="what" value="${empList.empId }"></c:param>
													</c:url>
													<tr class="pointer" onclick="location.href='${empDetailUrl}'">
<!-- 														<td> -->
<!-- 															<label class="input-container"> -->
<!-- 																<input type="checkbox" class="chk-one"> -->
<!-- 																<span class="checkmark"></span> -->
<!-- 															</label> -->
<!-- 														</td> -->
														<td>${empList.empId }</td>
														<td>${empList.empName }</td>
														<td>${empList.position.posiNm }</td>
														<td>${empList.department.depNm }</td>
														<td>${empList.empHirdate }</td>
														<td>${empList.empTel }</td>
<%-- 														<td id="sal">${empList.empSal }원</td> --%>
														<td><fmt:formatNumber type="number" value="${empList.empSal }" />원</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="8">조회 된 데이터 없음</td>
												</tr>
											</c:otherwise>
										</c:choose>
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