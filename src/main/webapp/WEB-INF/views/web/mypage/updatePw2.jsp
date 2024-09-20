<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<section>
	<div class="svisual payment">
		<b>비밀번호 변경</b>
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
						<th>비밀번호</th>
						<td>
							<form:input type="text" path="memLoginPw" class="form-control"/>
							<form:errors path="memLoginPw" cssClass="text-danger" element="span" />
						</td>
					</tr>
				</table>
					<div class="login-div" id="inquire-detail">
					<button id="inquire-btn-de" class="login-btn" type="submit">변경</button>
					<button id="inquire-btn-de" class="login-btn" type="button" onclick="list()">뒤로</button>
					</div>
			</form:form>
		</div>
	</div>

</section>
<script type="text/javascript">
let pw = document.querySelector("#memLoginPw");
pw.value = "";

function list(){
	location.href="javascript:history.back()";
}
</script>