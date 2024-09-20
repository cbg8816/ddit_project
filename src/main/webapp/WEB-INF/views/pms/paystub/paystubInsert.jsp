<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">직원 급여명세서 등록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 급여 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 급여명세서 등록</a></li>
						</ul>
					</div>
					<form:form id="payForm" method="post" modelAttribute="paystub" cssStyle="display:contents;">
						<div class="table-top-box side">
							<nav class="button-box table-nav">
								<button type="button" id="auto-insert" class="btn btn-primary">자동 계산</button>
<!-- 								<span>기본급, 야근수당, 성과금을 입력 하고 자동입력 버튼을 누르면 자동입력 됩니다</span> -->
							</nav>
							<nav class="button-box table-nav">
								<button type="submit" class="btn btn-primary" id="pay-submit">저장</button>
								<a href="<c:url value='/emp/empList.do' />" class="btn btn-primary">취소</a>
							</nav>
						</div>
						<div class="d-flex mb-3">
							<div class="d-flex pay-date-box">
								<p class="me-2">지급일</p>
								<div class="me-2">
									<form:input type="date" path="paystubPaydate"  cssClass="date-input" required="required" />
									<form:errors path="paystubPaydate" cssClass="text-danger" element="span" />
								</div>
							</div>
							<div class="d-flex pay-date-box">
								<p class="me-2">정산기간</p>
								<div class="d-flex pay-date-box">
									<form:input type="date" path="paystubStdate" cssClass="date-input" required="required" />
									<form:errors path="paystubStdate" cssClass="text-danger" element="span" />
									<span class="ms-2 me-2">~</span>
									<form:input type="date" path="paystubEnddate"  cssClass="date-input" required="required" />
									<form:errors path="paystubEnddate" cssClass="text-danger" element="span" />
								</div>
							</div>
						</div>
						<div class="page-body">
							<div class="m-table-outer">
								<div class="m-table-inner">
									<table class="table-header-fix table-input-in" id="payment-table">
										<colgroup>
											<col width="6%" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
										</colgroup>
										<thead>
											<tr>
												<th>사원이름</th>
												<th>기본급</th>
												<th>상여금</th>
												<th>야근수당</th>
												<th>총금액</th>
												<th>공제금액</th>
												<th>국민연금</th>
												<th>건강보험</th>
												<th>고용보험</th>
												<th>장기요양보험료</th>
												<th>소득세</th>
												<th>지방소득세</th>
												<th>실수령액</th>
											</tr>
										</thead>
										<tbody>
											 <c:forEach items="${empList }" var="emp" varStatus="status">
												<tr>
													<td>
														${emp.empName }
														<form:hidden path="empId" value="${emp.empId }" cssClass="empIds" />
<%-- 														<form:hidden path="empSal" /> --%>
														<input type=hidden value="${emp.empSal }" class="empsal-input" />
													</td>
													<td>
<%-- 														<form:input type="text" path="emp[status.index].paystubNomal" cssClass="paystubNomal"  /> --%>
<%-- 														<form:errors path="paystubNomal" cssClass="text-danger" element="span" /> --%>
														<input type="text" name="emp[${status.index }].paystubNomal" class="paystubNomal" />
													</td>

													<td>
<%-- 														<form:input type="text" path="paystubBonus" cssClass="paystubBonus"  /> --%>
<%-- 														<form:errors path="paystubBonus" cssClass="text-danger" element="span" /> --%>
														<input type="text" name="emp[${status.index }].paystubBonus" class="paystubBonus" />
													</td>
													<td>
														<input type="text" name="emp[${status.index }].paystubOvertime" class="paystubOvertime" />
<%-- 														<form:input type="text" path="paystubOvertime" cssClass="paystubOvertime"  /> --%>
<%-- 														<form:errors path="paystubOvertime" cssClass="text-danger" element="span" /> --%>
													</td>
													<td>
														<input type="text" name="emp[${status.index }].paystubTotal" class="paystubTotal" />
<%-- 														<form:input type="text" path="paystubTotal"  cssClass="paystubTotal" /> --%>
<%-- 														<form:errors path="paystubTotal" cssClass="text-danger" element="span" /> --%>
													</td>
													<td>
														<input type="text" name="emp[${status.index }].deductible" class="deductible" />
<%-- 														<form:input type="text" path="deductible"  cssClass="deductible" /> --%>
<%-- 														<form:errors path="deductible" cssClass="text-danger" element="span" /> --%>
													</td>

													<td>
														<input type="text" name="emp[${status.index }].paystubNaPen" class="paystubNaPen" />
