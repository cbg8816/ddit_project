<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">사내 공지사항 상세보기</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">사내 공지사항</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">사내 공지사항 상세보기</a></li>
						</ul>
					</div>
					<div class="table-top-box right-side">
						<nav class="button-box table-nav">
							<c:url value="/empNotice/empNoticeUpdate.do" var="updateUrl">
								<c:param name="what" value="${empNotice.empnotiNo }"></c:param>
							</c:url>
							<a href="${updateUrl }" class="btn btn-primary">수정</a>
<%-- 							<c:url value="/empNotice/empNoticeDelete.do" var="deleteUrl"> --%>
<%-- 								<c:param name="what" value="${empNotice.empnotiNo }"></c:param> --%>
<%-- 							</c:url> --%>
<%-- 							<a href="${deleteUrl }" class="btn btn-primary" id="delete">삭제</a> --%>
							<button type="button" class="btn btn-primary" id="delete">삭제</button>
							<a href="<c:url value='/empNotice/empNoticeList.do' />" class="btn btn-primary">목록</a>
						</nav>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
<!-- 								<table> -->
<!-- 									<tr> -->
<!-- 										<th>제목</th> -->
<%-- 										<td>${empNotice.empnotiTitle }</td> --%>
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<th>작성자</th> -->
<%-- 										<td>${empNotice.emonotiWriter }</td> --%>
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<th>내용</th> -->
<%-- 										<td>${empNotice.empnotiContent }</td> --%>
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<th>작성일</th> -->
<%-- 										<td>${empNotice.empnotiDate }</td> --%>
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<th>첨부파일</th> -->
<%-- 										<td>${empNotice.empnotiFile }</td> --%>
<!-- 									</tr> -->
<!-- 								</table> -->
								<div class="empNotice-detail-content">
									<div class="empNotice-title">
										<p class="n-title">${empNotice.empnotiTitle }</p>
										<div class="d-flex">
											<p class="n-writer">작성자 : ${empNotice.emonotiWriter }</p>
											<span class="line"></span>
											<p class="n-date">작성일 : ${empNotice.empnotiDate }</p>
										</div>
									</div>
									<div class="empNotice-content">
										<p class="n-content" style="white-space: pre-line;">${empNotice.empnotiContent }</p>
									</div>
									<div class="empNotice-file">
										<div class="n-file">
											<p>첨부파일</p>
											${empNotice.empnotiFile }
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
document.addEventListener("DOMContentLoaded", () => {
	const empdel = document.querySelector("#delete");
	empdel.addEventListener("click", function(){
		swal({
            title: "정말로 삭제하시겠습니까?",
            text: "삭제한 게시물은 복원할 수 없습니다",
            type: "warning",
            buttons: {
              confirm: {
                text: "삭제",
                className: "btn btn-success",
              },
              cancel: {
            	text: "취소",
                visible: true,
                className: "btn btn-danger",
              },
            },
          }).then((Delete) => {
            if (Delete) {
              swal({
            	icon: "success",
                title: "삭제가 완료되었습니다",
                text: "",
                type: "success",
                buttons: {
                  confirm: {
                    className: "btn btn-success",
                  },
                },
              }).then(function(result){ //  창 꺼질때 실행할 함수
	              	// 	console.log(result);
	  	    		if(result) {
						window.location.href = "${cPath}/empNotice/empNoticeDelete.do?what=${empNotice.empnotiNo }";
	  	    	    }
	  		    });
            } else {
              swal.close();
            }
          });
	});
});

</script>