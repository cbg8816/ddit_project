<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">재고상세정보</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i
									class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="${cPath }/prod/prodList.do">재고
									현황 리스트</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">재고상세정보</a></li>
						</ul>
					</div>
					<div class="table-top-box right-side">
						<nav class="button-box table-nav">
							<c:url value="/prod/prodUpdate.do" var="updateUrl">
								<c:param name="what" value="${prod.prodId }" />
							</c:url>
							<a href="${updateUrl }" class="btn btn-primary"><i
								class="fa-regular fa-pen-to-square"></i>수정</a>

							<c:url value="/prod/prodDelete.do" var="deleteUrl">
								<c:param name="what" value="${prod.prodId }" />
							</c:url>
							<a href="${deleteUrl }" class="btn btn-primary"
								onclick="return confirm('정말 삭제하시겠습니까?');"> <i
								class="fa-regular fa-circle-xmark"></i>삭제
							</a> <a href="<c:url value='/prod/prodList.do' />"
								class="btn btn-primary">취소</a>
						</nav>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<div class="container">
									<div class="row">
										<div class="col-md-6">
											<table>
												<tr>
													<th>상품명</th>
													<td class="td-text">${prod.prodName}</td>
												</tr>
												<tr>
													<th>분류명</th>
													<td class="td-text">${prod.lprod.lprodNm }</td>
												</tr>
												<tr>
													<th>요약정보</th>
													<td class="td-text">${prod.prodOutline}</td>
												</tr>
												<tr>
													<th>상세정보</th>
													<td class="td-text">${prod.prodDetail}</td>
												</tr>
											</table>
										</div>
										<div class="col-md-6">
											<table>
												<tr>
													<th>구매가</th>
													<td class="price">${prod.prodPrice}원</td>
												</tr>
												<tr>
													<th>총재고</th>
													<td class="price">${prod.prodTotalstock}(EA)</td>
												</tr>
												<tr>
													<th>적정재고</th>
													<td class="price">${prod.prodProperstock}(EA)</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								<table>
									<tr>
										<th>제조사정보</th>
										<td>
											<table>
												<thead>
													<tr>
														<th>제조사이름</th>
														<th>소재지(지역1)</th>
														<th>담당자명</th>
														<th>이메일</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<c:set var="buyer" value="${prod.buyer }" />
														<td>${buyer.buyerName }</td>
														<td>${buyer.buyerAdd1 }</td>
														<td>${buyer.buyerCharger }</td>
														<td>${buyer.buyerMail }</td>
													</tr>
												</tbody>
											</table>
										</td>
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