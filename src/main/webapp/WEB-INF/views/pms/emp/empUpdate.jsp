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
						<h3 class="fw-bold mb-3">직원 정보 수정</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 정보 수정</a></li>
						</ul>
					</div>
					<form:form modelAttribute="emp" cssClass="overflow-scroll">
						<div class="table-top-box right-side">
							<nav class="button-box table-nav">
								<button type="submit" class="btn btn-primary" id="empUpdate">저장</button>
								<a href="<c:url value='/emp/empList.do' />" class="btn btn-primary">취소</a>
							</nav>
						</div>
						<div class="page-body">
							<div class="m-table-outer">
								<div class="m-table-inner">
									<table class="text-left-td">
										<colgroup>
											<col width="20%" />
											<col width="30%" />
											<col width="20%" />
											<col width="30%" />
										</colgroup>
										<tr>
											<th>사번</th>
											<td colspan="3">
												<form:input type="text" path="empId" readonly="true" id="empId" />
												<form:errors path="empId" cssClass="text-danger" element="span" />
											</td>
										</tr>
										<tr>
											<th>사원이름</th>
											<td colspan="3">
												<form:input type="text" path="empName"  />
												<form:errors path="empName" cssClass="text-danger" element="span" />
												<form:input type="hidden" path="empPw"/>
											</td>
										</tr>
										<tr>
											<th>입사일</th>
											<td>
												<form:input type="date" path="empHirdate" id="hirdate" />
												<form:errors path="empHirdate" cssClass="text-danger" element="span" />
											</td>
											<th>생년월일</th>
											<td>
												<form:input type="date" path="empBir" />
												<form:errors path="empBir" cssClass="text-danger" element="span" />
											</td>
										</tr>
										<tr>
											<th>부서</th>
											<td>
<%-- 												<form:input type="text" path="depId" id="depId" /> --%>
<%-- 												<form:errors path="depId" cssClass="text-danger" element="span" /> --%>
												<div class="custom-select w-100">
													<form:select path="depId">
														<form:option value="" label="부서 선택" />
														<c:forEach items="${deptList }" var="dept">
															<form:option label="${dept.depNm }" value="${dept.depId }"  />
														</c:forEach>
													</form:select>
												</div>
												<form:errors path="depId" cssClass="text-danger" element="span" />
											</td>
											<th>직책</th>
											<td>
<%-- 												<form:input type="text" path="posiId" id="posiId" /> --%>
<%-- 												<form:errors path="posiId" cssClass="text-danger" element="span" /> --%>
												<div class="custom-select w-100">
													<form:select path="posiId">
														<form:option value="" label="직책" />
														<c:forEach items="${posiList }" var="posi">
															<form:option label="${posi.posiNm }" value="${posi.posiId }" />
														</c:forEach>
													</form:select>
												</div>
												<form:errors path="posiId" cssClass="text-danger" element="span" />
											</td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td colspan="3">
												<form:input type="text" path="empTel" />
												<form:errors path="empTel" cssClass="text-danger" element="span" />
											</td>
										</tr>
										<tr>
											<th>퇴사여부</th>
											<td class="d-flex" colspan="3">
<%-- 												<form:input type="text" path="empGen" /> --%>
<%-- 												<form:errors path="empGen" cssClass="text-danger" element="span" /> --%>
												<div class="input-radio-div">
													<form:radiobutton path="empSta" value="Y" label="재직중" />
												</div>
												<div class="input-radio-div">
													<form:radiobutton path="empSta" value="N" label="퇴사" />
												</div>
												<form:errors path="empSta" cssClass="text-danger" element="span" />
												<div id="empire" style="display: none;">
													<form:input type="date" path="empRes" />
												</div>
											</td>
										</tr>
										<tr>
											<th>연봉</th>
											<td colspan="3">
												<form:input type="text" path="empSal" />
												<form:errors path="empSal" cssClass="text-danger" element="span" />
											</td>
										</tr>
										<tr>
											<th>파일</th>
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
	    const updateBtn = document.getElementById('empUpdate');
	    const radioButtons = document.querySelectorAll('input[name="empSta"]');
	    const empireDiv = document.getElementById('empire');
	    const empResInput = document.getElementById('empRes');

	    radioButtons.forEach(radioButton => {
	      radioButton.addEventListener('change', () => {
	        if (radioButton.value === 'N') {
	          empireDiv.style.display = 'block';
	        } else {
	          empireDiv.style.display = 'none';
	        }
	      });
	    });

	    updateBtn.addEventListener('click', (e)=>{
	    	e.preventDefault();
	    	if(empireDiv.style.display == 'block'){
		    	if(empResInput.value == "") {
		    		swal("퇴사일이 설정 되지 않았습니다", "", {
		                icon: "error",
		                buttons: {
		                  confirm: {
		                    className: "btn btn-danger",
		                  },
		                },
		              });
		    	}else {
		    		swal("수정이 완료되었습니다", "", {
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
		    	}
	    	}else {
	    		swal("수정이 완료되었습니다", "", {
	                icon: "success",
	                buttons: {
	                  confirm: {
	                    className: "btn btn-success",
	                  },
	                },
	              }).then(function(result){ //  창 꺼질때 실행할 함수
	// 	            	console.log(result);
	  		    		if(result) {
					    		emp.submit();
	  		    	    }
	    		    });
	    	}
	    });



	});
</script>