<%-- 														<form:input type="text" path="paystubNaPen" cssClass="paystubNaPen"  /> --%>
<%-- 														<form:errors path="paystubNaPen" cssClass="text-danger" element="span" /> --%>
													</td>
													<td>
														<input type="text" name="emp[${status.index }].paystubHeIns" class="paystubHeIns" />
<%-- 														<form:input type="text" path="paystubHeIns"  cssClass="paystubHeIns" /> --%>
<%-- 														<form:errors path="paystubHeIns" cssClass="text-danger" element="span" /> --%>
													</td>

													<td>
														<input type="text" name="emp[${status.index }].paystubEmpIns" class="paystubEmpIns" />
<%-- 														<form:input type="text" path="paystubEmpIns" cssClass="paystubEmpIns"  /> --%>
<%-- 														<form:errors path="paystubEmpIns" cssClass="text-danger" element="span" /> --%>
													</td>
													<td>
														<input type="text" name="emp[${status.index }].paystubLongIns" class="paystubLongIns" />
<%-- 														<form:input type="text" path="paystubLongIns" cssClass="paystubLongIns"  /> --%>
<%-- 														<form:errors path="paystubLongIns" cssClass="text-danger" element="span" /> --%>
													</td>
													<td>
														<input type="text" name="emp[${status.index }].paystubIncomeTax" class="paystubIncomeTax" />
<%-- 														<form:input type="text" path="paystubIncomeTax" cssClass="paystubIncomeTax"  /> --%>
<%-- 														<form:errors path="paystubIncomeTax" cssClass="text-danger" element="span" /> --%>
													</td>
													<td>
														<input type="text" name="emp[${status.index }].paystubLoIncomeTax" class="paystubLoIncomeTax" />
<%-- 														<form:input type="text" path="paystubLoIncomeTax"  cssClass="paystubLoIncomeTax" /> --%>
<%-- 														<form:errors path="paystubLoIncomeTax" cssClass="text-danger" element="span" /> --%>
													</td>


													<td>
														<input type="text" name="emp[${status.index }].paystubRealtotal" class="paystubRealtotal" />
<%-- 														<form:input type="text" path="paystubRealtotal"  cssClass="paystubRealtotal" /> --%>
<%-- 														<form:errors path="paystubRealtotal" cssClass="text-danger" element="span" /> --%>
													</td>
												</tr>
											</c:forEach>
										</tbody>
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

