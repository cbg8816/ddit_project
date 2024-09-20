<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
    .container {
        max-width: 90%; /* 전체 컨테이너의 최대 너비를 화면의 80%로 제한 */
        margin: 0 auto; /* 가운데 정렬 */
    }
    .table {
        width: 90%; /* 테이블이 화면에 꽉 차지 않도록 조정 */
    }
</style>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">거래처 등록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i
									class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="${cPath }/buyer/buyerList.do">거래처
									목록</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">거래처 등록</a></li>
						</ul>
					</div>

					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<c:url value="/prod/prodUpdate.do" var="updateUrl">
									<c:param name="what" value="${prod.prodId }" />
								</c:url>

								<form:form method="post" modelAttribute="buyer" id="myForm">
									<div class="table-top-box right-side">
										<nav class="button-box table-nav">
											<button type="button" class="btn btn-primary" id="dummyBtn">임시 데이터</button>
											<button type="button" class="btn btn-primary" id="submitBtn">저장
											</button>
											<a href="<c:url value='/buyer/buyerList.do' />"
												class="btn btn-primary">취소</a>
										</nav>
									</div>

									<!-- Group 1: 분류 -->
									<table class="table table-bordered">
										<thead>
											<tr>
												<th colspan="2">분류</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>분류코드</th>
												<td><form:select path="buyerLgu" class="form-control" id="buyerLgu">
														<form:option value="" label="분류선택" />
														<c:forEach items="${lprodList}" var="lprod">
															<form:option label="${lprod.lprodNm}" value="${lprod.lprodGu}"/>
														</c:forEach>
												</form:select> <form:errors path="buyerLgu" cssClass="text-danger"
														element="span" /></td>
											</tr>
										</tbody>
									</table>

									<!-- Group 2: 정보 -->
									<table class="table table-bordered">
										<thead>
											<tr>
												<th colspan="2">정보</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>제조사명</th>
												<td><form:input path="buyerName" required="true"
														cssClass="form-control" /> <form:errors path="buyerName"
														cssClass="text-danger" element="span" /></td>
											</tr>
											<tr>
												<th>연락처</th>
												<td><form:input path="buyerComtel" required="true"
														cssClass="form-control" /> <span class="text-danger">${errors.buyerComtel}</span>
												</td>
											</tr>
											<tr>
												<th>팩스번호</th>
												<td><form:input path="buyerFax" required="true"
														cssClass="form-control" /> <form:errors path="buyerFax"
														cssClass="text-danger" element="span" /></td>
											</tr>
											<tr>
												<th>이메일</th>
												<td><form:input path="buyerMail" required="true"
														cssClass="form-control" /> <form:errors path="buyerMail"
														cssClass="text-danger" element="span" /></td>
											</tr>
											<tr>
												<th>담당자</th>
												<td><form:input path="buyerCharger" required="true"
														cssClass="form-control" /> <form:errors
														path="buyerCharger" cssClass="text-danger" element="span" />
												</td>
											</tr>
										</tbody>
									</table>

									<!-- Group 3: 은행 -->
									<table class="table table-bordered">
										<thead>
											<tr>
												<th colspan="2">은행</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>은행명</th>
												<td><form:input path="buyerBank" required="true"
														cssClass="form-control" /> <form:errors path="buyerBank"
														cssClass="text-danger" element="span" /></td>
											</tr>
											<tr>
												<th>계좌번호</th>
												<td><form:input path="buyerBankno" required="true"
														cssClass="form-control" /> <form:errors
														path="buyerBankno" cssClass="text-danger" element="span" />
												</td>
											</tr>
											<tr>
												<th>계좌주</th>
												<td><form:input path="buyerBankname" required="true"
														cssClass="form-control" /> <form:errors
														path="buyerBankname" cssClass="text-danger" element="span" />
												</td>
											</tr>
										</tbody>
									</table>

									<!-- Group 4: 주소 -->
									<table class="table table-bordered">
										<thead>
											<tr>
												<th colspan="2">주소</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>우편번호</th>
												<td><form:input path="buyerZip" required="true"
														cssClass="form-control" /> <form:errors path="buyerZip"
														cssClass="text-danger" element="span" /></td>
											</tr>
											<tr>
												<th>주소1</th>
												<td><form:input path="buyerAdd1" required="true"
														cssClass="form-control" /> <form:errors path="buyerAdd1"
														cssClass="text-danger" element="span" /></td>
											</tr>
											<tr>
												<th>주소2</th>
												<td><form:input path="buyerAdd2" required="true"
														cssClass="form-control" /> <form:errors path="buyerAdd2"
														cssClass="text-danger" element="span" /></td>
											</tr>
										</tbody>
									</table>
								</form:form>



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
    $(document).ready(function () {
        $("#dummyBtn").click(function () {
            $.ajax({
                url: '${cPath}/buyer/buyerInsert.do/getDummyData',
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    $('#buyerLgu').val(data.buyerLgu);
                    $('input[name="buyerName"]').val(data.buyerName);
                    $('input[name="buyerComtel"]').val(data.buyerComtel);
                    $('input[name="buyerFax"]').val(data.buyerFax);
                    $('input[name="buyerMail"]').val(data.buyerMail);
                    $('input[name="buyerCharger"]').val(data.buyerCharger);
                    $('input[name="buyerBank"]').val(data.buyerBank);
                    $('input[name="buyerBankno"]').val(data.buyerBankno);
                    $('input[name="buyerBankname"]').val(data.buyerBankname);
                    $('input[name="buyerZip"]').val(data.buyerZip);
                    $('input[name="buyerAdd1"]').val(data.buyerAdd1);
                    $('input[name="buyerAdd2"]').val(data.buyerAdd2);
                },
                error: function (xhr, status, error) {
                    alert("Failed to fetch dummy data: " + error);
                }
            });
        });
    });
    const submit = document.querySelector("#submitBtn");
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
