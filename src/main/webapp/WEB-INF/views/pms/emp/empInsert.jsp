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
						<h3 class="fw-bold mb-3">직원 등록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 등록</a></li>
						</ul>
					</div>
					<form:form method="post" modelAttribute="emp" cssClass="overflow-scroll">
						<div class="table-top-box side">
							<nav class="button-box table-nav">
								<button type="button" class="btn btn-primary" id="empInsert-ex">시연용데이터</button>
							</nav>
							<nav class="button-box table-nav">
								<button type="submit" class="btn btn-primary" id="empInsert">저장</button>
								<a href="<c:url value='/emp/empList.do' />" class="btn btn-primary">취소</a>
							</nav>
						</div>
						<div class="page-body">
							<div class="m-table-outer">
								<div class="m-table-inner">
									<table class="text-left-td" id="emp-table">
										<colgroup>
											<col width="10%" />
											<col width="40%" />
											<col width="10%" />
											<col width="40%" />
										</colgroup>
										<tr>
											<th>사번</th>
											<td colspan="3">
<!-- 												<button type="button" id="empIdbtn" class="btn btn-primary">사번생성</button> -->
												<form:input type="text" path="empId" readonly="true" id="empId" placeholder="입사일을 입력하고 사번생성 버튼을 누르세요" />
												<form:errors path="empId" cssClass="text-danger" element="p" />
												<div>
<!-- 													<span>사번 생성 버튼을 누르면 나머지 번호는 자동생성 됩니다.</span> -->
												</div>
											</td>
										</tr>
										<tr>
											<th>사원이름</th>
											<td colspan="3">
												<form:input type="text" path="empName" />
												<form:errors path="empName" cssClass="text-danger" element="p" />
											</td>
										</tr>
										<tr>
											<th>입사일</th>
											<td>
												<button type="button" id="empIdbtn" class="btn btn-primary">사번생성</button>
												<form:input type="date" path="empHirdate" id="hirdate" />
												<form:errors path="empHirdate" cssClass="text-danger" element="p" />
											</td>
											<th>생년월일</th>
											<td>
												<form:input type="date" path="empBir" />
												<form:errors path="empBir" cssClass="text-danger" element="p" />
											</td>
										</tr>
										<tr>
											<th>부서</th>
											<td>
<%-- 												<form:input type="text" path="depId" id="depId" /> --%>
<%-- 												<form:errors path="depId" cssClass="text-danger" element="span" /> --%>
												<div class="custom-select w-100">
													<select name="depId">
														<option value>부서선택</option>
														<c:forEach items="${deptList }" var="dept">
															<option label="${dept.depNm }" value="${dept.depId }">${dept.depNm }</option>
														</c:forEach>
													</select>
												</div>
												<form:errors path="depId" cssClass="text-danger" element="p" />
											</td>
											<th>직책</th>
											<td>
<%-- 												<form:input type="text" path="posiId" id="posiId" /> --%>
<%-- 												<form:errors path="posiId" cssClass="text-danger" element="span" /> --%>
												<div class="custom-select w-100">
													<select name="posiId">
														<option value>직책</option>
														<c:forEach items="${posiList }" var="posi">
															<option label="${posi.posiNm }" value="${posi.posiId }">${posi.posiNm }</option>
														</c:forEach>
													</select>
												</div>
												<form:errors path="posiId" cssClass="text-danger" element="p" />
											</td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td colspan="3">
												<form:input type="text" path="empTel" maxlength="13" placeholder="-없이 입력해주세요" />
												<form:errors path="empTel" cssClass="text-danger" element="p" />
											</td>
										</tr>
										<tr>
											<th>성별</th>
											<td colspan="3">
