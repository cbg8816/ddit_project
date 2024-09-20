<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<section>
	<div class="svisual payment">
		MILEAGE<br>
		<b>마일리지 조회</b><br><br>
		전체 마일리지 ${earn }&emsp;&emsp;사용 마일리지 ${fn:split(use,'-')[0] }&emsp;&emsp;현재 마일리지 ${total }
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
					<col width="10%" />
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr>
						<td>NO</td>
						<td>객실타입</td>
						<td>마일리지 내역</td>
						<td>적립 / 사용 일자</td>
						<td>적립 / 사용 마일리지</td>
					</tr>
				</thead>
				<tbody id="list-body">
					<c:choose>
						<c:when test="${not empty milList }">
							<c:forEach items="${milList }" var="mil">
								<c:set value="${i+1 }" var="i"/>
								<tr>
									<td>${i }</td>
									<td>${mil.roomtypeNm }</td>
									<td>${mil.milContent }</td>
									<td>${mil.milRegdate }</td>
									<td>
										<c:if test="${mil.milYn eq 'N' }">
											+${mil.milAmount }
										</c:if>
										<c:if test="${mil.milYn eq 'Y' }">
											${mil.milAmount }
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">마일리지 내역이 없습니다.</td>
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