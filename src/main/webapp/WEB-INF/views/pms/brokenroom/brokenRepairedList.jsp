]\\<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">고장객실 리스트</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="/pms/index.do"><i
							class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">하우스키핑</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="/pms/brokenroom/brokenList.do">고장객실 리스트</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">객실수리예정 리스트</a></li>
						</ul>
					</div>
					<div class="status-view-box">
						<a href="/pms/brokenroom/brokenRepairedList.do">수리예정:${readRepairedcount}</a>
						<a href="/pms/brokenroom/brokenRepairingList.do">수리중:${readRepairingcount}</a>
						<a href="/pms/brokenroom/brokenRepairfinisList.do">수리완료:${readRepairfinishcount}</a>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<a href="#insert" class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#insert"
								data-insert-url="/brokenroom/brokenroomdInsert.do">등록</a>
						</nav>
						<div class="right">
							<nav class="nav-select-box">
								<div class="custom-select">
									<form:select path="condition.searchType">
										<option value>검색</option>
										<option value="0">등록날짜</option>
										<option value="1">습득장소</option>
										<option value="2">물품명</option>
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
											<th>고장번호</th>
											<th>룸번호</th>
											<th>위치</th>
											<th>등록날짜</th>
											<th>담당자</th>
											<th>고장내역</th>
											<th>수리여부</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty brokenRepairedList }">
												<c:forEach items="${brokenRepairedList }" var="broken">
													<tr>
														<td id="${broken.hkbNo }">${broken.hkbNo }</td>
														<td>${broken.roomId }</td>
														<td>${broken.hkbLocation }</td>
														<td>${broken.hkbDay }</td>
														<!-- 														<td><a href="#detail" class="test" data-bs-toggle="modal" -->
														<!-- 														data-bs-target="#detail" -->
														<!-- 														data-detail-url=/brokenroom/brokenroomDetail.do?what=${broken.hkbNo}" -->
														<%-- 														>${broken.hkbInfor }</a> --%>
														<!-- 														</td> -->
														<td>${broken.hkbEmp }</td>
														<td><a href="#detail" class="test"
															data-bs-toggle="modal" data-bs-target="#detail"
															data-hkbno="${broken.hkbNo}"
															data-roomid="${broken.roomId}"
															data-hkblocation="${broken.hkbLocation}"
															data-hkbday="${broken.hkbDay}"
															data-hkbinfor="${broken.hkbInfor}"
															data-hkbemp="${broken.hkbEmp}"
															data-hkbcomple="${broken.hkbComple}">
															${broken.hkbInfor} </a></td>
														<td>${broken.hkbComple }</td>
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
					<span class="fw-mediumbold">고장객실 상세정보</span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">

					<tr>
						<th>고장번호</th>
						<td><input type="number" id="hkbNo" name="hkbNo"
							value="${BrokenroomVO }" class="form-control" readonly /></td>
					</tr>
					<tr>
						<th>날짜</th>
						<td><input type="text" id="hkbDay" name="hkbDay"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>룸번호</th>
						<td><input type="text" id="roomId" name="roomId"
							class="form-control" /></td>
					</tr>

					<tr>
						<th>위치</th>
						<td><input type="text" id="hkbLocation" name="hkbLocation"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>담당자</th>
						<td><input type="text" id="hkbEmp" name="hkbEmp"
							class="form-control" /></td>
					</tr>

					<tr>
						<th>고장내역</th>
						<td><textarea id="hkbInfor" name="hkbInfor"
								class="form-control"></textarea></td>
					</tr>
					<tr>
						<th>수리여부</th>
						<td><input type="text" id="hkbComple" name="hkbComple"
							class="form-control" readonly/></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer border-0">
				<button type="button" onclick="updateButton()" id="updateButton" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">확인</button>
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
						<th>룸번호</th>
						<td><input type="text" id="roomIdinsert" name="roomIdinsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>날짜</th>
						<td><input type="text" id="hkbDayinsert" name="hkbDayinsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>위치</th>
						<td><input type="text" id="hkbLocationinsert" name="hkbLocationinsert"
							class="form-control" /></td>
					</tr>
						<th>고장내역</th>
						<td><textarea id="hkbInforinsert" name="hkbInforinsert"
								class="form-control"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer border-0">
				<button type="button" onclick="brokenInsert()" id="insertButton" class="btn btn-primary" data-bs-dismiss="modal">등록</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<script src="${cPath }/resources/js/pms/brokendetail.js"></script>