<%-- 												<form:input type="text" path="empGen" /> --%>
<%-- 												<form:errors path="empGen" cssClass="text-danger" element="span" /> --%>
												<div class="d-flex">
													<div class="input-radio-div">
														<form:radiobutton path="empGen" value="남" label="남"  />
													</div>
													<div class="input-radio-div">
														<form:radiobutton path="empGen" value="여" label="여" />
													</div>
												</div>
												<form:errors path="empGen" cssClass="text-danger" element="p" />
											</td>
										</tr>
										<tr>
											<th>연봉</th>
											<td colspan="3">
												<input type="text" name="empSal" id="empSal" />
												<form:errors path="empSal" cssClass="text-danger" element="p" />
											</td>
										</tr>
										<tr>
											<th>프로필 이미지</th>
											<td colspan="3">
												<div class="input-group">
												  <input type="file" class="form-control" id="inputGroupFile02" name="empFile">
												  <label class="input-group-text" for="inputGroupFile02"></label>
												</div>
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

<script>
	document.addEventListener("DOMContentLoaded", () => {

		const contextPath = document.body.dataset.contextPath;

	    const hirInput = document.getElementById('hirdate');
	    const empIdInput = document.getElementById('empId');
	    const empNameInput = document.getElementById('empName');
	    const empBirInput = document.getElementById('empBir');
	    const depIdInput = document.getElementById('depId');
	    const posiIdInput = document.getElementById('posiId');
	    const empTelInput = document.getElementById('empTel');
	    const empGenInput = document.getElementById('empGen');
	    const empGen = document.getElementsByName('empGen');
	    const empSalInput = document.getElementById('empSal');
	    const empIdBtn = document.querySelector('#empIdbtn');
	    const empSubmit = document.querySelector('#empInsert');
	    const empEx = document.querySelector('#empInsert-ex');

	    empEx.addEventListener("click", function(e){
	    	empNameInput.value = "이해찬";
	    	hirInput.value = "2024-09-02";
	    	empBirInput.value = "2000-04-18";
	    	empTelInput.value = "010-1345-9984";
	    	empSalInput.value = "30000000";
	    	empGen[0].checked = true;
		})

	    // 연봉 숫자 세자리 마다 , 찍기
		empSalInput.addEventListener('keyup', function (e) {
			let value = e.target.value.replaceAll(',', '');
			value = Number(value);

			if (isNaN(value)) {
				e.target.value = 0;
			} else {
				const formatValue = value.toLocaleString('ko-KR');
				e.target.value = formatValue;
			}
		});


	    // 휴대폰 - 정규식
	    function addHyphenToPhoneNumber(phoneNumberInput) {
	        const phoneNumber = phoneNumberInput.value;
	        const length = phoneNumber.length;

	        if(length >= 9) {
	            let numbers = phoneNumber.replace(/[^0-9]/g, "")
	            			.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	            phoneNumberInput.value = numbers;
	        }
	    }

	    empTelInput.addEventListener("input", () => {
	    	addHyphenToPhoneNumber(empTelInput);
	    });

	    // 사번 생성하는 버튼
	    empIdBtn.addEventListener("click", (e) => {
	        e.preventDefault();
	        if(!hirInput.value) {
// 	            alert("사번 생성하려면 입사일을 입력해주세요");
				swal("사번 생성하려면 입사일을 입력해주세요", "", {
                icon: "info",
                buttons: {
	                  confirm: {
	                    className: "btn btn-info",
	                  },
	                },
              })
	            return false;
	        }
	        const empHir = hirInput.value;

	        const year = empHir.substring(2, 4);
	        empIdInput.value=year + "A";
	    });


	    emp.addEventListener("submit", (e) => {
	    	e.preventDefault();

	    	if(!empIdInput.value == ""){
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
				    		emp.submit();
			    	    }
	  		    });
	    	}else {
	    		swal("첨부파일을 제외한 모든것이 입력 되어야합니다.", "", {
	                icon: "info",
	                buttons: {
		                  confirm: {
		                    className: "btn btn-info",
		                  },
		                },
	              })
	    	}

	    });

	});
</script>