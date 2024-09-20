<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<section class="mypage">
	<div class="dummy"></div>
	<div class="container">
		<div class="row">
			<h3 class="page-title">나의 이용문의</h3>
			<div class="col-lg-2">
				<div class="mypage-menu">
					<h4>마이페이지</h4>
					<ul>
						<li><a href="${cPath}/web/revPage.do?what=${autentication.principal.realUser.memId}">예약 조회</a></li>
<!-- 						<li><a href="">즐겨찾기 조회 / 취소</a></li> -->
						<li><a href="${cPath}/web/milPage.do?what=${autentication.principal.realUser.memId}">마일리지 조회</a></li>
						<li><a class="active" href="${cPath }/web/inquirePage.do?what=${autentication.principal.realUser.memId}">나의 문의내역</a></li>
						<li><a href="${cPath }/web/updatePage.do?what=${autentication.principal.realUser.memLoginId}">개인정보 수정</a></li>
						<li><a href="${cPath }/web/updatePw.do?what=${autentication.principal.realUser.memLoginId}">비밀번호 변경</a></li>
						<li><a href="" onclick="del();">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-10 mypage-content">
				<h4>나의 이용문의</h4>
				<div>
					<table class="pay-res-info" id="inquire-page">
						<colgroup>
							<col width="10%" />
							<col width="3%" />
							<col width="12%" />
							<col width="35%" />
							<col width="10%" />
							<col width="20%" />
							<col width="10%" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th></th>
								<th>구분</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="list-body">
							<c:choose>
								<c:when test="${not empty inquireList }">
									<c:forEach items="${inquireList }" var="inquire">
									<c:set value="${i+1 }" var="i"/>
										<tr>
												<td>${i }</td>
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
											<td style="text-align: left;">
											<a href='${cPath}/web/inquire/detail.do?what=${inquire.inqNo}'>
											${fn:substring(inquire.inqTitle, 0, 30)}
											</a>
											</td>
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
					</table>
					<div class="d-flex justify-content-end" style="margin-top: 1rem;">
						<button id="inquire-btn" class="login-btn" style="margin-top: 0;" type="button" onclick="location.href='${cPath}/web/inquire/insert.do'">
							문의하기
						</button>
					</div>
					<div class="paging">
						<div class="paging-area">
							${pagingHTML }
						</div>
					</div>
				</div>
			</div>






			<form:form id="searchform" method="get">
				<input type="hidden" name="what" value="${autentication.principal.realUser.memId }" />
				<input type="hidden" name="page" />
			</form:form>
		</div>
	</div>

</section>
<script
	src="${pageContext.request.contextPath }/resources/js/app/utils/paging.js"></script>