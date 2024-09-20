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
						<h3 class="fw-bold mb-3">하우스키핑 리스트</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="/pms/index.do"><i
							class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">하우스키핑</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="/pms/housekeeping/keepingList.do">하우스키핑 로그</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">정비완료 리스트</a></li>
						</ul>
					</div>
					<div class="status-view-box">
						<a href="/pms/housekeeping/keepingIncompleteList.do">정비중:${keepingIncompletecount}</a>
						<a href="/pms/housekeeping/keepingCompleteList.do">정비완료:${keepingcompletecount}</a>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
						</nav>
						<div class="right">
							<nav class="nav-select-box">
								<div class="custom-select">
										<form:select path="condition.searchType">
											<option value>검색</option>
											<option value="0">룸번호</option>
											<option value="1">룸상태</option>
											<option value="2">날짜</option>
											<option value="3">비고</option>
											<option value="4">담당자</option>
										</form:select>
								</div>
							</nav>
							<nav class="nav-search d-lg-flex input-search table-nav ms-1">
								<div class="input-group">
									<input type="text" placeholder="Search..." class="form-control">
									<div class="input-group-prepend">
										<button type="submit" class="btn btn-search pe-1">
											<i class="fa fa-search search-icon"></i>
										</button>
									</div>
								</div>
							</nav>
						</div>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>No</th>
											<th>배정날짜</th>
											<th>룸번호</th>
											<th>룸위치</th>
											<th>담당자</th>
											<th>룸상태</th>
											<th>비고</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty KeepingCompleteList }">
												<c:forEach items="${KeepingCompleteList }" var="keeping">
													<tr>
														<td id="${keeping.hkpNo }">${keeping.hkpNo }</td>
														<td>${keeping.hkpDay } </td>
														<td><a href="#detail" class="detail" data-bs-toggle="modal"
														data-bs-target="#detail"
														data-detail-url="/housekeeping/keepingDetail.do?what=${keeping.hkpNo}"
														>${keeping.hkpRoom }</a>
														</td>
														<td>${keeping.hkpLocation }</td>
														<td>${keeping.hkpManager }</td>
														<td>${keeping.hkpStatus }</td>
														<td>${keeping.hkpNote }</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="7">상품 없음.</td>
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
				<form:form id="searchform" method="get" modelAttribute="condition">
					<input type="hidden" name="page" />
				</form:form>
			</div>
		</div>
	</div>
</div>


<!-- Modal detail부분	 -->
<div class="modal fade" id="detail" tabindex="-1" data-bs-backdrop="#"
	data-bs-keyboard="false" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">
					<span class="fw-mediumbold">하우스키핑로그 상세</span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">

					<tr>
						<th>키핑번호</th>
						<td><input type="number" id="hkpNo" name="hkpNo"
							value="${HousekeepingVO.hkpNo }" class="form-control" readonly /></td>
					</tr>
					<tr>
						<th>배정날짜</th>
						<td><input type="text" id="hkpDay" name="hkpDay"
							class="form-control" readonly /></td>
					</tr>
					<tr>
						<th>룸번호</th>
						<td><input type="text" id="hkpRoom" name="hkpRoom"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>룸위치</th>
						<td><input type="text" id="hkpLocation" name="hkpLocation"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>담당자</th>
						<td><input type="text" id="hkpManager" name="hkpManager"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>룸상태</th>
						<td><input type="text" id="hkpStatus" name="hkpStatus"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>비고</th>
						<td><textarea id="hkpNote" name="hkpNote"
								class="form-control"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer border-0">
				<button type="button" onclick="updatekeeping()" id="updateButton" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<script src="${cPath }/resources/js/pms/keepingdetail.js" ></script>
