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
						<h3 class="fw-bold mb-3">재고 등록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i
									class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="${cPath }/prod/prodList.do">재고
									현황 리스트</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">재고 등록</a></li>
						</ul>
					</div>
					<div class="table-top-box">
						<nav class="button-box table-nav">
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
								<c:url value="/prod/prodUpdate.do" var="updateUrl">
									<c:param name="what" value="${prod.prodId }" />
								</c:url>
								<form:form method="post" modelAttribute="prod" id="myForm">
										<div class="table-top-box right-side">
											<nav class="button-box table-nav">
												<button type="button" class="btn btn-primary" id="dummyBtn">임시 데이터</button>
												<button type="button" class="btn btn-primary me-2"
												id="submitBtn">저장</button>
											<a href="<c:url value='/prod/prodList.do' />"
												class="btn btn-primary">취소</a>
											</nav>
										</div>
									<div class="container">

										<!-- Group 2: 분류코드, 제조사코드 -->
										<div class="row mb-4">
											<div class="col-md-6">
												<table class="table table-bordered">
													<tr>
														<th>분류코드</th>
														<td><form:select path="prodLgu" class="form-select"
																style="width:200px;" id="prodLgu" required="required">
																<form:option value="" label="분류선택" />
																<c:forEach items="${lprodList}" var="lprod">
																	<form:option value="${lprod.lprodGu}"
																		label="${lprod.lprodNm}" />
																</c:forEach>
															</form:select> <form:errors path="prodLgu" cssClass="text-danger"
																element="span" /></td>
													</tr>
												</table>
											</div>
											<div class="col-md-6">
												<table class="table table-bordered">
													<tr>
														<th>제조사코드</th>
														<td><form:select path="prodBuyer" class="form-select"
																style="width:200px;" id="prodBuyer" required="required">
																<form:option value="" label="제조사선택" />
																<c:forEach items="${lprodList}" var="lprod">
																	<c:forEach items="${lprod.buyerList}" var="buyer">
																		<form:option value="${buyer.buyerId}"
																			label="${buyer.buyerName}" />
																	</c:forEach>
																</c:forEach>
															</form:select> <form:errors path="prodBuyer" cssClass="text-danger"
																element="span" /></td>
													</tr>
												</table>
											</div>
										</div>
										
										<!-- Group 3: 구매가, 적정재고 -->
										<div class="row mb-4">
											<div class="col-md-6">
												<table class="table table-bordered">
													<tr>
														<th>구매가</th>
														<td><form:input type="number" path="prodPrice"
																style="width:200px;" class="form-control" id="prodPrice"
																required="required" /> <form:errors path="prodPrice"
																cssClass="text-danger" element="span" /></td>
													</tr>
												</table>
											</div>
											<div class="col-md-6">
												<table class="table table-bordered">
													<tr>
														<th>적정재고</th>
														<td><form:input type="number" path="prodProperstock"
																style="width:200px;" class="form-control"
																id="prodProperstock" required="required" /> <form:errors
																path="prodProperstock" cssClass="text-danger"
																element="span" /></td>
													</tr>
												</table>
											</div>
										</div>
										<!-- Group 1: 상품명, 요약정보, 상세정보 -->
										<div class="row mb-4">
											<div class="col-md-12">
												<table class="table table-bordered">
													<tr>
														<th>상품명</th>
														<td><form:input type="text" path="prodName"
																style="width:400px;" class="form-control" id="prodName"
																required="required" /> <form:errors path="prodName"
																cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>요약정보</th>
														<td><form:input type="text" path="prodOutline"
																class="form-control" id="prodOutline"
																required="required" /> <form:errors path="prodOutline"
																cssClass="text-danger" element="span" /></td>
													</tr>
													<tr>
														<th>상세정보</th>
														<td><form:textarea path="prodDetail"
																class="form-control" id="prodDetail"
																required="required"></form:textarea> <form:errors
																path="prodDetail" cssClass="text-danger" element="span" />
														</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
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
                url: '${cPath}/prod/prodInsert.do/getDummyProductData',
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    $('#prodLgu').val(data.prodLgu);
                    $('#prodBuyer').val(data.prodBuyer);
                    $('#prodPrice').val(data.prodPrice);
                    $('#prodProperstock').val(data.prodProperstock);
                    $('#prodName').val(data.prodName);
                    $('#prodOutline').val(data.prodOutline);
                    $('#prodDetail').val(data.prodDetail);
                },
                error: function (xhr, status, error) {
                    alert("Failed to fetch dummy product data: " + error);
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