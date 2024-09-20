<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">Forecasting</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item">Forecasting</li>
						</ul>
					</div>
					<div class="table-top-box side">
						<div class="right">
							<div id="searchUI">
								<nav class="nav-search d-lg-flex input-search table-nav ms-1">
								</nav>
							</div>

<!-- 							<div> -->
<!-- 								<a style="font-size: 20px; padding-right: 30px;">스탠다드:50</a> -->
<!-- 								<a style="font-size: 20px; padding-right: 30px;">슈페리어:50</a> -->
<!-- 								<a style="font-size: 20px; padding-right: 30px;">디럭스:39</a> -->
<!-- 							</div> -->
						</div>
					</div>



					<nav class="button-box table-nav">
<!-- 						<div> -->
<!-- 							<div id=""> -->
<!-- 								<p class="p1" style="display: inline-block; padding-right: 30px;"> -->
<!-- 									스탠다드룸 : 344 -->
<!-- 								</p> -->
<!-- 								<p class="p1" style="display: inline-block; padding-right: 30px;"> -->
<!-- 									슈페리어룸 : 34343 -->
<!-- 								</p> -->
<!-- 								<p class="p1" style="display: inline-block; padding-right: 30px;"> -->
<!-- 									디럭스룸 :3434 -->
<!-- 								</p> -->
<!-- 								<p class="p1" style="display: inline-block; padding-right: 30px;"> -->
<!-- 									이그제큐티브룸 : 4666 -->
<!-- 								</p> -->
<!-- 								<p class="p1" style="display: inline-block;"> -->
<!-- 									스위트룸 : 1231 -->
<!-- 								</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
						<div class="mt-2">
							<div class="d-flex justify-content-end align-items-center roommain">

								<div class="border-status-1" style="height: 25px; width: 25px; display: inline-block;"></div>
								<p style="display: inline-block; font-weight:bold"> 총 객실 수 :
								<div class="border-status-1" style="height: 25px; width: 25px; display: inline-block;"></div>
								<p style="display: inline-block;"> 스탠다드 : 50
								<div class="border-status-1" style="height: 25px; width: 25px; display: inline-block;"></div>
								<p style="display: inline-block;"> 슈페리어 : 50
								<div class="border-status-1" style="height: 25px; width: 25px; display: inline-block;"></div>
								<p style="display: inline-block;"> 디럭스 : 39
								<div class="border-status-1" style="height: 25px; width: 25px; display: inline-block;"></div>
								<p style="display: inline-block;"> 이그제큐티브 : 30
								<div class="border-status-1" style="height: 25px; width: 25px; display: inline-block;"></div>
								<p style="display: inline-block;"> 스위트 : 31
								<div class="border-status-1" style="height: 25px; width: 25px; display: inline-block;"></div>
								<p style="display: inline-block; font-weight:bold"> 합계 : 200
							</div>
						</div>

						</nav>

					<form method="get">
<!-- 						<table id="workshift-list-search-table"> -->
<!-- 							<tr> -->
<!-- 								<td><input type="date" name="startDate" id="startDate" class="form-control" required="required" /></td> -->
<!-- 								<td style="padding: 10px 0px;">~</td> -->
<!-- 								 <td><input type="date" name="endDate" id="endDate" class="form-control" required="required" /></td> -->
<!-- 								<td><button type="submit" id="searchBtn" class="btn btn-primary" >검색</button></td> -->
<!-- 							</tr> -->
<!-- 						</table> -->
							<div class="d-flex pay-date-box mb-2">
								<input type="date" name="startDate" id="startDate" class="form-control"
									value="${startDate }" style="width: 150px;" required="required" />
								<span class="ms-2 me-2">~</span>
								<input type="date" name="endDate" id="endDate" class="form-control"
									value="${endDate }" style="width: 150px;" required="required" />
								<button type="submit" id="searchBtn" class="btn btn-primary ms-2" >검색</button>
							</div>
					</form>

					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
