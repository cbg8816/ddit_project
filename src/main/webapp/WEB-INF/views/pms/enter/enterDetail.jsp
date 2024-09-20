<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
table thead tr {
    background-color: #D3D3D3;
    color: #000000;
    text-align: left;
    font-weight: bold;
}
</style>

	<div class="container">
				<div class="page-inner">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="card">
								<div class="page-header">
									<h3 class="fw-bold mb-3">입고상세보기</h3>
									<ul class="breadcrumbs mb-3">
										<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
										<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
										<li class="nav-item"><a href="${cPath }/enter/enterList.do">입고 현황</a></li>
										<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
										<li class="nav-item"><a href="#">입고 상세보기</a></li>
									</ul>
								</div>
								<div class="table-top-box right-side">
									<nav class="button-box table-nav">
									<a href="#" class="btn btn-primary" onclick="history.back()">목록</a>
										<!-- <a href="#" class="btn btn-primary">결제선</a>
										<a href="#" class="btn btn-primary">결제</a>
										<a href="#" class="btn btn-primary">임시저장</a> -->
										<!-- <a href="#" class="btn btn-primary">저장</a>
										<a href="#" class="btn btn-primary">취소</a> -->
									</nav>
								</div>
								<div class="page-body">
									<div class="m-table-outer">
										<div class="m-table-inner">
											
<%-- 											<c:url value="/orders/ordersDelete.do" var="deleteUrl"> --%>
<%-- 												<c:param name="what" value="${orders.orderTurn }" /> --%>
<%-- 											</c:url> --%>
<%-- 											<a href="${deleteUrl }" --%>
<!-- 											class="btn btn-primary"> -->
<!-- 											<i class="fa-regular fa-circle-xmark"></i>취소 신청</a> -->
											
											<table class="table-header-fix table-input-in">
											<thead>
										<tr>
											<th>거래처명</th>
											<th>주소</th>
											<th>이메일</th>
											<th>전화번호</th>
											<th>담당자</th>
										</tr>
									</thead>
									<tbody>
									    <c:forEach items="${applyList}" var="apply" varStatus="status">
									        <c:if test="${status.first}">
									            <tr>
									                <td>${apply.buyer.buyerName }</td>
									                <td>${apply.buyer.buyerAdd1 }</td>
									                <td>${apply.buyer.buyerMail }</td>
									                <td>${apply.buyer.buyerComtel }</td>
									                <td>${apply.buyer.buyerCharger }</td>
									            </tr>
									        </c:if>
									    </c:forEach>
									</tbody>
									<tr>
										<td><h3>입고 품목</h3></td>
									</tr>
									<thead>
										<tr>
											<th>상품코드</th>
											<th>상품명</th>
											<th>구매가</th>
											<th>수량</th>
											<th>합계</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty applyList }">
												<c:forEach items="${applyList }" var="ordersList">
													<tr>
														<td>${ordersList.orders.orderId }</td>
														<td class="td-text">${ordersList.prod.prodName }</td>
														<td class="price">${ordersList.orders.orderPrice }원</td>
														<td>${ordersList.orders.orderQty }EA</td>
														<td class="price">${ordersList.orders.orderTotal}원</td>
													</tr>
													<c:set var="totalSum" value="${totalSum + ordersList.orders.orderTotal}" />
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="5">발주 없음.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
									
									<tfoot>
										<tr>
											<td colspan="4">총 합계:</td>
											<td class="price">${totalSum}원</td>
										</tr>
									</tfoot>
								</table>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
