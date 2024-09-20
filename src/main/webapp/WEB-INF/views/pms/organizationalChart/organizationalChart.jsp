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
						<h3 class="fw-bold mb-3">주소록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">주소록</a></li>
						</ul>
					</div>
					<div class="table-top-box right-side">
						<div class="right">
							<div id="searchUI">
								<nav class="nav-search d-lg-flex input-search table-nav ms-1">
									<div class="custom-select ms-2">
										<form:select path="condition.searchType">
											<form:option value="" label="전체" />
											<form:option value="" label="전체" />
											<form:option value="name" label="사원이름" />
											<form:option value="dep" label="부서명" />
											<form:option value="posi" label="직급명" />
										</form:select>
									</div>
									<div class="input-group ms-2">
										<form:input path="condition.searchWord" cssClass="form-control" placeholder="이름,부서명,직급명" />
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
						<div class="emp-list">
							<div class="emp-list-grid">
								<c:choose>
									<c:when test="${not empty empList }">
										<c:forEach items="${empList }" var="empList">
											<c:url
												value="/organizationalChart/organizationalChartDetail.do"
												var="ordetailUrl">
												<c:param name="what" value="${empList.empId }"></c:param>
											</c:url>
											<div class="emp-box" data-bs-toggle="modal"
												data-bs-target="#empModal" data-detail-url="${ordetailUrl }">
												<div class="emp-image">
													<img
														src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
														width=100 />
												</div>
												<div class="emp-info">
													<div>
														<p>이름</p>
														<span class="line-before"></span>
														<p>${empList.empName }</p>
													</div>
													<div>
														<p>부서/직책</p>
														<span class="line-before"></span>
														<p>${empList.department.depNm }/${empList.position.posiNm }</p>
													</div>
													<div>
														<p>휴대전화</p>
														<span class="line-before"></span>
														<p>${empList.empTel }</p>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="8">조회 된 데이터 없음</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="empModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">
					<span class="fw-mediumbold"> 직원 정보 상세보기 </span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="padding: 2rem 5rem;">

			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">확인</button>
			</div>
		</div>
	</div>
</div>



<script>
	document.addEventListener("DOMContentLoaded", ()=>{
	   const empModal = document.getElementById('empModal')
	   empModal.addEventListener('show.bs.modal', event => {
	      let modal = event.target;
	      let modalBody = modal.querySelector(".modal-body");
	      let aTag = event.relatedTarget;
	      let url = aTag.dataset.detailUrl;
// 	      console.log(modal);
// 	      console.log(modalBody);
// 	      console.log(aTag);
// 	      console.log(url);
	      FetchUtils.fetchForText(url, {
	         headers:{
	            "accept":"text/html"
	         }
	      }).then((html)=>modalBody.innerHTML=html)
	   })
	});


</script>