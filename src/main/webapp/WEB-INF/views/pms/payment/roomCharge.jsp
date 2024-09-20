<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">객실타입별 매출</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">매출</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">객실별 매출</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<div class="left">
							<div id="searchUI">
								<nav class="nav-search d-lg-flex input-search table-nav ms-1">
									<div id="form-area">
										<div class="custom-select">
											<select id="condition">
												<option value="year">선택 연도별 비교</option>
												<option value="year">선택 연도별 비교</option>
												<option value="month-total">월별 전체객실 비교</option>
												<option value="month-room">월별 각 객실 비교</option>
											</select>
										</div>

										<div id="sel-double">
											<div class="custom-select d-inline-block ms-2">
												<select class="yearpicker">
													<option value="2023">2023</option>
													<option value="2024">2024</option>
													<option value="2023">2023</option>
													<option value="2022">2022</option>
													<option value="2021">2021</option>
													<option value="2020">2020</option>
													<option value="2019">2019</option>
													<option value="2018">2018</option>
												</select>
											</div>
											<div class="custom-select d-inline-block ms-2">
												<select class="yearpicker">
													<option value="2024">2024</option>
													<option value="2024">2024</option>
													<option value="2023">2023</option>
													<option value="2022">2022</option>
													<option value="2021">2021</option>
													<option value="2020">2020</option>
													<option value="2019">2019</option>
													<option value="2018">2018</option>
												</select>
											</div>
										</div>

										<div id="sel-single" class="custom-select ms-2">
											<select class="yearpicker-single">
												<option value="2024">2024</option>
												<option value="2024">2024</option>
												<option value="2023">2023</option>
												<option value="2022">2022</option>
												<option value="2021">2021</option>
												<option value="2020">2020</option>
												<option value="2019">2019</option>
												<option value="2018">2018</option>
											</select>
										</div>

										<form method="post" id="yearsForm" action="${cPath}/payment/roomCharge.do">
											<input type="hidden" name="firstYear" value="${lastYear }"/>
											<input type="hidden" name="secondYear" value="${nowYear }"/>
											<input type="hidden" name="singleYear" value="${nowYear }"/>
											<button type="submit" class="btn btn-primary ms-2">변경</button>
										</form>

									</div>
								</nav>
							</div>
						</div>
					</div>

					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<div id="chart-area">
									<canvas id="myChart" width="100%" height="30%"></canvas>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/pms/payment/roomCharge.js"></script>