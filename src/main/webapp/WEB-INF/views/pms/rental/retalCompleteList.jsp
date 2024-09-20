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
						<h3 class="fw-bold mb-3">대여물품 리스트</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="/pms/index.do"><i
							class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">하우스키핑</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="/pms/rental/rentalList.do">대여물품 리스트</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">반납완료 리스트</a></li>
						</ul>
					</div>
					<div class="status-view-box">
						<a href="/pms/rental/retalIncompleteList.do">대여중:${RetalIncompletecount}</a>
						<a href="/pms/rental/retalCompleteList.do">반납완료:${Retalcompletecount}</a>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<nav class="button-box table-nav">

						</nav>
						</nav>
						<div class="right">
							<nav class="nav-select-box">
								<div class="custom-select">
										<form:select path="condition.searchType">
											<option value>검색</option>
											<option value="0">룸번호</option>
											<option value="1">고객명</option>
											<option value="2">물품명</option>
											<option value="2">핸드폰번호</option>
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
											<th><input type="checkbox" id="checkAll" /></th>
											<th>No</th>
											<th>대여날짜</th>
											<th>룸번호</th>
											<th>입실날짜</th>
											<th>퇴실날짜</th>
											<th>고객명</th>
											<th>물품명</th>
											<th>수량</th>
											<th>핸드폰번호</th>
											<th>반납여부</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty RetalCompleteList }">
												<c:forEach items="${RetalCompleteList }" var="rental">
													<tr>
														<td><input type="checkbox" class="chk" value="${rental.hkrNo}" /></td>
                										<td id="${rental.hkrNo}">${rental.hkrNo}</td>
														<td>${rental.hkrDate } </td>
														<td>${rental.hkrRoom }호</td>
														<td>${rental.hkrCheckin } </td>
														<td>${rental.hkrCheckout } </td>
														<td><a href="#detail" class="test"
															data-bs-toggle="modal" data-bs-target="#detail"
															data-hkrNo="${rental.hkrNo}"
															data-hkrDate="${rental.hkrDate}"
															data-hkrRoom="${rental.hkrRoom}"
															data-hkrCheckin="${rental.hkrCheckin}"
															data-hkrCheckout="${rental.hkrCheckout}"
															data-hkrCostomer="${rental.hkrCostomer}"
															data-hkrKind="${rental.hkrKind}"
															data-hkrQty="${rental.hkrQty}"
															data-hkrHp="${rental.hkrHp}"
															data-hkrReturn="${rental.hkrReturn}">
															${rental.hkrCostomer} </a></td>
														<td class="text-start">${rental.hkrKind }</td>
														<td>${rental.hkrQty }</td>
														<td class="text-start">${rental.hkrHp }</td>
														<td>${rental.hkrReturn }</td>
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
					<span class="fw-mediumbold">대여물품 상세</span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<tr>
						<th>대여번호</th>
						<td><input type="number" id="hkrNo" name="hkrNo"
							class="form-control" readonly /></td>
					</tr>
					<tr>
						<th>대여일</th>
						<td><input type="date" id="hkrDate" name="hkrDate"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>룸번호</th>
						<td><input type="text" id="hkrRoom" name="hkrRoom"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>입실일</th>
						<td><input type="text" id="hkrCheckin" name="hkrCheckin"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>퇴실일</th>
						<td><input type="text" id="hkrCheckout" name="hkrCheckout"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>고객명</th>
						<td><input type="text" id="hkrCostomer" name="hkrCostomer"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input type="text" id="hkrHp" name="hkrHp"
						class="form-control" /></td>
					</tr>
					<tr>
						<th>물품명</th>
						<td><input type="text" id="hkrKind" name="hkrKind"
							class="form-control" readonly/></td>
					</tr>
					<tr>
						<th>수량</th>
						<td><input type="text" id="hkrQty" name="hkrQty"
							class="form-control" readonly/></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer border-0">
				<button type="button" onclick="rentalUpdate()" id="updateButton" class="btn btn-primary">수정</button>
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
					<span class="fw-mediumbold">고장객실 등록</span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<tr>
						<th>대여일</th>
						<td><input type="date" id="hkrDateinsert" name="hkrDateinsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>룸번호</th>
						<td><input type="text" id="hkrRoominsert" name="hkrRoominsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>고객명</th>
						<td><input type="text" id="hkrCostomerinsert" name="hkrCostomerinsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>입실일</th>
						<td><input type="text" id="hkrCheckininsert" name="hkrCheckininsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>퇴실일</th>
						<td><input type="text" id="hkrCheckoutinsert" name="hkrCheckoutinsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input type="text" id="hkrHpinsert" name="hkrHpinsert"
						class="form-control" /></td>
					</tr>
					<tr>
						<th>물품명</th>
						<td>
							<select id="renprodName" name="renprodName" class="form-control">
								<option value="">-선택-</option>
								<c:forEach items="${renprodList }" var="rentalprod">
									<option value="${rentalprod.renprodName }">${rentalprod.renprodName } => 현재수량 :${rentalprod.renprodQty} </option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>수량</th>
						<td><input type="number" id="hkrQtyinsert" name="hkrQtyinsert"
							 class="form-control" style="width:50%" /></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer border-0">
				<button type="button" onclick="rentalInsert()" id="insertButton" class="btn btn-primary" data-bs-dismiss="modal">등록</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>


<script src="${cPath }/resources/js/pms/rentaldetail.js" ></script>
