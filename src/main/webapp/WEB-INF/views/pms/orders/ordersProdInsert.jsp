<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
						<h3 class="fw-bold mb-3">거래처별 미달재고</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="${cPath }/prod/prodList.do">재고 현황리스트</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">거래처별 미달재고 리스트</a></li>
						</ul>
					</div>
								<table>
									<tr>
                                      	<td>거래처</td>
                                      	<td>
                                      		<select id="buyerSelect">
													<option value="" label="거래처 선택"/>
                                      			<c:forEach items="${buyerList }" var="buyer">
													<option value="${buyer.buyerId }"
															label="${buyer.buyerName }" />
												</c:forEach>
                                      		</select>
                                      	</td>
                                      </tr>
								</table>
					<div class="table-top-box right-side">
					
					
						<h6>*적정재고에서 미달된 수량 자동주문</h6>
						<nav class="button-box table-nav">
						<button type="button" id="submitAllBtn" class="btn btn-primary">
													<iclass ="fa-regular fa-paper-plane>발주 저장
												</button>
										<a href="${cPath }/prod/prodList.do" class="btn btn-primary">목록</a> 
						</nav>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>                 
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
                        <td class="prodId" data-prod-id="\${prodOrder.prodId}">\${prodOrder.prodName}</td>
                        <td>\${prodOrder.lprod.lprodNm}</td>
                        <td>\${prodOrder.buyer.buyerName}</td>
                        <td class="price">\${prodOrder.prodPrice}</td>
                        <td class="prodTotalstock">\${prodOrder.prodTotalstock}</td>
                        <td class="prodProperstock">\${prodOrder.prodProperstock}</td>
                    </tr>
                `;
                tableBody.append(tableRow);
            });
        }
    }

    $('#submitAllBtn').click(function() {
        const formData = [];

        $('#prodTableBody tr').each(function() {
            const prodId = $(this).find('.prodId').data('prod-id');
            const prodPrice = $(this).find('.price').text();
            const prodTotalstock = parseInt($(this).find('.prodTotalstock').text(), 10);
            const prodProperstock = parseInt($(this).find('.prodProperstock').text(), 10);
            const orderQuantity = prodProperstock - prodTotalstock;
            const prodTotal = orderQuantity * prodPrice;

            if (orderQuantity > 0) {
            	formData.push({
                	orderId: prodId,
                	orderProdQty: orderQuantity,
                	orderTotal: prodTotal
                });
            }
        });

        if (formData.length > 0) {
        	if(confirm('신청 하시겠습니까?')){
            $.ajax({
            	url: '${cPath}/orders/ordersInsert.do',
     	        type: 'POST',
     	        dataType: 'json',
     	        contentType: 'application/json; charset=UTF-8',
     	        data: JSON.stringify(formData),
                success: function(data) {
                    alert('발주신청 완료.');
                    var orderApplyNo = data.orderApplyNo;
    	            window.location.href = `${cPath}/orders/ordersDetail.do?what=` + orderApplyNo;
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('오류 발생:', textStatus, errorThrown);
                }
            });
        	}else{
        		alert('발주 신청이 취소되었습니다.');
        	}
        } else {
            alert('신청 정보가 없습니다.');
        }
    });
});
</script>