<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<section>
	<div class="svisual payment">
		<b>개인정보 수정</b>
	</div>

	<div class="container pay-content">
		<div class="row">
			<form:form method="post" modelAttribute="member">
			<form:hidden path="memLoginId"/>
				<table class="pay-res-info" id="inquire-page">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tr>
						<th>성명</th>
						<td>
							<form:input type="text" path="memName" class="form-control"/>
							<form:errors path="memName" cssClass="text-danger" element="span" />
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<form:input type="text" path="memTel" class="form-control"/>
							<form:errors path="memTel" cssClass="text-danger" element="span" />
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<form:input type="text" path="memEmail" class="form-control"/>
							<form:errors path="memEmail" cssClass="text-danger" element="span" />
						</td>
					</tr>
				</table>
					<div class="login-div" id="inquire-detail">
					<button id="inquire-btn-de" class="login-btn" type="submit">수정</button>
					<button id="inquire-btn-de" class="login-btn" type="button" onclick="list()">뒤로</button>
					</div>
			</form:form>
		</div>
	</div>

</section>
<script type="text/javascript">
function list(){
	location.href="javascript:history.back()";
}
</script>