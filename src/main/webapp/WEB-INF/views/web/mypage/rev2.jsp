<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<section>
	<div class="svisual payment">
		RESERVATION<br> <b>예약 조회 / 취소</b> <br>
	</div>

	<div class="container pay-content">
		<div class="row">

			<div class="pay-res-info-top">
				<div id="searchUI">

				</div>
				<div class="login-div" id="inquire-btns">
				</div>
			</div>

			<table class="pay-res-info" id="inquire-page">
				<colgroup>
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
				</colgroup>
				<thead>
					<tr>
						<td>예약번호</td>
						<td>객실타입</td>
						<td>예약일</td>
						<td>투숙일</td>
						<td>퇴실일</td>
						<td>숙박일</td>
						<td>결제금액</td>
					</tr>
				</thead>
				<tbody id="list-body">
					<c:choose>
						<c:when test="${not empty revList }">
							<c:forEach items="${revList }" var="rev">
								<tr>
									<td>${rev.htrevId }</td>
									<td>${rev.roomtypeNm }</td>
									<td>${rev.trevDate }</td>
									<td>${rev.htrevChkin }</td>
									<td>${rev.htrevChkout }</td>
									<td>${rev.htrevStay }</td>
									<td>${rev.htrevTprice }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">예약내역이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
							<div class="paging-area">
								${pagingHTML }
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			<form:form id="searchform" method="get">
				<input type="hidden" name="what" value="${autentication.principal.realUser.memId }" />
				<input type="hidden" name="page" />
			</form:form>
		</div>
	</div>

</section>
<script
	src="${pageContext.request.contextPath }/resources/js/app/utils/paging.js"></script>