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
						<h3 class="fw-bold mb-3">발주 현황</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">발주 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">발주현황리스트</a></li>
						</ul>
					</div>
					<div>
						<nav class="button-box table-nav">
							<a href="<c:url value='/orders/ordersInsert.do'/>"
								class="btn btn-primary"><i class="fa-solid fa-bars"></i>등록</a>

							<!-- <a href="#" class="btn btn-primary"><i
											class="fa-regular fa-pen-to-square"></i>수정</a>
											<a href="#" class="btn btn-primary"><i class="fa-regular fa-circle-xmark"></i>삭제</a> -->
						</nav>
					</div>
					<div class="table-top-box side">

						<div id="searchUI">
									<form:form modelAttribute="ordersCondition">
										<table>
											<tr>
												<td>발주번호</td>
												<td><form:input path="orderApplyNo" class="form-control" /></td>
												<td>제조사이름</td>
												<td><form:input path="orderBuyerName" class="form-control" /></td>
												<td>발주상태</td>
												<td>
													<div class="custom-select">
														<form:select path="orderApplyState">
															<form:option value="" label="타입선택" />
															<form:option value="" label="전체" />
															<form:option value="미승인" label="미승인" />
															<form:option value="진행중" label="진행중" />
															<form:option value="입고완료" label="입고완료" />
														</form:select>
													</div>
												</td>
												<td>결제상태</td>
												<td>
													<div class="custom-select">
														<form:select path="orderPaymentState">
															<form:option value="" label="타입선택" />
															<form:option value="" label="전체" />
															<form:option value="미지급" label="미지급" />
															<form:option value="지급완료" label="지급완료" />
														</form:select>
													</div>
												</td>
												<td>발주일자</td>
												<td> <form:input path="orderApplyDate" type="date" cssClass="form-control" /></td>
												<td>
													<div class="table-top-box right-side">
														<button type="button" id="searchBtn" class="btn btn-primary">
														<i class="fa-solid fa-magnifying-glass"></i>검색</button>
													</div>
												</td>
											</tr>
										</table>
									</form:form>
								</div>
						<form:form id="searchform" method="get"
							modelAttribute="ordersCondition">
							<form:hidden path="orderApplyNo" />
							<form:hidden path="orderBuyerName" />
							<form:hidden path="orderApplyState" />
							<form:hidden path="orderPaymentState" />
							<form:hidden path="orderApplyDate" />
							<input type="hidden" name="page" />
						</form:form>

					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th></th>
											<th>발주 번호</th>
											<th>분류명</th>
											<th>제조사이름</th>
											<th>발주 상태</th>
											<th>결제 상태</th>
											<th>발주 일자</th>
											<th>납기일</th>
											<th style="width:10px;"></th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty ordersList }">
												<c:forEach items="${ordersList }" var="orders">
													<tr>
													  <c:choose>
													 <c:when test="${orders.orderApplyState eq '미승인'}">
													        <td style="width:10px;  font-weight: bold; color: #87cefa;">
													        	승인필요
													        </td>
													    </c:when>
													  <c:otherwise>
													  		<td></td>
													  </c:otherwise>
													  </c:choose>
														<td><c:url value="/orders/ordersDetail.do"
																var="ordersDetailUrl">
																<c:param name="what" value="${orders.orderApplyNo }" />
															</c:url> <a href="${ordersDetailUrl }">${orders.orderApplyNo } </a>
														</td>
														<td class="td-text">${orders.lprod.lprodNm }</td>
														<td class="td-text">${orders.buyer.buyerName }</td>
														<c:choose>
													    <c:when test="${orders.orderApplyState eq '진행중'}">
													        <td><span style="color: blue;">${orders.orderApplyState}</span></td>
													    </c:when>
													    <c:when test="${orders.orderApplyState eq '입고완료'}">
													        <td><span style="color: green;">${orders.orderApplyState}</span></td>
													    </c:when>
													    <c:when test="${orders.orderApplyState eq '미승인'}">
													        <td><span style="color: red;">${orders.orderApplyState}</span></td>
													    </c:when>
													    <c:otherwise>
													        <td><span>상태 없음</span></td>
													    </c:otherwise>
														</c:choose>

														<c:choose>
													    <c:when test="${orders.orderApplyPaymentstate eq '출금완료'}">
													        <td><span style="color: green;">${orders.orderApplyPaymentstate}</span></td>
													    </c:when>
													     <c:when test="${orders.orderApplyPaymentstate eq '미지급'}">
													        <td><span style="color: red;">${orders.orderApplyPaymentstate}</span></td>
													    </c:when>
													    <c:otherwise>
													        <td><span></span></td>
													    </c:otherwise>
														</c:choose>
														<td>${orders.orderApplyDate }</td>
														<td>${orders.orderApplyInDate }</td>
														<c:choose>
														    <c:when test="${orders.orderApplyState eq '진행중' && orders.orderApplyState ne '입고완료'}">
														    <td>
															  <c:url value="/enter/enterInsert.do"
																var="enterInsertUrl">
																<c:param name="what" value="${orders.orderApplyNo }" />
															</c:url> <a href="${enterInsertUrl }" class="btn btn-primary">입고처리 </a>

														</td>

														    </c:when>
														    <c:otherwise>
													        <td></td>
														    </c:otherwise>
															</c:choose>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="9">발주 없음.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="page-footer">
						<div class="paging paging-area">${pagingHTML }</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
