<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">일일 매출 보고서</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">매출</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">일일 매출 보고서</a></li>
						</ul>
					</div>
					<div id="searchUI">
						<form method="post" id="formarea">
							<div class="d-flex justify-content-end mb-3">
								<input type="date" name="today" value="${today }" class="form-control" style="width: 150px" />
								<button type="submit" class="btn btn-primary ms-2">변경</button>
							</div>
						</form>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in"  id="tbl-area">
									<tr>
										<td colspan="10" class="sub-title">1. 객실 판매실적</td>
									</tr>

									<tr>
										<td rowspan="2">구분</td>
										<td colspan="3">금일실적</td>
										<td colspan="3">월누계</td>
										<td colspan="3">년누계</td>
									</tr>

									<tr>
										<td>전년(단위 : 원)</td>
										<td>금년(단위 : 원)</td>
										<td>전년대비(단위 : %)</td>
										<td>전년(단위 : 원)</td>
										<td>금년(단위 : 원)</td>
										<td>전년대비(단위 : %)</td>
										<td>전년(단위 : 원)</td>
										<td>금년(단위 : 원)</td>
										<td>전년대비(단위 : %)</td>
									</tr>

									<tr>
										<td>객실</td>
										<td class="price">${room.lastYearDayRoom }</td>
										<td class="price">${room.dayRoom }</td>
										<td class="price">${room.dayRate }</td>
										<td class="price">${room.lastYearMonthRoom }</td>
										<td class="price">${room.monthRoom }</td>
										<td class="price">${room.monthRate }</td>
										<td class="price">${room.lastYearRoom }</td>
										<td class="price">${room.yearRoom }</td>
										<td class="price">${room.yearRate }</td>
									</tr>
									<tr>
										<td>매출</td>
										<td class="price">${room.lastDaySum }</td>
										<td class="price">${room.daySum }</td>
										<td class="price">${room.dayExtRate }</td>
										<td class="price">${room.lastMonthSum }</td>
										<td class="price">${room.monthSum }</td>
										<td class="price">${room.monthExtRate }</td>
										<td class="price">${room.lastYearSum }</td>
										<td class="price">${room.yearSum }</td>
										<td class="price">${room.yearExtRate }</td>
									</tr>

									<tr>
										<td colspan="10" class="sub-title">2. 일일객실 판매내역</td>
									</tr>

									<tr>
										<td></td>
										<td rowspan="5">판매내역</td>
										<td class="go-left">매출액</td>
										<td class="price">${payment.totalPay }</td>
										<td></td>
										<td></td>
										<td rowspan="5">자금수지</td>
										<td class="go-left">현금</td>
										<td class="price">${payment.payCash }</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td class="go-left">매출조정</td>
										<td class="price">${payment.discount }</td>
										<td></td>
										<td></td>
										<td class="go-left">카드</td>
										<td class="price">${payment.payCard }</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td class="go-left">실매출액</td>
										<td class="price">${payment.realPayment }</td>
										<td></td>
										<td></td>
										<td class="go-left">간편결제</td>
										<td class="price">${payment.payEasyPayment }</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td class="go-left">매출계</td>
										<td class="price">${payment.paymentResult }</td>
										<td></td>
										<td></td>
										<td class="go-left">인터넷 선결제</td>
										<td class="price">${payment.payInternet }</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>

									<tr>
										<td colspan="10" class="sub-title">3. 추가요금</td>
									</tr>

									<tr>
										<td colspan="2">구분</td>
										<c:if test="${not empty extList }">
											<c:forEach items="${extList }" var="ext">
												<td colspan="2">${ext.etNm }</td>
											</c:forEach>
										</c:if>
									</tr>

									<tr>
										<td colspan="2">수량</td>
										<c:if test="${not empty extList }">
											<c:forEach items="${extList }" var="ext">
												<td colspan="2" class="price">${ext.countExtPrice }</td>
											</c:forEach>
										</c:if>
									</tr>
									<tr>
										<td colspan="2">금액</td>
										<c:if test="${not empty extList }">
											<c:forEach items="${extList }" var="ext">
												<td colspan="2" class="price">${ext.sumExtPrice }</td>
											</c:forEach>
										</c:if>
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

<script src="${pageContext.request.contextPath }/resources/js/pms/todayReport/todayReport.js"></script>