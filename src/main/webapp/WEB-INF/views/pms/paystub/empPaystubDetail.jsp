<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">직원 급여 상세보기</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 급여 상세보기</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
<!-- 							<input type="button" value="인쇄하기" id="print" onclick="window.print()"/> -->
							<button type="button" class="btn btn-primary" onclick="window.print();"><i class="fa-solid fa-print"></i>인쇄하기</button>
							<button id="print-button" class="btn btn-primary"><i class="fa-regular fa-file-pdf"></i>pdf</button>
						</nav>
						<nav class="button-box table-nav">
							<a href="<c:url value='/paystub/empPaystubList.do?what=${empvo.empId }' />" class="btn btn-primary">목록</a>
						</nav>
					</div>
					<div class="page-body" id="print-content">
						<div class="print-h1">
							<h1>급여명세서</h1>
						</div>
						<div class="pay-emp-info">
							<div class="d-flex">
								<p class="pay-title">사번</p>
								<span class="pay-line"></span>
								<p class="pay-cont">${paystub.emp.empId }</p>
							</div>
							<div class="d-flex">
								<p class="pay-title">급여지급일</p>
								<span class="pay-line"></span>
								<p class="pay-cont">${paystub.paystubPaydate }</p>
							</div>
							<div class="d-flex">
								<p class="pay-title">이름</p>
								<span class="pay-line"></span>
								<p class="pay-cont">${paystub.emp.empName }</p>
							</div>
							<div class="d-flex">
								<p class="pay-title">정산기간</p>
								<span class="pay-line"></span>
								<p class="pay-cont">${paystub.paystubStdate } ~ ${paystub.paystubEnddate }</p>
							</div>
						</div>
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table>
									<colgroup>
										<col width="20%" />
										<col width="" />
										<col width="20%" />
										<col width="" />
									</colgroup>
									<tr>
										<th>지급액</th>
										<th>금액(원)</th>
										<th>공제금액</th>
										<th>금액(원)</th>
									</tr>

									<tr>
										<th>기본금</th>
										<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubNomal }" />원</td>
										<th>국민연금</th>
										<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubNaPen }" />원</td>
									</tr>
									<tr>
										<th>상여금</th>
										<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubBonus }" />원</td>
										<th>건강보험</th>
										<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubHeIns }" />원</td>
									</tr>
									<tr>
										<th>야근수당</th>
										<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubOvertime }" />원</td>
										<th>고용보험</th>
										<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubEmpIns }" />원</td>

									</tr>
									<tr>
										<th></th>
										<td></td>
										<th>장기요양보험료</th>
										<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubLongIns }" />원</td>
									</tr>
									<tr>
										<th></th>
										<td></td>
										<th>소득세</th>
										<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubIncomeTax }" />원</td>
									</tr>
									<tr>
										<th></th>
										<td></td>
										<th>지방소득세</th>
										<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubLoIncomeTax }" />원</td>
									</tr>
									<tr>
										<th>지급액</th>
										<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubTotal }" />원</td>
										<th>공제금액</th>
										<td class="td-number"><fmt:formatNumber type="number" value="${paystub.deductible }" />원</td>
									</tr>
									<tr>
										<th></th>
										<td></td>
										<th>실 수령액</th>
										<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubRealtotal }" />원</td>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

 <script>

 		window.jsPDF = window.jspdf.jsPDF;
        // 특정 요소를 선택하여 출력할 내용을 가진 변수
        const printContent = document.querySelector('#print-content');
        const printH1 = document.querySelector(".print-h1");
        const card = document.querySelector(".card");
        let pay = "${paystub.paystubPaydate}";

        let month = pay.substr(5, 2);


        // 출력 버튼 클릭 시 실행되는 함수
        function showPrint() {
            html2canvas(printContent, {
                // 이미지 품질 및 크기 조절 등 옵션 설정
                scale: 1,
            }).then(canvas => {
            	const imgData = canvas.toDataURL('image/png');
                const imgWidth = 170; // 이미지 가로 길이 (mm)
                const pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이
                const imgHeight = canvas.height * imgWidth / canvas.width;
                let heightLeft = imgHeight;
                const margin = 25; // 출력 페이지 여백 설정
                const doc = new jsPDF('p', 'mm');
                let position = 10;

                window.scrollTo(0, 0);

                // 첫 페이지 출력
                doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;

                // 여러 페이지 출력
                while (heightLeft >= 20) {
                    position = heightLeft - imgHeight - 20;
                    doc.addPage();
                    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
                    heightLeft -= pageHeight;
                }

                // PDF 파일 생성 및 다운로드 또는 새 탭에서 열기
                doc.save(month+'월 급여명세서.pdf'); // 파일 다운로드
                window.open(doc.output('bloburl')); // 새 탭에서 열기
            });
        }

        // 출력 버튼에 클릭 이벤트 연결
        const printButton = document.getElementById('print-button');
        printButton.addEventListener('click', ()=>{
        	printH1.style.display = "block";
            card.classList.remove('card');
            showPrint();
            printH1.style.display = "none";
            card.classList.add('card');
        })

    </script>