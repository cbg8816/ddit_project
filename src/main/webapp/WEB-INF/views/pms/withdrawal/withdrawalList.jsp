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
						<h3 class="fw-bold mb-3">출금내역</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">출금</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">출금내역</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<a href="<c:url value='/withdrawal/withdrawalList.do'/>"
								class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i>출금내역조회</a>
							<a href="<c:url value='/withdrawal/withdrawalRemainList.do'/>"
								class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i>미지급내역 조회</a>
							<a href="<c:url value='/withdrawal/withdrawalSendList.do'/>"
								class="btn btn-primary"><i class="fa-regular fa-pen-to-square"></i>출금등록</a>
							<!-- <a href="#" class="btn btn-primary"><i
											class="fa-regular fa-pen-to-square"></i>수정</a>
											<a href="#" class="btn btn-primary"><i class="fa-regular fa-circle-xmark"></i>삭제</a> -->
						</nav>
						<div class="right">
							<div id="searchUI">
								<nav class="nav-search d-lg-flex input-search table-nav ms-1">
									<div class="custom-select">
										<form:select path="condition.searchType">
											<form:option value="" label="전체" />
											<form:option value="" label="전체" />
											<form:option value="no" label="출금번호" />
											<form:option value="buyerName" label="거래처명" />
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
											<th>출금일자</th>
											<th>출금번호</th>
											<th>입고번호</th>
											<th>거래처명</th>
											<th>계좌</th>
											<th>계좌번호</th>
											<th>금액</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty withdrawalList }">
												<c:forEach items="${withdrawalList }" var="withdrawal">
													<tr>
														<td>${withdrawal.withdrawalDate }</td>
														<td>
															<c:url value="/withdrawal/withdrawalDetail.do" var="withDetailUrl">
																<c:param name="what" value="${withdrawal.withdrawalEnter }" />
															</c:url> <a href="${withDetailUrl }">${withdrawal.withdrawalNo } </a>
														</td>
														<td>
															<c:url value="/enter/enterList.do" var="enterUrl">
															</c:url> <a href="${enterUrl }">${withdrawal.withdrawalEnter } </a>
														</td>
														<td class="td-text">${withdrawal.withdrawalBuyername }</td>
														<td class="td-text">${withdrawal.withdrawalBank }</td>
														<td>${withdrawal.withdrawalBankno }</td>
														<td class="price">${withdrawal.withdrawalTotal }원</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<td colspan="6">출금내역 없음.</td>
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
