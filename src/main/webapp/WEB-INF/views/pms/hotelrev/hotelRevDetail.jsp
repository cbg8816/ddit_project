<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">호텔예약 조회</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item">예약관리</li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item">예약상세정보</li>
						</ul>
					</div>
					<div class="table-top-box right-side">
						<nav class="button-box table-nav">
							<button type="button" class="btn btn-primary" onclick="window.print();"><i class="fa-solid fa-print"></i>인쇄하기</button>
							<button id="print-button" class="btn btn-primary"><i class="fa-regular fa-file-pdf"></i>pdf</button>
							<a href="<c:url value='/hotelrev/hotelRevList.do' />"
								class="btn btn-primary">목록</a>
						</nav>
					</div>
<!-- 					</div> -->
					<div class="page-body revDetail d-flex" style="gap: 40px;">
						<div class="workIn-left">
							<input type="hidden" name="what" id="revId"
								value="${hotelrevVO.htrevId }">
							<div class="m-table-outer">
								<div class="m-table-inner">
									<form method="post" id="revSt-form">
										<table class="text-left-td workin-table">
											<!-- 									<thead> -->
											<!-- 										<tr> -->
											<!-- 										</tr> -->
											<!-- 									</thead> -->
											<tbody>
												<tr>
													<th>예약상태</th>
													<td class="d-flex">
														<div class="custom-select">
															<select name="trevSt" id="revSt">
<%-- 																<option value="${hotelrevVO.trevSt}">${hotelrevVO.trevSt }</option> --%>
																<option value="" >타입선택</option>
																<option value="RV"
																	${hotelrevVO.trevSt eq "RV" ? "selected" : "" }>예약접수</option>
																<option value="CC"
																	${hotelrevVO.trevSt eq "CC" ? "selected" : "" } >예약취소</option>
																<option value="IN"
																	${hotelrevVO.trevSt eq "IN" ? "selected" : "" } >입실</option>
															</select>
														</div>
														<button type="submit" class="btn btn-primary ms-2">상태변경</button>
													</td>
												</tr>
												<!-- 										<tr> -->
												<!-- 											<td>회원구분</td> -->
												<!-- 										</tr> -->
												<tr>
													<th>이름</th>
													<td>${hotelrevVO.memName }</td>

												</tr>
												<tr>
													<th>전화번호</th>
													<td>${hotelrevVO.memTel }</td>
												</tr>
												<tr>
													<th>차량번호</th>
													<td>${hotelrevVO.trevCarno }</td>
												</tr>
												<tr>
													<th>체크인</th>
													<td>${hotelrevVO.htrevChkin }</td>
												</tr>
												<tr>
													<th>체크아웃</th>
													<td>${hotelrevVO.htrevChkout }</td>
												</tr>
												<tr>
													<th>숙박일</th>
													<td>${hotelrevVO.htrevStay }</td>
												</tr>
												<tr>
													<th>성인수</th>
													<td>${hotelrevVO.trevAdult }</td>
												</tr>
												<tr>
													<th>아동수</th>
													<td>${hotelrevVO.trevChild }</td>
												</tr>
												</tbody>
										</table>
									</form>
								</div>
							</div>
						</div>
						<div class="workIn-right">
							<table>
							<tbody>
								<tr>
									<th>객실타입</th>
									<th>객실호수</th>
									<th>객실가격(원)</th>
								</tr>
								<c:if test="${not empty revroomList }">
								<c:forEach items="${revroomList }" var="revroom">

									<tr>
										<td>${revroom.roomtypeNm }</td>
										<td>${revroom.roomId }</td>
										<td class="price">${revroom.revroomPrice }</td>
									</tr>
								</c:forEach>
								</c:if>
								<c:if test="${empty revroomList }">
									<tr>
										<td colspan="3">조회된 내역이 없습니다.</td>
									</tr>
								</c:if>
								<tr>
									<td>객실요금 합계</td>
									<td></td>
									<td class="price">${hotelrevVO.htrevTprice }</td>
								</tr>

								<tr>
									<th>기타요금 타입</th>
									<th>수량</th>
									<th>기타요금(원)</th>
								</tr>
								<c:if test="${not empty extrachargeList }">
								<c:forEach items="${extrachargeList }" var="extracharge">
									<tr>
										<td>${extracharge.etNm }</td>
										<td>${extracharge.extcrgQty }</td>
										<td class="price">${extracharge.etPrice }</td>
									</tr>
								</c:forEach>
								</c:if>
								<c:if test="${empty extrachargeList }">
									<tr>
										<td colspan="3">조회된 내역이 없습니다.</td>
									</tr>
								</c:if>
									<tr>
										<td>기타요금 합계</td>
										<td></td>
										<td class="price">${totalExtra }</td>
									</tr>
								</tbody>
							</table>
<%-- 							<span class="price">객실요금 합계 : ${hotelrevVO.htrevTprice } </span></br> --%>
<%-- 							<span class="price">기타요금 합계 : ${totalExtra }</span> --%>
						</div>
					</div>
					<div class="page-footer">

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${cPath }/resources/js/pms/hotelrev/hotelRevDetail.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script>
 window.jsPDF = window.jspdf.jsPDF;

 const printButton = document.getElementById('print-button');
 const card = document.querySelector(".card");
 const tableContent = document.querySelector(".m-table-inner"); // 테이블이 포함된 div


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
         doc.save('예약상세보기.pdf'); // 파일 다운로드 이름
     });
 }

 // 출력 버튼에 클릭 이벤트 연결
 printButton.addEventListener('click', () => {
     showPrint();
 });

 </script>

