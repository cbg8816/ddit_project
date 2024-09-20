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
						<h3 class="fw-bold mb-3">직원 근태 리스트</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 근태</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 근태 리스트</a></li>
						</ul>
					</div>
					<div class="table-top-box right-side">
						<div class="right">
						<div id="searchUI">
							<nav class="nav-search d-lg-flex input-search table-nav ms-1">
								<div class="custom-select">
										<form:select path="condition.searchType">
											<form:option value="" label="전체" />
											<form:option value="" label="전체" />
											<form:option value="name" label="사원이름" />
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
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>이름</th>
											<th>총연차</th>
											<th>남은연차</th>
											<th>사용연차</th>
											<th>상세보기</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty attList }">
												<c:forEach items="${attList }" var="attList">
													<tr>
														<td>${attList.emp.empName }</td>
														<td>${attList.atteAllAnLeave }</td>
														<td>${attList.atteLeftAnLeave }</td>
														<td>${attList.atteUseAnLeave }</td>
														<td>
															<c:url value="/attencance/attencanceDetail.do" var="attDetailUrl">
																<c:param name="what" value="${attList.atteId }"></c:param>
															</c:url>
															<button
																type="button"
																class="btn btn-primary"
																data-bs-toggle="modal"
																data-bs-target="#attModal"
																data-detail-url="${attDetailUrl }">상세보기</button>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="8">조회 된 데이터 없음</td>
												</tr>
											</c:otherwise>
										</c:choose>
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
					<form:form id="searchform" method="get" modelAttribute="condition">
						<form:hidden path="searchType"/>
						<form:hidden path="searchWord"/>
						<input type="hidden" name="page" />
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="attModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">
					<span class="fw-mediumbold"> 직원 근태 상세보기 </span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">확인</button>
			</div>
		</div>
	</div>
</div>



<script>
	document.addEventListener("DOMContentLoaded", ()=>{
	   const attModal = document.getElementById('attModal')
	   attModal.addEventListener('show.bs.modal', event => {
	      let modal = event.target;
	      let modalBody = modal.querySelector(".modal-body");
	      let aTag = event.relatedTarget;
	      let url = aTag.dataset.detailUrl;

	      FetchUtils.fetchForText(url, {
	         headers:{
	            "accept":"text/html"
	         }
	      }).then((html)=>modalBody.innerHTML=html)
	   })
	});


</script>