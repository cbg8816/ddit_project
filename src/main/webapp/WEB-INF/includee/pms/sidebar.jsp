<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="sidebar" data-background-color="dark">
	<div class="sidebar-logo">
		<!-- Logo Header -->
		<div class="logo-header" data-background-color="dark" id="hotelName">
	 		<a href="${cPath }/index.do" class="logo">
				<img src="${cPath }/resources/images/hotel_logo_white.png" height="20" />
			</a>
			<div class="nav-toggle">
				<button class="btn btn-toggle toggle-sidebar">
					<i class="gg-menu-right"></i>
				</button>
				<button class="btn btn-toggle sidenav-toggler">
					<i class="gg-menu-left"></i>
				</button>
			</div>
			<button class="topbar-toggler more">
				<i class="gg-more-vertical-alt"></i>
			</button>
		</div>
		<!-- End Logo Header -->
	</div>
	<%--         <p>Request URI: ${pageContext.request.requestURI}</p> --%>
	<%--         <c:if test="${fn:contains(pageContext.request.requestURI, 'empmypage')}"> --%>
	<%--         </c:if> --%>
	<div class="sidebar-wrapper scrollbar scrollbar-inner">
		<div class="sidebar-content">
			<ul class="nav nav-secondary">
				<li class="nav-section"><span class="sidebar-mini-icon">
						<i class="fa fa-ellipsis-h"></i>
				</span>
					<h4 class="text-section">Components</h4></li>

				<li class="nav-item"><a href="${cPath }/workInRev/formUI.do">
						<i class="fa-solid fa-person-shelter"></i>
						<p>입실등록관리</p>
				</a></li>
				<li class="nav-item"><a href="${cPath }/hotelrev/hotelRevList.do">
				<i class="fa-solid fa-bed"></i>
						<p>예약관리</p></span>
				</a></li>
<!-- 					<div class="collapse" id="checkout"> -->
<!-- 						<ul class="nav nav-collapse"> -->
<%-- 							<li><a href="${cPath }/hotelrev/hotelRevList.do"> <span --%>
<!-- 									class="sub-item">객실예약조회</span> -->
<!-- 							</a></li> -->
<%-- 							<li><a href="${cPath }/revroom/useRoomList.do"> <span --%>
<!-- 									class="sub-item">재실내역조회</span> -->
<!-- 							</a></li> -->
<%-- 							<li><a href="${cPath }/dinrev/dinRevList.do"> <span --%>
<!-- 									class="sub-item">다이닝예약조회</span> -->
<!-- 							</a></li> -->
<!-- 						</ul> -->
<!-- 					</div></li> -->
				<li class="nav-item"><a href="${cPath }/forecasting/forecasting.do">
					<i class="fa-solid fa-chart-pie"></i>
						<p>forecasting</p>
				</a></li>
				<li class="nav-item"><a href="${cPath }/checkout/list.do">
						<i class="fa-solid fa-arrow-right-from-bracket"></i>
						<p>퇴실/정산</p>
				</a></li>
				<li class="nav-item"><a href="${cPath}/roommaintenance/roomList.do">
						<i class="fa-solid fa-list-check"></i>
						<p>객실정비조회</p>
				</a></li>
				<li class="nav-item"><a data-bs-toggle="collapse"
					href="#forecasting"> <i class="fa-solid fa-broom"></i>
						<p>하우스키핑</p> <span class="caret"></span>
				</a>
					<div class="collapse" id="forecasting">
						<ul class="nav nav-collapse">
							<li><a href="${cPath }/housekeeping/keepingList.do"> <span
									class="sub-item">하우스키핑 로그 기록</span>
							</a></li>
							<li><a href="${cPath }/brokenroom/brokenList.do"> <span
									class="sub-item">고장객실(하자)관리</span>
							</a></li>
							<li><a href="${cPath }/rental/rentalList.do"> <span class="sub-item">대여물품관리</span>
							</a></li>
							<li><a href="${cPath }/lostitem/lostitemList.do"> <span
									class="sub-item">보관 및 분실물관리</span>
							</a></li>
						</ul>
					</div></li>
				<li class="nav-item"><a data-bs-toggle="collapse"
					href="#workShift"> <i class="fa-solid fa-clock"></i>
						<p>근무표</p> <span class="caret"></span>
				</a>
					<div class="collapse" id="workShift">
						<ul class="nav nav-collapse">
							<li><a href="${cPath }/workshift/workshiftList.do"> <span
									class="sub-item">근무표리스트</span>
							</a></li>
							<li><a href="${cPath }/workshift/workshiftInsert"> <span
									class="sub-item">근무표 등록/수정</span>
							</a></li>
<%-- 							<li><a href="${cPath }/workshift/workshiftInsert"> <span --%>
<!-- 									class="sub-item">근무표등록</span> -->
<!-- 							</a></li> -->
						</ul>
					</div></li>
				<li class="nav-item"><a data-bs-toggle="collapse"
					href="#arrive"> <i class="fa-solid fa-box"></i>
						<p>자산</p> <span class="caret"></span>
				</a>
					<div class="collapse" id="arrive">
						<ul class="nav nav-collapse">
							<li><a href="${cPath }/buyer/buyerList.do"> <span
									class="sub-item">거래처</span>
							</a></li>
							<li><a href="${cPath }/prod/prodList.do"> <span
									class="sub-item">재고</span>
							</a></li>
							<li><a href="${cPath }/orders/ordersList.do"> <span
									class="sub-item">발주</span>
							</a></li>
							<li><a href="${cPath }/enter/enterList.do"> <span
									class="sub-item">입고</span>
							</a></li>
							<li><a href="${cPath }/withdrawal/withdrawalList.do"> <span
									class="sub-item">출금</span>
							</a></li>
						</ul>
					</div></li>
					<li class="nav-item"><a data-bs-toggle="collapse"
					href="#cleaning"> <i class="fa-solid fa-dollar-sign"></i>
						<p>매출</p> <span class="caret"></span>
				</a>
					<div class="collapse" id="cleaning">
						<ul class="nav nav-collapse">
							<li><a href="${cPath }/todayReport/todayReport.do"> <span
									class="sub-item">일일 매출 보고서</span>
							</a></li>
							<li><a href="${cPath }/payment/roomCharge.do"> <span
									class="sub-item">객실타입별 매출</span>
							</a></li>
							<li><a href="${cPath }/todaySales/salesStatus.do"> <span
									class="sub-item">기타요금발생현황</span>
							</a></li>
						</ul>
					</div></li>
<%-- 				<li class="nav-item"><a href="${cPath }/budget/budgetList.do"> --%>
<!-- 					<i class="fa-solid fa-chart-pie"></i> -->
<!-- 						<p>예산</p> -->
<!-- 				</a></li> -->
				<li class="nav-item"><a data-bs-toggle="collapse"
					href="#situation"> <i class="fa-solid fa-address-card"></i>
						<p>인사</p> <span class="caret"></span>
				</a>
					<div class="collapse" id="situation">
						<ul class="nav nav-collapse">
							<li><a href="${cPath }/emp/empList.do"> <span
									class="sub-item">사원관리</span>
							</a></li>
							<li><a href="${cPath }/paystub/paystubList.do"> <span
									class="sub-item">급여관리</span>
							</a></li>
							<li><a href="${cPath }/attencance/attencanceList.do"> <span
									class="sub-item">근태관리</span>
							</a></li>
							<li><a
								href="${cPath }/organizationalChart/organizationalChartList.do">
									<span class="sub-item">주소록</span>
							</a></li>
						</ul>
					</div></li>
			</ul>
		</div>
	</div>
</div>