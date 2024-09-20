<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<input type="hidden" id="principal" value="${autentication.principal.realUser.memId }"/>

<c:if test="${not empty message }">
<script>
	swal("${message}", "", "success");

</script>
<c:remove var="message" scope="session"/>
</c:if>

<section>
	<div class="svisual payment">
		INQUIRY<br> <b>이용문의</b> <br>
		<security:authorize access="!isAuthenticated()">
			로그인 후 문의해주세요.
		</security:authorize>
	</div>
	<div class="container pay-content">
		<div class="row">
			<div class="flex-basic" style="margin-bottom: 1rem;">
				<div id="searchUI" class="d-flex">
					<div class="custom-select">
						<form:select path="condition.searchType">
							<form:option value="" label="제목 + 내용"></form:option>
							<form:option value="" label="제목 + 내용"></form:option>
							<form:option value="title" label="제목"></form:option>
							<form:option value="content" label="내용"></form:option>
						</form:select>
					</div>
					<div class="d-flex ms-2" style="position: relative;">
						<form:input path="condition.searchWord" cssClass="form-control" />
						<button id="searchBtn" class="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
					</div>
				</div>

				<div class="login-div" id="inquire-btns" style="margin-bottom: 0;">
					<form>
						<button id="inquire-btn" class="login-btn" type="button" style="margin-top: 0;">문의하기</button>
					</form>
				</div>

			</div>
			<table class="pay-res-info" id="inquire-page">
				<colgroup>
					<col width="5%" />
					<col width="20%" />
					<col width="35%" />
					<col width="10%" />
					<col width="20%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>구분</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="list-body">

				</tbody>
<!-- 				<tfoot> -->
<!-- 					<tr> -->
<!-- 						<td colspan="6"> -->
<!-- 							<div class="paging-area"></div> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 				</tfoot> -->
			</table>
			<div class="paging">
				<div class="paging-area"></div>
			</div>
			<form:form id="searchform" method="get" modelAttribute="condition">
				<form:input path="searchType" type="hidden" />
				<form:input path="searchWord" type="hidden" />
				<input type="hidden" name="page" />
			</form:form>
		</div>
	</div>

</section>
<script
	src="${pageContext.request.contextPath }/resources/js/app/utils/paging.js"></script>
<script src="${cPath }/resources/js/app/web/inquire/list.js"></script>