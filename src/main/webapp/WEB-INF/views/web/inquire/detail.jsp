<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:if test="${not empty message }">
<script>
	swal("${message}", "", "success");

</script>
<c:remove var="message" scope="session"/>
</c:if>

<section>
	<div class="svisual payment">
		INQUIRE<br> <b>이용문의 상세내역</b>
	</div>

	<div class="container pay-content">
		<div class="row">

			<table class="pay-res-info" id="inquire-page">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
					<tr>
						<th>구분</th>
						<td>${inquire.inqCategory eq 1 ? "이용문의" : "불만사항"}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${inquire.inqTitle}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${inquire.inqContent}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${inquire.inqRegdate}</td>
					</tr>
					<c:if test="${not empty inquire.inqComment}">
					<tr>
						<th>답변</th>
						<td>${inquire.inqComment}</td>
					</tr>
					</c:if>
			</table>
			<div class="login-div" id="inquire-detail">

			<c:if test="${autentication.principal.realUser.memId eq inquire.memId }">
				<button id="inquire-btn-de" class="login-btn" type="button" onclick="upd()">수정</button>
				<button id="inquire-btn-de" class="login-btn" type="button" onclick="del()">삭제</button>
			</c:if>

			<button id="inquire-btn-de" class="login-btn" type="button" onclick="list()">목록</button>
			</div>
		</div>
	</div>

</section>
<script type="text/javascript">
function upd(){
	location.href="${cPath }/web/inquire/update.do?what=${inquire.inqNo}";
}

function del(){
	swal({
		  title: "삭제하시겠습니까?",
		  text: "",
		  icon: "info",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			location.href="${cPath }/web/inquire/delete.do?what=${inquire.inqNo }";
		  } else {
		    swal("취소되었습니다.");
		  }
		})
}

function list(){
	location.href="${cPath }/web/inquire/list.do";
}
</script>