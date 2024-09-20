<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<section>
	<div class="svisual payment">
		INQUIRE<br> <b>나의 이용문의</b> <br>
	</div>

	<div class="container pay-content">
		<div class="row">

			<div class="pay-res-info-top">
				<div id="searchUI">

				</div>
				<div class="login-div" id="inquire-btns">
					<form>
						<button id="inquire-btn" class="login-btn"
						type="button" onclick="location.href='${cPath}/web/inquire/insert.do'">
						문의하기
						</button>
					</form>
				</div>
			</div>

			<table class="pay-res-info" id="inquire-page">
				<colgroup>
					<col width="5%" />
					<col width="15%" />
					<col width="40%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tbody id="list-body">
					<c:choose>
						<c:when test="${not empty inquireList }">
							<c:forEach items="${inquireList }" var="inquire">
								<tr>
								<c:choose>
									<c:when test="${inquire.inqLock eq 2 }">
										<td><i class='fa-solid fa-lock'></i></td>
									</c:when>
									<c:otherwise>
										<td></td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${inquire.inqCategory eq 1 }">
										<td>이용문의</td>
									</c:when>
									<c:otherwise>
										<td>불만사항</td>
									</c:otherwise>
								</c:choose>
									<td><a href='${cPath}/web/inquire/detail.do?what=${inquire.inqNo}'>${inquire.inqTitle}</a></td>
									<td>${inquire.inqWriter}</td>
									<td>${inquire.inqRegdate}</td>
									<c:choose>
									<c:when test="${not empty inquire.inqComment}">
										<td>답변완료</td>
									</c:when>
									<c:otherwise>
										<td></td>
									</c:otherwise>
								</c:choose>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">문의내역이 없습니다.</td>
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