<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class="container">
				<div class="page-inner">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="card">
								<div class="page-header">
									<h3 class="fw-bold mb-3">거래처 상세정보</h3>
									<ul class="breadcrumbs mb-3">
										<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
										<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
										<li class="nav-item"><a href="${cPath }/buyer/buyerList.do">거래처 목록</a></li>
										<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
										<li class="nav-item"><a href="#">거래처 상세정보</a></li>
									</ul>
								</div>
								<div class="table-top-box right-side">
									<nav class="button-box table-nav">
										<c:url value="/buyer/buyerUpdate.do" var="updateUrl">
												<c:param name="what" value="${buyer.buyerId }" />
											</c:url>
											<a href="${updateUrl }"class="btn btn-primary"><i
												class="fa-regular fa-pen-to-square"></i>수정</a>
												
											<c:url value="/buyer/buyerDelete.do" var="deleteUrl">
												<c:param name="what" value="${buyer.buyerId }" />
											</c:url>
											<a href="${deleteUrl }"class="btn btn-primary" onclick="return confirm('정말 삭제하시겠습니까?');">
											<i class="fa-regular fa-circle-xmark"></i>삭제</a>
										<a href="${cPath }/buyer/buyerList.do" class="btn btn-primary">취소</a>
									</nav>
								</div>
								<div class="page-body">
									<div class="m-table-outer">
										<div class="m-table-inner">
											<table class="table table-bordered">
												<tr>
													<th>제조사명</th>
													<td class="td-text">${buyer.buyerName}</td>
												</tr>
												<tr>
													<th>분류</th>
													<td class="td-text">${buyer.lprod.lprodNm }</td>
												</tr>
												<tr>
													<th>은행명</th>
													<td class="td-text">${buyer.buyerBank}</td>
												</tr>
												<tr>
													<th>계좌번호</th>
													<td class="td-text">${buyer.buyerBankno}</td>
												</tr>
												<tr>
													<th>계좌주</th>
													<td class="td-text">${buyer.buyerBankname}</td>
												</tr>
												<tr>
													<th>우편번호</th>
													<td class="td-text">${buyer.buyerZip}</td>
												</tr>
												<tr>
													<th>주소1</th>
													<td class="td-text">${buyer.buyerAdd1}</td>
												</tr>
												<tr>
													<th>주소2</th>
													<td class="td-text">${buyer.buyerAdd2}</td>
												</tr>
												<tr>
													<th>연락처</th>
													<td class="td-text">${buyer.buyerComtel}</td>
												</tr>
												<tr>
													<th>팩스번호</th>
													<td class="td-text">${buyer.buyerFax}</td>
												</tr>
												<tr>
													<th>이메일</th>
													<td class="td-text">${buyer.buyerMail}</td>
												</tr>
												<tr>
													<th>담당자</th>
													<td class="td-text">${buyer.buyerCharger}</td>
												</tr>
												<tr>
													<th>거래품목</th>
													<td>
														<table class="table table-bordered">
															<thead class="table table-bordered">
																<tr>
																	<th>상품명</th>
																	<th>구매가</th>
																</tr>
															</thead>
															<tbody>
																<c:set var="prodList" value="${buyer.prodList }" />
																<c:if test="${not empty prodList }">
																	<c:forEach items="${prodList }" var="prod">
																		<tr>
																			<td><c:url value="/prod/prodDetail.do"
																					var="detailUrl">
																					<c:param name="what" value="${prod.prodId }" />
																				</c:url> <a href="${detailUrl }">${prod.prodName }</a></td>
																			<td class="price">${prod.prodPrice }</td>
																		</tr>
																	</c:forEach>
																</c:if>
																<c:if test="${empty prodList }">
																	<tr>
																		<td colspan="3">거래 품목 없음.</td>
																	</tr>
																</c:if>
															</tbody>
														</table>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>