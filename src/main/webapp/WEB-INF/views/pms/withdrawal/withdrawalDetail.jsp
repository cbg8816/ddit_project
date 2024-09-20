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
						<h3 class="fw-bold mb-3">출금 상세내역</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home">
							<a href="#"><iclass="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">출금 내역</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">출금상세내역</a></li>
						</ul>
					</div>
					<div class="table-top-box right-side">
						<nav class="button-box table-nav">
						<button type="button" class="btn btn-primary" onclick="window.print();"><i class="fa-solid fa-print"></i>인쇄하기</button>
							<button id="print-button" class="btn btn-primary"><i class="fa-regular fa-file-pdf"></i>pdf</button>
						<a href="<c:url value='/withdrawal/withdrawalList.do' />"
														class="btn btn-primary fa-bar"></i>목록</a>
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
								<h3 class="fw-bold mb-3">출금 정보</h3>
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>제조사명</th>
											<th>은행명</th>
											<th>계좌번호</th>
											<th>계좌주</th>
											<th>연락처</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${ordersApply[0].buyer.buyerName }</td>
											<td>${ordersApply[0].buyer.buyerBank }</td>
											<td>${ordersApply[0].buyer.buyerBankno }</td>
											<td>${ordersApply[0].buyer.buyerBankname }</td>
											<td>${ordersApply[0].buyer.buyerComtel }</td>
										</tr>
									</tbody>
									</table>
									<table>
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
													<c:forEach items="${ordersApply }" var="ordersApply">
														<tr>
															<td>${ordersApply.orders.orderId }</td>
															<td class="td-text">${ordersApply.prod.prodName }</td>
															<td class="price">${ordersApply.orders.orderPrice }원</td>
															<td>${ordersApply.orders.orderQty }EA</td>
															<td class="price">${ordersApply.orders.orderTotal}원</td>
														</tr>
														<c:set var="totalSum"
															value="${totalSum + ordersApply.orders.orderTotal}" />
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