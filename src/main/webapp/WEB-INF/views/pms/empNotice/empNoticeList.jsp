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
						<h3 class="fw-bold mb-3">사내 공지사항</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">사내 공지사항</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">사내 공지사항 리스트</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<a href="<c:url value='/empNotice/empNoticeInsert.do' />" class="btn btn-primary"><i class="fa-solid fa-bars"></i>등록</a>
						</nav>
						<div class="right">
							<nav class="nav-search d-lg-flex input-search table-nav ms-1">
								<div class="input-group">
									<input type="text" placeholder="Search..." class="form-control">
									<div class="input-group-prepend">
										<button type="submit" class="btn btn-search pe-1">
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
											<th>제목</th>
<!-- 											<th>내용</th> -->
											<th>작성자</th>
											<th>첨부파일</th>
											<th>일시</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty empNoticeList }">
												<c:forEach items="${empNoticeList }" var="noticeList">
															<c:url value="/empNotice/empNoticeDetail.do" var="empNoticeDetailUrl">
																<c:param name="what" value="${noticeList.empnotiNo }"></c:param>
															</c:url>
													<tr class="pointer" onclick="location.href='${empNoticeDetailUrl }'">
														<td>${noticeList.empnotiTitle }</td>
<%-- 														<td class="td-text">${noticeList.empnotiContent }</td> --%>
														<td>${noticeList.emonotiWriter }</td>
														<td>${noticeList.empnotiFile }</td>
														<td>${noticeList.empnotiDate }</td>
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
<!-- 						<form:input path="searchType"/> -->
<!-- 						<form:input path="searchWord"/> -->
						<input type="hidden" name="page" />
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>