<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", () => {

		const contextPath = document.body.dataset.contextPath;

		let sal = document.querySelectorAll(".empsal-input");

		let basic = document.querySelectorAll(".paystubNomal");
		let overTime = document.querySelectorAll(".paystubOvertime");
		let bonus = document.querySelectorAll(".paystubBonus");
		let total = document.querySelectorAll(".paystubTotal");
		let dedu = document.querySelectorAll(".deductible");
		let naPen = document.querySelectorAll(".paystubNaPen");
		let heIns = document.querySelectorAll(".paystubHeIns");
		let empIns = document.querySelectorAll(".paystubEmpIns");
		let longIns = document.querySelectorAll(".paystubLongIns");
		let tax = document.querySelectorAll(".paystubIncomeTax");
		let localTax = document.querySelectorAll(".paystubLoIncomeTax");
		let totaltotal = document.querySelectorAll(".paystubRealtotal");

		const insertBtn = document.getElementById('auto-insert');

		const input = document.querySelectorAll('input');

		const submitBtn = document.getElementById('pay-submit');

		input.forEach(function (inputElement) {
			inputElement.addEventListener('keyup', function (e) {
				let value = e.target.value.replaceAll(',', '');
				value = Number(value);

				if (isNaN(value)) {
					e.target.value = 0;
				} else {
					const formatValue = value.toLocaleString('ko-KR');
					e.target.value = formatValue;
				}
			});
		});

		function formatNumber(value) {
		    return value.toLocaleString('ko-KR');
		}

		function cal(){
			sal.forEach(function (sal, index) {
				basic[index].value = Number(Math.round(sal.value / 12));

// 				let basicValue = Number(basic[index].value);
// 				let overTimeValue = Number(overTime[index].value);

// 				let bonusValue = Number(bonus[index].value);

				let basicValue = basic[index].value.replace(/,/g, '');
				let overTimeValue = overTime[index].value.replace(/,/g, '');
				let bonusValue = bonus[index].value.replace(/,/g, '');

				let basicNum = Number(basicValue);
				let overTimeNum = Number(overTimeValue);
				let bonusNum = Number(bonusValue);

				total[index].value = Math.round(basicNum + overTimeNum + bonusNum);

				naPen[index].value = Math.round(basicNum * (${speList[0].speNaPen} / 100));
				heIns[index].value = Math.round(basicNum * (${speList[0].speHeIns} / 100));
				empIns[index].value = Math.round(basicNum * (${speList[0].speEmpIns} / 100));
				longIns[index].value = Math.round(basicNum * (${speList[0].speLongIns} / 100));
				tax[index].value = Math.round(basicNum * (${speList[0].speIncomeTax} / 100));
				localTax[index].value = Math.round(Number(tax[index].value) * (${speList[0].speLoIncomeTax} / 100));

				dedu[index].value = Math.round(Number(naPen[index].value) + Number(heIns[index].value) + Number(empIns[index].value) + Number(longIns[index].value) + Number(tax[index].value) + Number(localTax[index].value));
	 			totaltotal[index].value = Math.round(Number(total[index].value) - Number(dedu[index].value));

	 			if(overTime[index].value == ""){
	 				overTime[index].value = 0;
	 			}
	 			if(bonus[index].value == ""){
	 				bonus[index].value = 0;
	 			}

	 			basic[index].value = formatNumber(Math.round(sal.value / 12));
	 			total[index].value = formatNumber(Number(total[index].value));
	 			naPen[index].value = formatNumber(Number(naPen[index].value));
	 			empIns[index].value = formatNumber(Number(empIns[index].value));
	 			longIns[index].value = formatNumber(Number(longIns[index].value));
	 			heIns[index].value = formatNumber(Number(heIns[index].value));
	 			tax[index].value = formatNumber(Number(tax[index].value));
	 			localTax[index].value = formatNumber(Number(localTax[index].value));
	 			dedu[index].value = formatNumber(Number(dedu[index].value));
	 			totaltotal[index].value = formatNumber(Number(totaltotal[index].value));

			});
		}

		window.onload = function(){
			cal();
		};

		insertBtn.addEventListener("click", cal);

		submitBtn.addEventListener("click", cal);



        const startDateInput = document.getElementById('paystubStdate');
        const endDateInput = document.getElementById('paystubEnddate');

    	let date = new Date();
		// 이번달 나타내는 코드