<!-- 								<table class="table-header-fix table-input-in"> -->
<!-- 									<thead> -->
<!-- 										<tr> -->
<!-- 											<th></th> -->
<%-- 											<c:forEach items="${dayList }" var="day"> --%>
<%-- 												<th>${fn:substring(day.dateSeq, 5, 10) }</th> --%>
<%-- 											</c:forEach> --%>
<!-- 										</tr> -->
<!-- 									</thead> -->
<!-- 									<tbody> -->
<%-- 										<c:forEach items="${realDataList }" var="rdList"> --%>
<!-- 											<tr> -->
<%-- 												<td>${rdList.roomtypeNm }</td> --%>
<%-- 											<c:forEach items="${rdList.forecastingList}" var="foreCasting"> --%>
<%-- 												<td>${foreCasting.availableRooms }</td> --%>
<%-- 											</c:forEach> --%>
<!-- 											</tr> -->
<%-- 										</c:forEach> --%>
<!-- 											<tr> -->
<!-- 											<td>합계</td> -->
<%-- 											<c:forEach items="${totalList }" var="total" > --%>
<%-- 												<td>${total }</td> --%>
<%-- 											</c:forEach> --%>
<!-- 											</tr> -->

<!-- 									</tbody> -->
<!-- 								</table> -->
								<table>
								<thead>
										<tr>
											<th></th>
<%-- 											<c:forEach items="${dayList }" var="day"> --%>
												<c:forEach items="${dayList }" begin="0" end="14" var="day">
												<th>${fn:substring(day.dateSeq, 5, 10) }</th>
											</c:forEach>
										</tr>
									</thead>
									<tbody>
<%-- 										<c:forEach items="${gayongList }" var="gyList"> --%>
<!-- 											<tr> -->
<%-- 												<td>${gyList.roomtypeNm }</td> --%>
<%-- 											<c:forEach items="${gyList.forecastingList }" var="fcList"> --%>
<%-- 												<td>${fcList.availableRooms }</td> --%>
<%-- 											</c:forEach> --%>
<!-- 											</tr> -->
<%-- 										</c:forEach> --%>
										<c:forEach items="${realDataList }" var="rdList">
											<tr>
												<td>${rdList.roomtypeNm }</td>
											<c:forEach items="${rdList.forecastingList}" begin="0" end="14" step="1" var="foreCasting">
												<td>${foreCasting.availableRooms }</td>
											</c:forEach>
											</tr>
										</c:forEach>
											<tr>
											<td>합계</td>
<%-- 											<c:forEach items="${totalList }" var="total" > --%>
											<c:forEach items="${totalList }" begin="0" end="14" step="1"  var="total">
												<td>${total }</td>
											</c:forEach>
											</tr>

									</tbody>
								</table>
								<table>
								<thead>
										<tr>
											<th></th>
<%-- 											<c:forEach items="${dayList }" var="day"> --%>
												<c:forEach items="${dayList }" begin="15" end="30" var="day">
												<th>${fn:substring(day.dateSeq, 5, 10) }</th>
											</c:forEach>
										</tr>
									</thead>
									<tbody>
<%-- 										<c:forEach items="${gayongList }" var="gyList"> --%>
<!-- 											<tr> -->
<%-- 												<td>${gyList.roomtypeNm }</td> --%>
<%-- 											<c:forEach items="${gyList.forecastingList }" var="fcList"> --%>
<%-- 												<td>${fcList.availableRooms }</td> --%>
<%-- 											</c:forEach> --%>
<!-- 											</tr> -->
<%-- 										</c:forEach> --%>
										<c:forEach items="${realDataList }" var="rdList">
											<tr>
												<td>${rdList.roomtypeNm }</td>
											<c:forEach items="${rdList.forecastingList}" begin="15" end="30" step="1" var="foreCasting">
												<td>${foreCasting.availableRooms }</td>
											</c:forEach>
											</tr>
										</c:forEach>
											<tr>
											<td>합계</td>
<%-- 											<c:forEach items="${totalList }" var="total" > --%>
											<c:forEach items="${totalList }" begin="15" end="30" step="1"  var="total">
												<td>${total }</td>
											</c:forEach>
											</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="page-footer">
						<div class="paging paging-area">
							${pagingHTML }
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<script>
// const searchBtn = document.querySelector("#searchBtn");
// const startDate = document.querySelector("#startDate");
// const endDate = document.querySelector("#endDate");

// searchBtn.addEventListener('click', (e)=>{
// 	e.preventDefault();
// 	if(startDate.value == "" || endDate.value == "") {
// 		swal("퇴사일이 설정 되지 않았습니다", "", {
// 	         icon: "error",
// 	         buttons: {
// 	           confirm: {
// 	             className: "btn btn-danger",
// 	           },
// 	         },
// 	       });
// 	}else{

// 	}
// });

</script>













