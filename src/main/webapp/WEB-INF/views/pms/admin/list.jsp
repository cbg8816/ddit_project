<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">관리자</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="${pageContext.request.contextPath }"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="${pageContext.request.contextPath }/admin">관리자</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav side">
						</nav>
						<div class="right">
							<nav class="nav-search d-lg-flex input-search table-nav ms-1">
								<div class="input-group ms-2">
										<input type="text" id="memName" class="form-control" placeholder="회원명"/>
										<div class="input-group-prepend">
											<input type="hidden" id="page" name="page"/>
											<button type="button" id="adminBtn" style="display: none"></button>
											<button class="btn btn-search pe-1" id="searchBtn">
												<i class="fa-solid fa-magnifying-glass"></i>
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
											<th>NO</th>
											<th>등급코드</th>
											<th>회원명</th>
											<th>회원고유ID</th>
											<th>전화번호</th>
											<th>이메일</th>
											<th>탈퇴여부</th>
										</tr>
									</thead>
									<tbody id="admin-body">
									</tbody>
								</table>
							</div>
							<div class="page-footer">
								<div id="admin-page" class="paging paging-area"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath }/resources/js/app/pms/admin/list.js"></script>