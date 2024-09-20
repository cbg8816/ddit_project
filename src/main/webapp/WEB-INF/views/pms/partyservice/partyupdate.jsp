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
						<h3 class="fw-bold mb-3">지금 페이지</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i
									class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">중분류</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">소분류</a></li>
						</ul>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<form method="post" >
									<div class="form-group notif-scroll scrollbar-outer">
										<input type="hidden" name="trevId"  value="${dinRev.trevId }"/>

											<table class="table-header-fix table-input-in">
												<tr>
													<th>예약번호</th>
													<td><input type="text" name="dinId"
														value="${dinRev.dinId }"
														class="form-control form-control" required="required" />
														<span class="text-danger">${errors.dinId }</span>
													</td>
													<td><input type="text" class="form-control form-control"
														value="${dinRev.trevSt}" readonly="readonly">
													</td>
												</tr>
												<tr>
													<th>통합예약상태</th>
													<td>
														<select name="trevSt">
															<option label="${dinRev.trevSt }" value="${dinRev.trevSt}">
															<option label="예약접수" value="RV" />
															<option label="예약확정" value="CF" />
															<option label="예약취소" value="CC" />
														</select>
													</td>
												</tr>
												<tr>
													<th>예약구분</th>
													<td><input type="text" name="trevRtype"
														class="form-control form-control"
														value="${dinRev.trevRtype}" readonly="readonly">
														<span class="text-danger">${errors.trevRtype }</span>
													</td>
												</tr>
												<tr>
													<th>다이닝타입</th>
													<td>
														<select name="dintypeId" required="required">
															<option value>타입선택</option>
															<c:forEach items="${dinTypeList }" var="dinType">
																<option label="${dinType.dintypeNm }" value="${dinType.dintypeId }"
																	${dinType.dintypeId eq dinRev.dintypeId ? "selected" : "" }
																 />
															</c:forEach>
														</select>
														<span class="text-danger">${errors.dintypeId }</span>
													</td>
												</tr>
												<tr>
													<th>고객명</th>
													<td><input type="text" name="memName"
														class="form-control form-control"
														value="${dinRev.memName}">
														<span class="text-danger">${errors.memName }</span>
													</td>
												</tr>
												<tr>
													<th>이용날짜</th>
													<td><input type="date" name="dinDate"
														value="${dinRev.dinDate }"
														class="form-control form-control" required="required" />
														<span class="text-danger">${errors.dinDate }</span>
													</td>
												</tr>
												<tr>
													<th>휴대폰</th>
													<td><input type="text" name="memTel"
														class="form-control form-control"
														value="${dinRev.memTel}">
													<span class="text-danger">${errors.memTel }</span>
													</td>
												<tr>
													<th>이메일</th>
													<td><input type="text" name="memEmail"
														class="form-control form-control"
														value="${dinRev.memEmail}">
														<span class="text-danger">${errors.memEmail }</span>
													</td>
												</tr>
												<tr>
													<th>성인수</th>
													<td><input type="number" name="trevAdult"
														class="form-control form-control"
														value="${dinRev.trevAdult}">
														<span class="text-danger">${errors.trevAdult }</span>
													</td>
												</tr>
												<tr>
													<th>아동수</th>
													<td><input type="number" name="trevChild"
														class="form-control form-control"
														value="${dinRev.trevChild}">
														<span class="text-danger">${errors.trevChild }</span>
													</td>
												</tr>
												<tr>
													<th>총금액</th>
													<td><input type="text" name="dinTprice"
														value="${dinRev.dinTprice }"
														class="form-control form-control" />
														<span class="text-danger">${errors.dinTprice }</span>
													</td>
												</tr>
												<tr>
													<th>예약내용</th>
													<td><input type="text" name="dinContent"
														value="${dinRev.dinContent }"
														class="form-control form-control" />
														<span class="text-danger">${errors.dinContent }</span>
													</td>
												</tr>
												<tr>
													<th>차량번호</th>
													<td><input type="text" name="trevCarno"
														class="form-control form-control"
														value="${dinRev.trevCarno}">
														<span class="text-danger">${errors.trevCarno }</span>
													</td>
												</tr>
												<tr>
													<th>예약일</th>
													<td><input type="date" name="trevDate" id="trevDate"
														class="form-control form-control"
														value="${dinRev.trevDate }" readonly="readonly">
														<span class="text-danger">${errors.trevDate }</span>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<button type="submit" class="btn btn-primary">전송</button>
													</td>
												</tr>
											</table>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





