<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<style>
.modal-dialog {
	max-width: 35%;
}
s
</style>
<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">재고 현황</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i
									class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">재고 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">재고 현황 리스트</a></li>
						</ul>
					</div>
					<div>
						<nav class="button-box table-nav">
							<a href="<c:url value='/prod/prodInsert.do'/>"
								class="btn btn-primary"><i class="fa-solid fa-bars"></i>등록</a>
						</nav>
					</div>
					<div class="table-top-box side">
						<div id="searchUI">
							<form:form modelAttribute="prodCondition">
								<table>
									<tr>
										<td>재고번호</td>
										<td><form:input path="prodId" class="form-control" /></td>
										<td>재고명</td>
										<td><form:input path="prodName" class="form-control" /></td>
										<td>분류명</td>
										<td><form:input path="prodLgu" class="form-control" /></td>
										<td>거래처명</td>
										<td>
											<div class="custom-select">
												<form:select path="prodBuyer">
													<form:option value="" label="타입선택" />
													<form:option value="" label="타입선택" />
													<c:forEach items="${buyerList }" var="buyer">
														<form:option value="${buyer.buyerName }"
															label="${buyer.buyerName }" />
													</c:forEach>
												</form:select>
											</div>
										</td>
										<td>
											<div class="table-top-box right-side">
												<button type="button" id="searchBtn" class="btn btn-primary">
													<i class="fa-solid fa-magnifying-glass"></i>검색
												</button>

												<a href="<c:url value='/orders/ordersInsert.do'/>"
													class="btn btn-primary" style="margin-left: 70px;">발주신청
												</a>
											</div>
										</td>
									</tr>
								</table>
							</form:form>
						</div>
						<form:form id="searchform" method="get"
							modelAttribute="prodCondition">
							<form:hidden path="prodId" />
							<form:hidden path="prodName" />
							<form:hidden path="prodLgu" />
							<form:hidden path="prodBuyer" />
							<input type="hidden" name="page" />
						</form:form>

					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>일련번호</th>
											<th>재고번호</th>
											<th>재고명</th>
											<th>분류명</th>
											<th>제조사명</th>
											<th>구매가</th>
											<th>총 재고수</th>
											<th>적정 재고수</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty prodList }">
												<c:forEach items="${prodList }" var="prod">
													<tr>
														<td>${prod.rnum }</td>
														<td>${prod.prodId }</td>
														<td class="td-text"><c:url
																value="/prod/prodDetail.do" var="prodDetailUrl">
																<c:param name="what" value="${prod.prodId }" />
															</c:url> <a href="${prodDetailUrl }"> ${prod.prodName } </a></td>
														<td class="td-text">${prod.lprod.lprodNm }</td>
														<td class="td-text"><c:url
																value="/buyer/buyerDetail.do" var="buyerDetailUrl">
																<c:param name="what" value="${prod.buyer.buyerId }" />
															</c:url> <a href="${buyerDetailUrl }"> ${prod.buyer.buyerName }
														</a></td>
														<td class="price">${prod.prodPrice }원</td>
														<c:choose>
															<c:when
																test="${prod.prodTotalstock < prod.prodProperstock}">
																<td class="price"><span style="color: red;">${prod.prodTotalstock}</span></td>
															</c:when>
															<c:otherwise>
																<td class="price"><span style="color: blue;">${prod.prodTotalstock}</span></td>
															</c:otherwise>
														</c:choose>
														<td class="price">${prod.prodProperstock }</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="7">재고 없음.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="page-footer">
						<div class="paging paging-area">${pagingHTML }</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="orderProd" tabindex="-1"
	data-bs-backdrop="#" data-bs-keyboard="false" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<form id='insertForm' method="post"
					action="${cPath}/prod/prodInput.do">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="newBoardLabel">적정재고 미달내역</h1>
					</div>
					<div class="modal-body">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>재고명</th>
									<th>분류명</th>
									<th>제조사명</th>
									<th>구매가</th>
									<th>총 재고수</th>
									<th>적정 재고수</th>
								</tr>
							</thead>
							<tbody id="prodTableBody">
						</table>
					</div>

					<div class="modal-footer">
						<c:url value="/prod/prodInput.do" var="ordersInsertUrl">
						</c:url>
						<a href="${ordersInsertUrl }">발주신청</a>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
	
	$('#buyerSelect').change(function() {
        const oderBuyer = $(this).val();

        $.ajax({
            url: '${cPath}/prod/prodOrder.do', 
            type: 'GET',
            data: { buyerId: oderBuyer },
            success: function(data) {
            	 updateTable(data);
            	
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error fetching buyer data:', textStatus, errorThrown);
            }
        });
    });
	function updateTable(data) {
	    const tableBody = $('#prodTableBody');
	    tableBody.empty();

	    if (data.length === 0) {
	        tableBody.append('<tr><td colspan="6">재고미달 없음.</td></tr>');
	    } else {
	        data.forEach(prodOrder => {
	            const tableRow = `
	                <tr>
	                    <td id="prodName">\${prodOrder.prodName}</td>
	                    <td id="lprodNm">\${prodOrder.lprod.lprodNm}</td>
	                    <td id="buyerName">\${prodOrder.buyer.buyerName}</td>
	                    <td class="price">\${prodOrder.prodPrice}</td>
	                    <td id="prodTotalstock">\${prodOrder.prodTotalstock}</td>
	                    <td id="prodProperstock">\${prodOrder.prodProperstock}</td>
	                </tr>
	            `;
	            tableBody.append(tableRow);
	        });
	    }
	}
	
	insertForm.addEventListener("submit", function(e){
		e.preventDefault();
	    const orderBuyer = $('#buyerSelect').val();
		const url = e.target.action;
		
	    fetch(`\${url}`, {
	    	method:"post",
	    	headers:{"Content-Type":"application/json"},
	    	body:JSON.stringify({ "buyerId": orderBuyer })
	    })
	    
	});
});
</script>