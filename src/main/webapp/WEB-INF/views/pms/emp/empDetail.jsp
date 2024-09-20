<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">직원정보 상세보기</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원정보 상세보기</a></li>
						</ul>
					</div>
					<div class="table-top-box right-side">
						<nav class="button-box table-nav">
							<c:url value="/emp/empUpdate.do" var="updateUrl">
								<c:param name="what" value="${emp.empId }"></c:param>
							</c:url>
							<a href="${updateUrl }" class="btn btn-primary"><i class="fa-regular fa-pen-to-square"></i>수정</a>
							<a href="<c:url value='/emp/empList.do' />" class="btn btn-primary">목록</a>
						</nav>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table>
									<colgroup>
										<col width="20%" />
										<col width="" />
									</colgroup>
									<tr>
										<th>사번</th>
										<td>${emp.empId }</td>
									</tr>
									<tr>
										<th>이름</th>
										<td>${emp.empName }</td>
									</tr>
									<tr>
										<th>직책</th>
										<td>${emp.position.posiNm }</td>
									</tr>
									<tr>
										<th>부서</th>
										<td>${emp.department.depNm }</td>
									</tr>
									<tr>
										<th>입사일</th>
										<td>${emp.empHirdate }</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>${emp.empGen }</td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td>${emp.empTel }</td>
									</tr>
									<tr>
										<th>연봉</th>
										<td><fmt:formatNumber type="number" value="${emp.empSal }" />원</td>
									</tr>
									<tr>
										<th>퇴사여부</th>
										<td>
											<c:if test="${emp.empSta eq 'Y'}">
												재직중
											</c:if>
											<c:if test="${emp.empSta eq 'N'}">
												퇴사
											</c:if>
										</td>
									</tr>
									<tr>
										<th>퇴사일자</th>
										<td>${emp.empRes }</td>
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