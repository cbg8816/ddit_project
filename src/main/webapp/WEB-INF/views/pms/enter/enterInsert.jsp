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
						<h3 class="fw-bold mb-3">입고 처리</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="${cPath }/orders/ordersList.do">발주 현황리스트</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">입고 처리</a></li>
						</ul>
					</div>
					<div class="table-top-box right-side">
						<nav class="button-box table-nav">
						<a href="<c:url value='/orders/ordersList.do' />"
														class="btn btn-primary">목록</a>
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
										<h3>입고 품목</h3>
								<form method="post" action="${cPath }/enter/enterInsert.do" onsubmit="return showAlert()">
									<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>발주번호</th>
											<th>상품번호</th>
											<th>상품명</th>
											<th>구매가</th>
											<th>발주 수량</th>
											<th>입고 수량</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty ordersApply }">
												<c:forEach items="${ordersApply }" var="ordersList"  >
													<tr>
														<td>${ordersList.orderApplyNo }</td>
														
														<td>${ordersList.orders.orderId }</td>
														
														<td>${ordersList.prod.prodName }</td>
														
														<td class="price">${ordersList.orders.orderPrice }</td>
													
														<td>${ordersList.orders.orderQty }</td>
														<td>
															<input type="number" name="qtyList[${status.index}]" style="width: 80px;" min="1"/>
														</td>
													</tr>
                              						 		 <input type="hidden" name="orderApplyNo" value="${ordersList.orderApplyNo}" />
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="5">발주 없음.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								<div class="form-group text-center mt-3">
										<button type="submit" class="btn btn-primary">
											<i class="fa-regular fa-paper-plane"></i> 등록
										</button>
									</div>
							</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
    function showAlert() {
        alert("재고수 반영 완료");
        return true; 
    }
</script>