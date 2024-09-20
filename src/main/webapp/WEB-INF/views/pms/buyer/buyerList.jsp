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
						<h3 class="fw-bold mb-3">거래처 목록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">거래처 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">거래처 목록</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<a href="<c:url value='/buyer/buyerInsert.do'/>"
								class="btn btn-primary"><i class="fa-solid fa-bars"></i>등록</a>
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
											<form:option value="name" label="제조사명" />
											<form:option value="lgu" label="분류명" />
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
											<th>제조사아이디</th>
											<th>분류명</th>
											<th>제조사이름</th>
											<th>지역1</th>
											<th>담당자명</th>
											<th>연락처</th>
											<th>거래품목수</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty bList }">
												<c:forEach items="${bList }" var="buyer">
													<tr>
														<td>${buyer.buyerId }</td>
														<td class="td-text">${buyer.lprod.lprodNm }</td>
														<td class="td-text"><c:url value="/buyer/buyerDetail.do"
																var="buyerDetailUrl">
																<c:param name="what" value="${buyer.buyerId }" />
															</c:url> <a href="${buyerDetailUrl }">${buyer.buyerName }</a></td>
														<td class="td-text">${buyer.buyerAdd1 }</td>
														<td>${buyer.buyerCharger }</td>
														<td>${buyer.buyerComtel }</td>
														<td>${buyer.prodCount }</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="7">해당하는 거래처 없음.</td>
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