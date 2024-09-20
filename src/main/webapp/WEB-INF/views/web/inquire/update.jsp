<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<section>
	<div class="svisual payment">
		INQUIRE <br> <b>이용문의 수정</b>
	</div>

	<div class="container pay-content">
		<div class="row">
			<form:form method="post" modelAttribute="inquire">
				<form:hidden path="inqNo"/>
				<table class="pay-res-info" id="inquire-page">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tr>
						<th>구분</th>
						<td><form:select path="inqCategory" class="form-control">
								<form:option value="" label="카테고리" />
								<form:option value="1" label="이용문의" />
								<form:option value="2" label="불만사항" />

							</form:select> <form:errors path="inqCategory" cssClass="text-danger"
								element="span" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><form:input type="text" path="inqTitle"
								class="form-control" /> <form:errors path="inqTitle"
								cssClass="text-danger" element="span" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><form:input type="text" path="inqContent"
								class="form-control" /> <form:errors path="inqContent"
								cssClass="text-danger" element="span" /></td>
					</tr>
					<tr>
						<th>공개 여부</th>
						<td><form:select path="inqLock" class="form-control">
								<form:option value="1" label="공개" />
								<form:option value="2" label="비공개" />
							</form:select></td>
					</tr>
				</table>
					<div class="login-div" id="inquire-detail">
					<button id="inquire-btn-de" class="login-btn" type="submit">수정</button>
					<button id="inquire-btn-de" class="login-btn" type="button" onclick="list()">취소</button>
					</div>
			</form:form>
		</div>
	</div>

</section>
<script type="text/javascript">
function list(){
	location.href="${cPath}/web/inquire/detail.do?what=${inquire.inqNo}";
}
</script>