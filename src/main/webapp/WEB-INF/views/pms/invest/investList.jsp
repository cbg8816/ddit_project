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
						<h3 class="fw-bold mb-3">기획 내역</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">기획 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">기획내역</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<a href="<c:url value='/invest/investInsert.do'/>"
								class="btn btn-primary"><i class="fa-solid fa-bars"></i>등록</a>
							<!-- <a href="#" class="btn btn-primary"><i
											class="fa-regular fa-pen-to-square"></i>수정</a>
											<a href="#" class="btn btn-primary"><i class="fa-regular fa-circle-xmark"></i>삭제</a> -->
						</nav>
						<div class="right">
							<nav class="nav-select-box">
								<div class="custom-select">
									<select>
										<option value>거래처검색</option>
										<option value="0">전체</option>
										<option value="1">분류명</option>
										<option value="2">제조사명</option>
									</select>
								</div>
							</nav>
							<nav class="nav-search d-lg-flex input-search table-nav ms-1">
								<div class="input-group">
									<input type="text" placeholder="Search..." class="form-control">
									<div class="input-group-prepend">
										<button type="submit" class="btn btn-search pe-1">
											<i class="fa fa-search search-icon"></i>
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
											<td><c:url value="/invest/investDetail.do" var="investDetailUrl">
												</c:url> <a href="${investDetailUrl }">기획번호</a>
											</td>
											<td>기획분류</td>
											<th>시작일</th>
											<th>종료일</th>
											<th>투자액</th>
											<th>진행상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>									
											<td>IV764158</td>
											<td>룸서비스</td>
											<td>2024/08/24</td>
											<td>2024/09/24</td>
											<td>2,000,000</td>
											<td>진행중</td>
										</tr>
										<tr>									
											<td>IV764159</td>
											<td>편의시설</td>
											<td>2024/08/24</td>
											<td>2024/09/24</td>
											<td>2,000,000</td>
											<td>진행중</td>
										</tr>
										<tr>									
											<td>IV764160</td>
											<td>룸리뉴얼</td>
											<td>2024/08/24</td>
											<td>2024/09/24</td>
											<td>2,000,000</td>
											<td>진행중</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="page-footer">
						<div class="paging paging-area">${pagingHTML }</div>
					</div>

				</div>
				<form:form id="searchform" method="get" modelAttribute="condition">
					<!-- 						<form:input path="searchType"/> -->
					<!-- 						<form:input path="searchWord"/> -->
					<input type="hidden" name="page" />
				</form:form>
			</div>
		</div>
	</div>
</div>