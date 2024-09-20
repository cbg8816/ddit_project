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
						<h3 class="fw-bold mb-3">입고 현황</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">입고 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">입고 현황 리스트</a></li>
						</ul>
					</div>
					<div>
							<a href="<c:url value='/prod/prodList.do' />"
														class="btn btn-primary">재고목록</a>
							<!-- <a href="#" class="btn btn-primary"><i
											class="fa-regular fa-pen-to-square"></i>수정</a>
											<a href="#" class="btn btn-primary"><i class="fa-regular fa-circle-xmark"></i>삭제</a> -->
						</div>
						<div class="table-top-box side">
							<div id="searchUI">
									<form:form modelAttribute="enterCondition">
										<table>
											<tr>
												<td>입고번호</td>
												<td><form:input path="enterNo" class="form-control" /></td>
												<td>분류명</td>
												<td><form:input path="enterLgu" class="form-control" /></td>
												<td>거래처명</td>
												<td><form:input path="enterBuyer" cssClass="form-control" /></td>
												<td>발주번호</td>
												<td><form:input path="enterAppyNo" cssClass="form-control" /></td>
												<td>입고일</td>
												<td><form:input path="enterDate" type="date" cssClass="form-control" /></td>
												<td>
													<div class="table-top-box right-side">
														<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
													</div>
												</td>
											</tr>
											
										</table>
									</form:form>
								</div>
						<form:form id="searchform" method="get"
							modelAttribute="enterCondition">
							<form:hidden path="enterNo" />
							<form:hidden path="enterLgu" />
							<form:hidden path="enterBuyer" />
							<form:hidden path="enterAppyNo" />
							<form:hidden path="enterDate" />
							<input type="hidden" name="page" />
						</form:form>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<td>입고번호</td>
											<td>발주번호</td>
											<td>제조사</td>
											<td>분류</td>
											<td>품목수</td>
											<td>금액</td>
											<td>결제상태</td>
											<td>입고일자</td>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty enterList }">
												<c:forEach items="${enterList }" var="enter">
													<tr>
											 			<td><c:url value="/enter/enterDetail.do"
																var="enterDetailUrl">
																<c:param name="what" value="${enter.enterOrder }" />
															</c:url> <a href="${enterDetailUrl }">${enter.enterTurn } </a>
														</td>
														<td>
															<c:url value="/orders/ordersList.do"
																var="orderDetailUrl">
															</c:url> <a href="${orderDetailUrl }">${enter.enterOrder } </a>
														</td>
														<td class="td-text">${enter.buyer.buyerName }</td>
														<td class="td-text">${enter.lprod.lprodNm }</td>
														<td>${enter.enterQty }개</td>
														<td class="price">${enter.enterTotal }원</td>
														<c:choose>
													    <c:when test="${enter.enterWith eq '출금완료'}">
													        <td><span style="color: green;">${enter.enterWith}</span></td>
													    </c:when>
													     <c:when test="${enter.enterWith eq '미지급'}">
													        <td><span style="color: red;">${enter.enterWith}</span></td>
													    </c:when>
													     <c:when test="${enter.enterWith eq '출금필요'}">
													        <td>
													        	<c:url value="/withdrawal/withdrawalSendList.do"
																var="withUrl">
															</c:url> <a href="${withUrl }">${enter.enterWith} </a>
													        	
													        </td>
													    </c:when>
													    <c:otherwise>
													        <td><span></span></td>
													    </c:otherwise>
													    </c:choose>
														<td>${enter.enterDay }</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="5">입고 없음.</td>
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
