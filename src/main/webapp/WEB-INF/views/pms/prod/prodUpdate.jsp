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
									<h3 class="fw-bold mb-3">재고정보 수정</h3>
									<ul class="breadcrumbs mb-3">
										<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
										<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
										<li class="nav-item"><a href="${cPath }/prod/prodList.do">재고 현황 리스트</a></li>
										<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
										<li class="nav-item"><a href="#">재고수정</a></li>
									</ul>
								</div>
								
								<div class="page-body">
									<div class="m-table-outer">
										<div class="m-table-inner">
											<c:url value="/prod/prodUpdate.do" var="updateUrl">
												<c:param name="what" value="${prod.prodId }" />
											</c:url>
											
											<form:form method="post" modelAttribute="prod"
												enctype="multipart/form-data">
												<div class="table-top-box right-side">
									<nav class="button-box table-nav">
									<button type="submit"class="btn btn-primary"><iclass="fa-regular fa-paper-plane>확인</button>
										<a href="${cPath }/prod/prodList.do" class="btn btn-primary">취소</a>
									</nav>
								</div>
												<form:hidden path="prodId" />
												<table class="table-header-fix table-input-in">
													<tr>
														<th>상품명</th>
														<td><form:input type="text" path="prodName"
																class="form-control" required="required" /> <form:errors
																path="prodName" cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>분류코드</th>
														<td><form:select path="prodLgu" required="required"
																class="form-control">
																<form:option value="" label="분류선택" />
																<c:forEach items="${lprodList }" var="lprod">
																	<form:option value="${lprod.lprodGu }"
																		label="${lprod.lprodNm }" />
																</c:forEach>
															</form:select> <form:errors path="prodLgu" cssClass="text-danger"
																element="span" /></td>
													</tr>
													<tr>
														<th>제조사코드</th>
														<td><form:select path="prodBuyer"
																class="form-control" required="required">
																<form:option value="" label="제조사선택" />
																<c:forEach items="${lprodList }" var="lprod">
																	<c:forEach items="${lprod.buyerList }" var="buyer">
																		<form:option value="${buyer.buyerId }"
																			label="${buyer.buyerName }" />
																	</c:forEach>
																</c:forEach>
															</form:select> <form:errors path="prodBuyer" cssClass="text-danger"
																element="span" /></td>
													</tr>
													<tr>
														<th>구매가</th>
														<td><form:input type="number" path="prodPrice"
																class="form-control" required="required" /> <form:errors
																path="prodPrice" cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>요약정보</th>
														<td><form:input type="text" path="prodOutline"
																class="form-control" required="required" /> <form:errors
																path="prodOutline" cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>상세정보</th>
														<td><form:textarea path="prodDetail"
																class="form-control" /> <form:errors path="prodDetail"
																cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>총재고</th>
														<td><form:input type="number" path="prodTotalstock"
																class="form-control" required="required" /> <form:errors
																path="prodTotalstock" cssClass="text-danger"
																element="span" /></td>
													</tr>
													<tr>
														<th>적정재고</th>
														<td><form:input type="number" path="prodProperstock"
																class="form-control" required="required" /> <form:errors
																path="prodProperstock" cssClass="text-danger"
																element="span" /></td>
												</table>
											</form:form>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>