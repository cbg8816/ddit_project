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
						<h3 class="fw-bold mb-3">급여 리스트</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">급여 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">급여 리스트</a></li>
						</ul>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>지급일</th>
											<th>사원이름</th>
											<th>급여</th>
											<th>상여금</th>
											<th>야근수당</th>
											<th>공재금액</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty paystubList }">
												<c:forEach items="${paystubList }" var="payList">
													<c:url value="/paystub/empPaystubDetail.do" var="payDetailUrl">
														<c:param name="what" value="${payList.paystubId }"></c:param>
													</c:url>
													<tr onclick="location.href='${payDetailUrl }'" style="cursor: pointer;">
														<td>${payList.paystubPaydate }</td>
														<td>${payList.emp.empName }</td>
														<td class="td-number"><fmt:formatNumber type="number" value="${payList.paystubNomal }" />원</td>
														<td class="td-number"><fmt:formatNumber type="number" value="${payList.paystubBonus }" />원</td>
														<td class="td-number"><fmt:formatNumber type="number" value="${payList.paystubOvertime }" />원</td>
														<td class="td-number">
<%-- 														${payList.deductible } --%>
															<fmt:formatNumber type="number" value="${payList.deductible }" />원
														</td>


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
					<form:form id="searchform" method="get" modelAttribute="condition">
						<input type="hidden" name="what" value="${empvo.empId }" />
						<input type="hidden" name="page" />
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>