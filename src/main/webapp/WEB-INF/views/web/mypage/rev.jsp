<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="mypage">
	<div class="dummy"></div>
	<div class="container">
		<div class="row">
			<h3 class="page-title">예약 조회</h3>
			<div class="col-lg-2">
				<div class="mypage-menu">
					<h4>마이페이지</h4>
					<ul>
						<li><a class="active" href="${cPath}/web/revPage.do?what=${autentication.principal.realUser.memId}">예약 조회</a></li>
						<li><a href="${cPath}/web/milPage.do?what=${autentication.principal.realUser.memId}">마일리지 조회</a></li>
						<li><a href="${cPath }/web/inquirePage.do?what=${autentication.principal.realUser.memId}">나의 문의내역</a></li>
<!-- 						<li><a href="">즐겨찾기 조회 / 취소</a></li> -->
						<li><a href="${cPath }/web/updatePage.do?what=${autentication.principal.realUser.memLoginId}">개인정보 수정</a></li>
						<li><a href="${cPath }/web/updatePw.do?what=${autentication.principal.realUser.memLoginId}">비밀번호 변경</a></li>
						<li><a href="" onclick="del();">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-10 mypage-content">
				<h4>예약 조회</h4>
				<div>
					<table class="pay-res-info" id="inquire-page">
						<colgroup>
							<col width="10%" />
							<col width="20%" />
							<col width="12%" />
							<col width="12%" />
							<col width="12%" />
							<col width="12%" />
							<col width="5%" />
							<col width="12%" />
						</colgroup>
						<thead>
							<tr>
								<td>NO</td>
								<td>예약번호</td>
								<td>객실타입</td>
								<td>예약일</td>
								<td>입실일</td>
								<td>퇴실일</td>
								<td>숙박일</td>
								<td>결제금액(원)</td>
							</tr>
						</thead>
						<tbody id="list-body">
							<c:choose>
								<c:when test="${not empty revList }">
									<c:forEach items="${revList }" var="rev">
										<c:set value="${i+1 }" var="i"/>
										<tr>
											<td>${i }</td>
											<td>${rev.htrevId }</td>
											<td>${rev.roomtypeNm }</td>
											<td>${rev.trevDate }</td>
											<td>${rev.htrevChkin }</td>
											<td>${rev.htrevChkout }</td>
											<td>${rev.htrevStay }</td>
											<td style="text-align: right;">
											<fmt:formatNumber value="${rev.htrevTprice }" pattern="#,###"/>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8">예약내역이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<div class="paging">
					<div class="paging-area">
						${pagingHTML }
					</div>
				</div>
				<form:form id="searchform" method="get">
					<input type="hidden" name="what" value="${autentication.principal.realUser.memId }" />
					<input type="hidden" name="page" />
				</form:form>
			</div>
		</div>
	</div>

</section>
<script
	src="${pageContext.request.contextPath }/resources/js/app/utils/paging.js"></script>