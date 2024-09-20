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
									<h3 class="fw-bold mb-3">거래처 등록</h3>
									<ul class="breadcrumbs mb-3">
										<li class="nav-home"><a href="#"> <i
												class="icon-home"></i>
										</a></li>
										<li class="separator"><i class="icon-arrow-right"></i></li>
										<li class="nav-item"><a href="#">Base</a></li>
										<li class="separator"><i class="icon-arrow-right"></i></li>
										<li class="nav-item"><a href="#">Avatars</a></li>
									</ul>
								</div>
								<div class="table-top-box">
									<nav class="button-box table-nav">
										<!-- <a href="#" class="btn btn-primary">결제선</a>
										<a href="#" class="btn btn-primary">결제</a>
										<a href="#" class="btn btn-primary">임시저장</a> -->
										<!-- <a href="#" class="btn btn-primary">저장</a>
										<a href="#" class="btn btn-primary">취소</a> -->
									</nav>
								</div>
								<div class="page-body">
									<div class="m-table-outer">
										<div class="m-table-inner">
											<c:url value="/prod/prodUpdate.do" var="updateUrl">
												<c:param name="what" value="${prod.prodId }" />
											</c:url>

											<form:form method="post" modelAttribute="buyer">
												<table class="table">
													<tr>
														<th>제조사명</th>
														<td><form:input path="buyerName" required="true"
																cssClass="form-control" /> <form:errors path="buyerName"
																cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>분류코드</th>
														<td><select name="buyerLgu" required>
																<option value>분류선택</option>
																<c:forEach items="${lprodList }" var="lprod">
																	<option label="${lprod.lprodNm }"
																		value="${lprod.lprodGu }"
																		${lprod.lprodGu eq buyer.buyerLgu ? "selected" : "" } />
																</c:forEach>
														</select> <form:errors path="buyerLgu" cssClass="text-danger"
																element="span" /></td>
													</tr>
													<tr>
														<th>은행명</th>
														<td><form:input path="buyerBank" required="true"
																cssClass="form-control" /> <form:errors path="buyerBank"
																cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>계좌번호</th>
														<td><form:input path="buyerBankno" required="true"
																cssClass="form-control" /> <form:errors
																path="buyerBankno" cssClass="text-danger" element="span" />
														</td>
													</tr>
													<tr>
														<th>계좌주</th>
														<td><form:input path="buyerBankname" required="true"
																cssClass="form-control" /> <form:errors
																path="buyerBankname" cssClass="text-danger"
																element="span" /></td>
													</tr>
													<tr>
														<th>우편번호</th>
														<td><form:input path="buyerZip" required="true"
																cssClass="form-control" /> <form:errors path="buyerZip"
																cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>주소1</th>
														<td><form:input path="buyerAdd1" required="true"
																cssClass="form-control" /> <form:errors path="buyerAdd1"
																cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>주소2</th>
														<td><form:input path="buyerAdd2" required="true"
																cssClass="form-control" /> <form:errors path="buyerAdd2"
																cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>연락처</th>
														<td><form:input path="buyerComtel" required="true"
																cssClass="form-control" /><span class="text-danger">${errors.buyerComtel }</span>
														</td>
													</tr>
													<tr>
														<th>팩스번호</th>
														<td><form:input path="buyerFax" required="true"
																cssClass="form-control" /> <form:errors path="buyerFax"
																cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>이메일</th>
														<td><form:input path="buyerMail" required="true"
																cssClass="form-control" /> <form:errors path="buyerMail"
																cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>담당자</th>
														<td><form:input path="buyerCharger" required="true"
																cssClass="form-control" /> <form:errors
																path="buyerCharger" cssClass="text-danger"
																element="span" /></td>
													</tr>
													<tr>
														<td colspan="2">
															<button type="submit"class="btn btn-primary"><iclass="fa-regular fa-paper-plane>전송</button>
															<button type="reset" class="btn btn-danger">취소</button> <a
															href="<c:url value='/buyer/buyerList.do'/>"
															class="btn btn-secondary">목록으로</a>
														</td>
													</tr>
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