// 		let firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
// 		let lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
		// 전달 나타내는 코드
		let firstDay = new Date(date.getFullYear(), date.getMonth() - 1, 1);
		let lastDay = new Date(date.getFullYear(), date.getMonth(), 0);

		firstDay.setDate(firstDay.getDate() + 1);
		lastDay.setDate(lastDay.getDate() + 1);

		console.log(firstDay);
		console.log(lastDay);

        startDateInput.value = firstDay.toISOString().slice(0, 10);
        endDateInput.value = lastDay.toISOString().slice(0, 10);

        function validateDates() {
            const startDateValue = startDateInput.value;
            const endDateValue = endDateInput.value;

        	if (startDateValue > endDateValue || startDateValue == endDateValue) {
        		swal("시작 날짜는 종료 날짜보다 이전이어야 합니다.", "", {
                    icon: "info",
                    buttons: {
                      confirm: {
                        className: "btn btn-info",
                      },
                    },
                  });
                endDateInput.value = '';
            }

        }

        endDateInput.addEventListener('change', validateDates);


		function create2DObjectArray(arr, chunkSize) {
		  const result = [];
		  let i = 0;
		  while (i < arr.length) {
		    const chunk = arr.slice(i, i + chunkSize);
		    result.push(chunk.map(item => ({
		    	value: item
		    	})));
		    i += chunkSize;
		  }
		  return result;
		}

		function create2DObjectArray(arr, chunkSize) {
		  const result = [];
		  let i = 0;
		  while (i < arr.length) {
		    const chunk = arr.slice(i, i + chunkSize);
		    result.push(chunk.map(item => ({
		      value: item
		    })));
		    i += chunkSize;
		  }
		  return result;
		}

		payForm.addEventListener("submit", function(e){
			e.preventDefault();

			let emps = e.target.querySelectorAll(".empIds");
			let empIds = [];

			let inps = e.target.querySelectorAll("input[type='text']");
			let inpsVal = [];

			let dates = e.target.querySelectorAll("input[type='date']");
			let inpDate = [];

			emps.forEach((emp)=>{
				empIds.push(emp.value);
			})

			inps.forEach((inp)=>{
				inpsVal.push(inp.value);
			})

			dates.forEach((dat)=>{
				inpDate.push(dat.value);
			})

			let inp2Darr = create2DObjectArray(inpsVal, 12);

			let paystubList = [];

			// 각 인덱스에 대해 JSON 객체 생성
			for (let i = 0; i < inp2Darr.length; i++) {
			  paystubList.push({
			    paystubId: '', // paystubId를 빈 문자열로 초기화
			    empId: empIds[i], // 직원 ID가 부족할 경우 순환
			    speId: '1', // speId를 빈 문자열로 초기화
			    paystubPaydate: inpDate[0] || '',
			    paystubStdate: inpDate[1] || '',
			    paystubEnddate: inpDate[2] || '',
			    paystubNomal: parseInt((inp2Darr[i][0]?.value || '').replace(/,/g, ''), 10) || 0,
			    paystubBonus: parseInt((inp2Darr[i][1]?.value || '').replace(/,/g, ''), 10) || 0,
			    paystubOvertime: parseInt((inp2Darr[i][2]?.value || '').replace(/,/g, ''), 10) || 0,
			    paystubTotal: parseInt((inp2Darr[i][3]?.value || '').replace(/,/g, ''), 10) || 0,
			    paystubNaPen: parseInt((inp2Darr[i][5]?.value || '').replace(/,/g, ''), 10) || 0,
			    paystubHeIns: parseInt((inp2Darr[i][6]?.value || '').replace(/,/g, ''), 10) || 0,
			    paystubEmpIns: parseInt((inp2Darr[i][7]?.value || '').replace(/,/g, ''), 10) || 0,
			    paystubLongIns: parseInt((inp2Darr[i][8]?.value || '').replace(/,/g, ''), 10) || 0,
			    paystubIncomeTax: parseInt((inp2Darr[i][9]?.value || '').replace(/,/g, ''), 10) || 0,
			    paystubLoIncomeTax: parseInt((inp2Darr[i][10]?.value || '').replace(/,/g, ''), 10) || 0,
			    deductible: parseInt((inp2Darr[i][4]?.value || '').replace(/,/g, ''), 10) || 0,
			    paystubRealtotal: parseInt((inp2Darr[i][11]?.value || '').replace(/,/g, ''), 10) || 0
			  });
			}


// 			console.log("paystubList : ", paystubList);

// 			axios.post(`\${contextPath}/paystub/paystubInsert.do`, {
// 				paystubList:paystubList
// 			}).then(function(res){
// 				console.log(res);
// 			}).catch(function(error){
// 				console.log(error);
// 			})


			fetch(`\${contextPath}/paystub/paystubInsert.do`, {
				method:"post",
				headers:{
					"accept":"text/html",
					"Content-Type":"application/json"
				},
				body:JSON.stringify(paystubList)
			}).then(resp => {
				resp.text().then(rslt => {
					if (rslt == "ok") {
						swal("등록이 완료되었습니다", "", {
			                icon: "success",
			                buttons: {
			                  confirm: {
			                    className: "btn btn-success",
			                  },
			                },
			              }).then(function(result){ //  창 꺼질때 실행할 함수
			              	// 	console.log(result);
			  	    		if(result) {
								window.location.href = contextPath + "/paystub/paystubList.do";
			  	    	    }
			  		    });
					}else {
						swal("등록 중 오류가 발생했습니다", "", {
			                icon: "error",
			                buttons: {
			                  confirm: {
			                    className: "btn btn-danger",
			                  },
			                },
			              }).then(function(result){ //  창 꺼질때 실행할 함수
			              	// 	console.log(result);
			  	    		if(result) {
								window.location.href = contextPath + "/paystub/paystubInsert.do";
			  	    	    }
			  		    });
					}

				})
			})

// 			console.log("test1 : ", inps);
// 			console.log("test2 : ", emps);
// 			console.log("test2 : ", dates);
// 			console.log("test3 : ", empIds);
// 			console.log("test4 : ", inpsVal);
// 			console.log("test4 : ", inpDate);
// 			console.log("test5 : ", inp2Darr);
// 			console.log("test6 : ", paystubList[0]);
// 			console.log("test7 : ", paystubList);
// 			console.log("test8 : ", contextPath);

		});

	});
</script>