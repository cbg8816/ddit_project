<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">반려문서함</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#">
								<i class="fa-solid fa-house"></i>
							</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i>
							</li>
							<li class="nav-item"><a href="#">문서함</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i>
							</li>
							<li class="nav-item"><a href="#">반려문서함</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">

						</nav>
						<div class="right">
							<div id="searchUI">
								<nav class="nav-search d-lg-flex input-search table-nav ms-1">
									<div class="custom-select">
										<form:select path="condition.searchType">
											<form:option value="" label="전체" />
											<form:option value="name" label="제목" />
											<form:option value="dep" label="작성자" />
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
					<form:form id="searchform" method="get" modelAttribute="condition">
						<form:hidden path="searchType"/>
						<form:hidden path="searchWord"/>
						<input type="hidden" name="page" />
					</form:form>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>
												<label class="input-container">
													<input type="checkbox" class="chk-all">
													<span class="checkmark"></span>
												</label>
											</th>
											<th>결재상태</th>
											<th>결재양식</th>
											<th>문서제목</th>
											<th>기안일</th>
											<th>완료일</th>
											<th>기안자</th>
											<th>문서번호</th>

										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty returnList}">
												<c:forEach items="${returnList }" var="returnlist">
													<tr>
														<td>
															<label class="input-container">
																<input type="checkbox" class="chk-one">
																<span class="checkmark"></span>
															</label>
														</td>
														<td><span class="status-rejected">반려</span></td>
														<td>${returnlist.formvo.formTitle }</td>
														<td>${returnlist.aprTitle }</td>
														<td>${returnlist.aprRegdate }</td>
														<td>${returnlist.aprRegdate }</td>
														<td>${returnlist.empvo.empName }</td>
													</tr>
												</c:forEach>
											</c:when>
											 <c:otherwise>
										      <tr>
										        <td colspan="8">데이터가 없습니다.</td>
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
				</div>
			</div>
		</div>
	</div>
</div>

