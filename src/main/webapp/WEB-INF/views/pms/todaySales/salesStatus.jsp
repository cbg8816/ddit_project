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
						<h3 class="fw-bold mb-3">기타요금 발생현황</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">매출</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">기타요금 발생현황</a></li>
						</ul>
					</div>

					<div id="searchUI">
						<form:form modelAttribute="todayExtCondition" id="viewform">
							<table>
								<tr>
									<td>객실호수</td>
									<td><form:input path="roomId" class="form-control" /></td>
									<td>객실타입</td>
									<td>
										<div class="custom-select">
											<form:select path="roomtypeId">
												<form:option value="" label="타입선택" />
												<form:option value="" label="타입선택" />
												<c:forEach items="${roomTypeList }" var="rt">
													<form:option value="${rt.roomtypeId }"
														label="${rt.roomtypeNm }" />
												</c:forEach>
											</form:select>
										</div>
									</td>
									<td>고객명</td>
									<td><form:input path="memName" class="form-control" /></td>
									<td>결제일자</td>
									<td><input type="date" name="extcrgDate" value="${todayExtCondition.extcrgDate }" class="form-control" /></td>
									<td>서비스명</td>
									<td><form:input path="etNm" class="form-control" /></td>
									<td><button type="button" id="resetBtn" class="btn btn-primary" >초기화</button></td>
									<td><button type="button" id="searchBtn" class="btn btn-primary" >검색</button></td>
								</tr>
							</table>
						</form:form>
					</div>

					<form:form id="searchform" method="get" modelAttribute="todayExtCondition">
						<form:hidden path="roomId" />
						<form:hidden path="roomtypeId" />
						<form:hidden path="memName" />
						<form:hidden path="extcrgDate" />
						<form:hidden path="etNm" />
						<input type="hidden" name="page" />
					</form:form>

					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>객실 호수</th>
											<th>객실 등급</th>
											<th>투숙객 객 명</th>
											<th>투숙 인원</th>
											<th>투숙 기간</th>
											<th>요금 발생일시</th>
											<th>요금 내용</th>
											<th>단가(단위 : 원)</th>
											<th>수량</th>
											<th>총액(단위 : 원)</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty todaySalesList }">
											<c:forEach items="${todaySalesList }" var="todaySalesList">
												<tr>
													<td>${todaySalesList.roomId }</td>
													<td>${todaySalesList.roomtypeNm }</td>
													<td>${todaySalesList.memName }</td>
													<td>${todaySalesList.trevHeadcnt}</td>
													 <td>${todaySalesList.htrevChkin }
												 	~ ${todaySalesList.htrevChkout }</td>
												 	<td>${todaySalesList.extcrgDate }</td>
												 	<td>${todaySalesList.etNm }</td>
												 	<td class="price">${todaySalesList.extcrgPrice }</td>
												 	<td class="price">${todaySalesList.extcrgQty }</td>
												 	<td class="price">${todaySalesList.sumExtCharges }</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty todaySalesList }">
											<tr >
												<td colspan="9">기타 요금 발생 내역 없음</td>
											</tr>
										</c:if>
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
resetBtn.addEventListener("click", function(e){
	const vInps = viewform.querySelectorAll("input");
	const sInps = searchform.querySelectorAll("input");

	vInps.forEach((inp)=>{
		inp.value = "";
	});

	sInps.forEach((inp)=>{
		inp.value = "";
	});

	searchform.requestSubmit();
})
</script>