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
						<h3 class="fw-bold mb-3">분실물및보관 리스트</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="/pms/index.do"><i
							class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">하우스키핑</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="/pms/lostitem/lostitemList.do">분실및보관 리스트</a></li>
						</ul>
					</div>
					<div class="status-view-box">
						<a href="/pms/lostitem/lostitemIncompleteList.do">보관중 : ${LostitemIncompletecount}</a>
						<a href="/pms/lostitem/lostitemCompleteList.do">완료건 : ${Lostitemcompletecount}</a>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<a href="#insert" class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#insert">등록</a>
							<button id="updatelostitem" class="btn btn-primary" type="button">완료</button>
						</nav>
						<div class="right">
							<div id="searchUI">
								<nav class="nav-search d-lg-flex input-search table-nav ms-1">
									<div class="custom-select">
										<form:select path="condition.searchType">
											<form:option value="" label="전체" />
											<form:option value="PLACE" label="습득장소" />
											<form:option value="kind" label="물품명" />
											<form:option value="ACQUIRER" label="습득자" />
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
										<th><input type="checkbox" id="checkAll" /></th>
											<th style="display: none;">No</th>
											<th>등록날짜</th>
											<th>습득장소</th>
											<th>습득자</th>
											<th>물품명</th>
											<th>비고</th>
											<th>완료구분</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty lostitemList }">
												<c:forEach items="${lostitemList }" var="lostitem">
													<tr>
														<td><input type="checkbox" class="chk" value="${lostitem.hksNo}" /></td>
														<td style="display: none;" id="${lostitem.hksNo }">${lostitem.hksNo }</td>
														<td>${lostitem.hksDate }</td>
														<td class="text-start">${lostitem.hksPlace }</td>
														<td>${lostitem.hksAcquirer }</td>
														<td class="text-start"><a href="#detail" class="test"
															data-bs-toggle="modal" data-bs-target="#detail"
															data-hksno="${lostitem.hksNo}"
															data-hksDate="${lostitem.hksDate}"
															data-hksPlace="${lostitem.hksPlace}"
															data-hksAcquirer="${lostitem.hksAcquirer}"
															data-hksKind="${lostitem.hksKind}">
																${lostitem.hksKind}</a></td>
														<td class="text-start">${lostitem.hksNote }</td>
														<td>${lostitem.hksYn }</td>
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
					<span class="fw-mediumbold">보관물품 상세</span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<tr>
						<th>물품번호</th>
						<td><input type="number" id="hksNo" name="hksNo"
							 class="form-control" readonly /></td>
					</tr>
					<tr>
						<th>날짜</th>
						<td><input type="date" id="hksDate" name="hksDate"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>습득한곳</th>
						<td><input type="text" id="hksPlace" name="hksPlace"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>습득자</th>
						<td><input type="text" id="hksAcquirer" name="hksAcquirer"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>물품명</th>
						<td><input type="text" id="hksKind" name="hksKind"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>비고</th>
						<td><textarea id="hksNote" name="hksNote"
								class="form-control"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer border-0">
				<button type="button" onclick="updatelostitem()" id="updateButton" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal insert부분	 -->
<div class="modal fade" id="insert" tabindex="-1" data-bs-backdrop="#"
	data-bs-keyboard="false" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">
					<span class="fw-mediumbold">보관및분실물 등록</span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<tr>
						<th>등록날짜</th>
						<td><input type="date" id="hksDateinsert" name="hksDateinsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>습득장소</th>
						<td><input type="text" id="hksPlaceinsert" name="hksPlaceinsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>습득자</th>
						<td><input type="text" id="hksAcquirerinsert" name="hksAcquirerinsert"
							class="form-control" /></td>
					</tr>
					<tr>
					<th>물품명</th>
						<td><input type="text" id="hksKindinsert" name="hksKindinsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>비고</th>
						<td><textarea id="hksNoteinsert" name="hksNoteinsert"
								class="form-control"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer border-0">
			<button type="button" onclick="Autoinsert()" id="insertButton" class="btn btn-primary">자동입력</button>
				<button type="button" onclick="lostitemInsert()" id="insertButton" class="btn btn-primary" data-bs-dismiss="modal">등록</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<script src="${cPath }/resources/js/pms/lostitemDetail.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
