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
						<h3 class="fw-bold mb-3">결재요청문서</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#">
								<i class="fa-solid fa-house"></i>
							</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i>
							</li>
							<li class="nav-item"><a href="#">결재하기</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i>
							</li>
							<li class="nav-item"><a href="#">결재요청문서</a></li>
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
					<div class="page-body  collapsea">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>

											</th>
											<th>결재상태</th>
											<th>결재양식</th>
											<th>문서제목</th>
											<th>기안일</th>
											<th>완료일</th>
											<th>기안자</th>
											<th></th>

										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty boxList}">
												<c:forEach items="${boxList }" var="box">
													<tr>
														<td>

														</td>
														<td>
															<c:choose>
								                                <c:when test="${box.aprState eq '1'}">
												                    <span class="status-ongoing">진행중</span>
												                </c:when>
												                <c:when test="${box.aprState eq '2'}">
												                    <span class="status-completed">완료</span>
												                </c:when>
												                <c:when test="${box.aprState eq '3'}">
												                    <span class="status-rejected">반려</span>
												                </c:when>
												                <c:otherwise>
												                    <span class="status-unknown">알 수 없음</span>
												                </c:otherwise>
								                            </c:choose>
														</td>
														<td>${box.formvo.formTitle }</td>
														<td>
														<c:url value="/requestDetail.do" var="requestDetail">
															<c:param name="what" value="${box.aprId }"></c:param>
														</c:url>
														<a href="${requestDetail }" >${box.aprTitle}</a>
														</td>
														<td>${box.aprRegdate }</td>
														<td>${box.aprRegdate }</td>
														<td>${box.empvo.empName }</td>
														<td></td>
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


<script>
document.querySelectorAll('.collapsea a').forEach(link => {
    link.addEventListener('click', function (event) {
        event.preventDefault(); // 기본 링크 동작 방지

        const url = this.getAttribute('href'); // 링크의 href 속성값 가져오기

        // AJAX 요청
        fetch(url)
            .then(response => response.text())
            .then(data => {
                // 페이지의 특정 부분만 업데이트
                $('.page-inner .row').html(data);
                // 필요한 경우 새로 로드된 콘텐츠에 대해 추가 스크립트를 실행
            })
            .catch(error => console.error('Error:', error));
    });
});


</script>

