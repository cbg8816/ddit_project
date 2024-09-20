<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
#lostitem .modal-dialog {
    max-width: 20%;
}
table thead tr {
    background-color: #D3D3D3;
    color: #000000;
    text-align: left;
    font-weight: bold;
}
button{
	 background-color: #695C49;
	 color: #FFFFFF;
	 border-radius: 10px;
}
</style>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">출금등록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i
									class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">출금</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">출금내역</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<a href="<c:url value='/withdrawal/withdrawalList.do'/>"
								class="btn btn-primary"><i
								class="fa-solid fa-magnifying-glass"></i>출금내역 조회</a> <a
								href="<c:url value='/withdrawal/withdrawalRemainList.do'/>"
								class="btn btn-primary"><i
								class="fa-solid fa-magnifying-glass"></i>미지급내역 조회</a> <a
								href="<c:url value='/withdrawal/withdrawalSendList.do'/>"
								class="btn btn-primary"><i
								class="fa-regular fa-pen-to-square"></i>출금등록</a>
							<!-- <a href="#" class="btn btn-primary"><i
											class="fa-regular fa-pen-to-square"></i>수정</a>
											<a href="#" class="btn btn-primary"><i class="fa-regular fa-circle-xmark"></i>삭제</a> -->
						</nav>
						<div class="right">
							<div id="searchUI">
								<nav class="nav-search d-lg-flex input-search table-nav ms-1">
									<div class="custom-select">
										<form:select path="condition.searchType">
											<form:option value="" label="전체" />
											<form:option value="" label="전체" />
											<form:option value="no" label="입고번호" />
											<form:option value="buyerName" label="거래처명" />
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
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<td>입고번호</td>
											<td>제조사</td>
											<td>분류</td>
											<td>품목수</td>
											<td>금액</td>
											<td>입고일자</td>
											<td>출금등록</td>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty enterList }">
												<c:forEach items="${enterList }" var="enter"
													varStatus="status">
													<tr>
														<td><c:url value="/enter/enterDetail.do"
																var="enterDetailUrl">
																<c:param name="what" value="${enter.enterOrder }" />
															</c:url> <a href="${enterDetailUrl}">${enter.enterTurn}</a></td>
														<td>${enter.buyer.buyerName}</td>
														<td>${enter.lprod.lprodNm}</td>
														<td>${enter.enterQty} 개</td>
														<td class="price">${enter.enterTotal}원</td>
														<td>${enter.enterDay}</td>
														<td>
															<button data-bs-toggle="modal" data-bs-target="#lostitem"
																data-buyerId="${enter.buyer.buyerId}"
																data-enterTurn="${enter.enterTurn}"
																data-enterOrder="${enter.enterOrder}"
																data-buyerName="${enter.buyer.buyerName}"
																data-buyerBank="${enter.buyer.buyerBank}"
																data-buyerBankno="${enter.buyer.buyerBankno}"
																data-enterTotal="${enter.enterTotal}">등록</button>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="7">출금리스트 없음.</td>
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
				<%-- 				<form:form id="searchform" method="get" modelAttribute="condition"> --%>
				<%-- 											<form:input path="searchType"/> --%>
				<%-- 											<form:input path="searchWord"/> --%>
				<!-- 					<input type="hidden" name="page" /> -->
				<%-- 				</form:form> --%>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="lostitem" tabindex="-1" data-bs-backdrop="#"
	data-bs-keyboard="false" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">

				<form method="post" action="${cPath }/withdrawal/withdrawalInsert.do" id="myForm">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="newBoardLabel">출금등록</h1>
					</div>
					<div class="modal-body">
						<table class="table table-bordered">
							<tr>
								<th>출금일자</th>
								<td><input type="text" value="" id="enterDate" name="enterDate" readonly></td>
							</tr>
							<tr>
								<th>거래처</th>
								<td><input type="text" value="" id="buyerName" name="buyerName" readonly></td>
							</tr>
							<tr>
								<th>계좌정보</th>
								<td><input type="text" value="" id="buyerBank" name="buyerBank" readonly></td>
							</tr>
							<tr>
								<th>계좌번호</th>
								<td><input type="text" value="" id="buyerBankno" name="buyerBankno" readonly></td>
							</tr>
							<tr>
								<th>금액</th>
								<td><input class="price" type="number" value="" id="enterTotal" name="enterTotal" readonly></td>
							</tr>
							<tr>
								<th>지급금액 입력 </th>
								<td ><input class="price" type="number" value="" id="enterSend" name="enterSend"></td>
							</tr>
							<input type="hidden" value="" id="enterTurn" name="enterTurn" readonly>
							<input type="hidden" value="" id="enterOrder" name="enterOrder" readonly>
							<input type="hidden" value="" id="buyerId" name="buyerId" readonly>
						</table>

					</div>
					<div class="modal-footer">

						<button type="button" id="fillEnterSend" class="btn btn-secondary">자동입력</button>
						<button type="button" class="btn btn-primary" id="orderInsertBtn">
							<iclass ="fa-regularfa-paper-plane">등록 
						</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>

document.getElementById('enterDate').value = new Date().toISOString().substring(0, 10);;

document.addEventListener('DOMContentLoaded', function () {
	
	var fillEnterSendBtn = document.getElementById('fillEnterSend');

    fillEnterSendBtn.addEventListener('click', function () {
        // enterTotal의 값을 enterSend로 복사
        var enterTotalValue = document.getElementById('enterTotal').value;
        document.getElementById('enterSend').value = enterTotalValue;
    });

    var lostItemModal = document.getElementById('lostitem');
	
    var lostItemModal = document.getElementById('lostitem');

    lostItemModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;

        var buyerName = button.getAttribute('data-buyername');
        var buyerBank = button.getAttribute('data-buyerbank');
        var buyerBankno = button.getAttribute('data-buyerbankno');
        var enterTotal = button.getAttribute('data-entertotal');
        var buyerId = button.getAttribute('data-buyerId');
        var enterTurn = button.getAttribute('data-enterTurn');
        var enterOrder = button.getAttribute('data-enterOrder');
        
        document.getElementById('buyerName').value = buyerName;
        document.getElementById('buyerBank').value = buyerBank;
        document.getElementById('buyerBankno').value = buyerBankno;
        document.getElementById('enterTotal').value = enterTotal;
        document.getElementById('buyerId').value = buyerId;
        document.getElementById('enterTurn').value = enterTurn;
        document.getElementById('enterOrder').value = enterOrder;

     
    });
});

const submit = document.querySelector("#orderInsertBtn");
const myForm = document.getElementById('myForm');
submit.addEventListener("click", (e)=>{
	e.preventDefault();
	swal({
        title: "등록하시겠습니까?",
        text: "",
        type: "success",
        buttons: {
          confirm: {
            text: "등록",
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
            title: "등록 되었습니다.",
            text: "",
            type: "success",
            buttons: {
              confirm: {
                className: "btn btn-success",
              },
            },
          }).then(function(result){ //  창 꺼질때 실행할 함수
        	  if(result){
        		  myForm.submit();
        	  }
  		    });
        } else {
            swal("등록을 취소했습니다.", "", {
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
</script>