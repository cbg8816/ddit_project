<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">발주 승인</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">?</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">?</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<div class="right">
							<div id="searchUI">
								<form:form modelAttribute="confirmCondition" id="viewform">
									<table>
										<tr>
											<td>요청일자</td>
											<td><input type="date" name="orderApplyDate" value="${confirmCondition.orderApplyDate }" class="form-control" /></td>
											<td>분류명</td>
											<td><form:input path="lprodNm" class="form-control" /></td>
											<td>거래처명</td>
											<td><form:input path="buyerName" class="form-control" /></td>
											<td><button type="button" id="resetBtn" class="btn btn-primary" >초기화</button></td>
											<td><button type="button" id="searchBtn" class="btn btn-primary" >검색</button></td>
											<td><button type="button" id="comfirmBtn" class="btn btn-primary" >승인</button></td>
										</tr>
									</table>
								</form:form>
							</div>
						</div>
					</div>
					<form:form id="searchform" method="get" modelAttribute="confirmCondition">
						<form:hidden path="orderApplyDate"/>
						<form:hidden path="lprodNm"/>
						<form:hidden path="prodName"/>
						<form:hidden path="buyerName"/>
						<input type="hidden" name="page" />
					</form:form>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th><input type="checkbox" id="chkAll"></th>
											<th>발주번호</th>
											<th>승인상태</th>
											<th>요청일자</th>
											<th>분류명</th>
											<th>거래처명</th>
											<th>단가</th>
											<th>수량</th>
											<th>총액</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty confirmList }">
											<c:forEach items="${confirmList }" var="list">
												<tr>
													<td class="chk"><input type="checkbox"><input type="hidden" value="${list.orderApplyTurn }"></td>
													<td><a href="${cPath }/orders/ordersDetail.do?what=${list.orderApplyNo}">${list.orderApplyNo }</a></td>
													<td>${list.orderApplyState }</td>
													<td>${list.orderApplyDate }</td>
													<td class="go-left">${list.lprodNm }</td>
													<td class="go-left">${list.buyerName }</td>
													<td class="price">${list.orderPrice }</td>
													<td class="price">${list.orderApplyQty }</td>
													<td class="price">${list.orderTotalPrice }</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty confirmList }">
											<tr>
												<td colspan="9">발주건 없음.</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="page-footer">
						<div class="paging paging-area">
							${pagingHTML }
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
document.addEventListener("DOMContentLoaded", function(){
	const chkOrd = document.querySelectorAll(".chk");

	resetBtn.addEventListener("click", function(e){
		const vInps = viewform.querySelectorAll("input");
		const sInps = searchform.querySelectorAll("input");

		vInps.forEach((inp)=>{
			inp.value = "";
		});

		sInps.forEach((inp)=>{
			inp.value = "";
		});

		searchform.requestSubmit();
	});

	chkAll.addEventListener("change", function(e){
		if(e.target.checked){
			chkOrd.forEach((c)=>{
				c.children[0].checked = true;
			});
		}else{
			chkOrd.forEach((c)=>{
				c.children[0].checked = false;
			});
		}
	});

	comfirmBtn.addEventListener("click", function(e){
		const orders = [];

		chkOrd.forEach((c)=>{
			if(c.children[0].checked){
				orders.push(c.children[1].value);
			}
		});
		console.log(orders);

		axios.post()

	})
})
</script>