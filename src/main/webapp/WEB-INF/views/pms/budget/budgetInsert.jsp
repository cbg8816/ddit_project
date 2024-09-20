<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">예산안 작성</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리 리스트</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<a href="<c:url value='/emp/empInsert.do' />" class="btn btn-primary"><i class="fa-solid fa-bars"></i>등록</a>
						</nav>
						<div class="right">
							<div id="searchUI">
								<nav class="nav-search d-lg-flex input-search table-nav ms-1">
									<div class="custom-select">
										<select id="sel-form">
											<option value>선택</option>
											<option value="form1">월별 예산안 작성</option>
											<option value="form2">분기별 예산안 작성</option>
											<option value="form3">반기별 예산안 작성</option>
										</select>
									</div>
								</nav>
							</div>
						</div>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">

								<div class="d-flex justify-content-evenly">
									<div id="sheet-area">

									</div>
									<div>
										<form method="post">
											<table>
												<thead>
													<tr>
														<th>구분</th>
														<th>프론트</th>
														<th>하우스키핑</th>
														<th>자산</th>
														<th>인사</th>
														<th>운영관리</th>
														<th>전체</th>
													</tr>
												</thead>
												<tbody id="form-area">

												</tbody>
											</table>
										</form>
									</div>
								</div>


							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath }/resources/js/pms/budget/budgetUpdate.js"></script>