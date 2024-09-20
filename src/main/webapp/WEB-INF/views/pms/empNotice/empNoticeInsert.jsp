<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">사내 공지사항 등록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">사내 공지사항</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">사내 공지사항 등록</a></li>
						</ul>
					</div>
					<form:form method="post" modelAttribute="empNotice">
						<div class="table-top-box right-side">
							<nav class="button-box table-nav">
								<button type="submit" class="btn btn-primary" id="noticeInsert">저장</button>
								<a href="<c:url value='/empNotice/empNoticeList.do' />" class="btn btn-primary">취소</a>
							</nav>
						</div>
						<div class="page-body">
							<div class="m-table-outer">
								<div class="m-table-inner">
									<table>
										<tr>
											<th>공지사항 제목</th>
											<td>
												<form:input type="text" path="empnotiTitle"  />
												<form:errors path="empnotiTitle" cssClass="text-danger" element="span" />
											</td>
											<th>작성자</th>
											<td>
												<form:input type="text" path="emonotiWriter" value="${empvo.empName }" readonly="true" />
												<form:errors path="emonotiWriter" cssClass="text-danger" element="span" />
											</td>
										</tr>
										<tr>
											<th>공지사항 내용</th>
											<td colspan="3">
												<form:textarea path="empnotiContent" rows="15" />
												<form:errors path="empnotiContent" cssClass="text-danger" element="span" />
											</td>
										</tr>
										<tr>
											<th>파일</th>
											<td colspan="3">
												<div class="input-group">
												  <input type="file" class="form-control" id="inputGroupFile02">
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
	const InsertBtn = document.querySelector("#noticeInsert");

	InsertBtn.addEventListener('click', (e)=>{
		e.preventDefault();
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
	    			empNotice.submit();
	    	    }
		    });
	});
});
</script>