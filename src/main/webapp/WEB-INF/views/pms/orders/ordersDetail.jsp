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
				<div class="card" style="position:relative">
					<div class="page-header">
						<h3 class="fw-bold mb-3">발주상세보기</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="${cPath }/orders/ordersList.do">발주 현황리스트</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">발주 상세보기</a></li>
						</ul>
					</div>
					<div class="table-top-box right-side">
						<nav class="button-box table-nav">
							<c:forEach items="${ordersApply}" var="apply" varStatus="status">
    							<c:if test="${status.first && apply.orderApplyState eq '미승인'}">
   							     <button type="button" class="btn btn-primary" id="orderConfirm">발주승인</button>
									 	<c:url value="/orders/ordersDelete.do" var="deleteUrl">
									 		<c:param name="what" value="${apply.orderApplyNo }" />
									 	</c:url>
									 	<a href="${deleteUrl }"class="btn btn-primary" onclick="return confirm('정말 발주를 취소하시겠습니까?');">
									 	<i class="fa-regular fa-circle-xmark"></i>발주취소</a>
  								  </c:if>
							</c:forEach>

						<button type="button" class="btn btn-primary" onclick="window.print();"><i class="fa-solid fa-print"></i>인쇄하기</button>
							<button id="print-button" class="btn btn-primary"><i class="fa-regular fa-file-pdf"></i>pdf</button>
						<a href="<c:url value='/orders/ordersList.do' />"
														class="btn btn-primary">목록</a>
							<!-- <a href="#" class="btn btn-primary">결제선</a>
										<a href="#" class="btn btn-primary">결제</a>
										<a href="#" class="btn btn-primary">임시저장</a>
							<!-- <a href="#" class="btn btn-primary">저장</a>
										<a href="#" class="btn btn-primary">취소</a> -->
						</nav>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
									<h3 class="fw-bold mb-3">발주 정보</h3>
									<table class="table-header-fix table-input-in" id="orderTable">
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
									    <c:forEach items="${ordersApply}" var="apply" varStatus="status">
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
											<c:when test="${not empty ordersApply }">
												<c:forEach items="${ordersApply }" var="ordersList">
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
											<td colspan="4"><h4>총 합계:</h4></td>
											<td class="price">${totalSum}원</td>
										</tr>
									</tfoot>
								</table>
									<c:if test="${'미승인' ne ordersApply[0].orderApplyState }">
										<div class="confirm-img-box">
											<img width="300px" src="${cPath }/resources/images/confirm.png">
										</div>
									</c:if>
								<form id="emailForm" action="${cPath}/email" method="post">
									<c:forEach items="${ordersApply}" var="apply" varStatus="status">
										<c:if test="${status.index == 0}">
										    <input type="hidden" id="buyerMail" name="buyerMail" value="${apply.buyer.buyerMail}">
										</c:if>
									</c:forEach>
									<c:forEach items="${ordersApply}" var="apply" varStatus="status">
										 <c:if test="${status.first}">
					 						<input type="hidden" id="orderApplyNo" name="orderApplyNo" value="${apply.orderApplyNo }" />
										</c:if>
									</c:forEach>
									<input type="hidden" id="htmlTable" name="htmlTable" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<script>
	window.jsPDF = window.jspdf.jsPDF;

	const printButton = document.getElementById('print-button');
	console.log(printButton)
	const card = document.querySelector(".card");
	const tableContent = document.querySelector(".m-table-inner"); // 테이블이 포함된 div
	const order = document.querySelector("#orderConfirm");

	// 출력 버튼에 클릭 이벤트 연결
	printButton.addEventListener('click', () => {
		console.log(123123);
	    showPrint();
	});

	order.addEventListener("click", (e)=>{
		e.preventDefault();
		swal({
            title: "발주를 승인하시겠습니까?",
            text: "",
            type: "success",
            buttons: {
              confirm: {
                text: "승인",
                className: "btn btn-success",
              },
              cancel: {
            	text: "취소",
                visible: true,
                className: "btn btn-danger",
              },
            },
          }).then((result) => {
            if (result) {
              swal({
            	icon: "success",
                title: "발주가 승인되었습니다.",
                text: "",
                type: "success",
                buttons: {
                  confirm: {
                    className: "btn btn-success",
                  },
                },
              }).then(function(result){ //  창 꺼질때 실행할 함수
            	  if(result){
	            	  sendEmail();
            	  }
	  		    });
            } else {
	            swal("취소했습니다.", "", {
		              icon: "error",
		              buttons: {
		                confirm: {
		                  className: "btn btn-danger",
		                },
		              },
		            }).then(function(result){
						if(result){
							swal.close();
						}
					})
            }
          });


	});

	function sendEmail() {
	    var htmlTable = document.getElementById('orderTable').outerHTML;

	    // 인라인 스타일로 테두리 지정
	    htmlTable = htmlTable.replace(/<table/g, '<table style="border-collapse: collapse; width: 100%; border: 1px solid black;"');
	    htmlTable = htmlTable.replace(/<th/g, '<th style="border: 1px solid black; padding: 8px;"');
	    htmlTable = htmlTable.replace(/<td/g, '<td style="border: 1px solid black; padding: 8px;"');
	    htmlTable = htmlTable.replace(/<tr/g, '<tr style="border: 1px solid black;"');
	    
	    document.getElementById('htmlTable').value = htmlTable;
	    document.getElementById('emailForm').requestSubmit();
	}

	document.getElementById("orderInsertBtn").addEventListener("click", sendEmail);

	function showPrint() {
	    html2canvas(tableContent, {
	        scale: 1, // 이미지 품질
	    }).then(canvas => {
	        const imgData = canvas.toDataURL('image/png');
	        const imgWidth = 210; // PDF의 가로 길이 (A4 기준, 단위 mm)
	        const pageHeight = 297; // A4 세로 길이 (mm)
	        const imgHeight = canvas.height * imgWidth / canvas.width;
	        let heightLeft = imgHeight;
	        const margin = 10; // 여백 설정 (mm)
	        const doc = new jsPDF('p', 'mm');
	        let position = 0;

	        // 첫 페이지 출력
	        doc.addImage(imgData, 'PNG', margin, position, imgWidth - 2 * margin, imgHeight);
	        heightLeft -= pageHeight;

	        // 여러 페이지 출력
	        while (heightLeft > 0) {
	            position = heightLeft - imgHeight;
	            doc.addPage();
	            doc.addImage(imgData, 'PNG', margin, position, imgWidth - 2 * margin, imgHeight);
	            heightLeft -= pageHeight;
	        }

	        // PDF 파일 생성 및 다운로드
	        doc.save('발주상세보기.pdf'); // 파일 다운로드 이름
	    });
	}


</script>