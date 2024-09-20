<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<section class="mypage">
	<div class="dummy"></div>
	<div class="container">
		<div class="row">
			<h3 class="page-title">개인정보 수정</h3>
			<div class="col-lg-2">
				<div class="mypage-menu">
					<h4>마이페이지</h4>
					<ul>
						<li><a href="${cPath}/web/revPage.do?what=${autentication.principal.realUser.memId}">예약 조회</a></li>
						<li><a href="${cPath}/web/milPage.do?what=${autentication.principal.realUser.memId}">마일리지 조회</a></li>
						<li><a href="${cPath }/web/inquirePage.do?what=${autentication.principal.realUser.memId}">나의 문의내역</a></li>
<!-- 						<li><a href="">즐겨찾기 조회 / 취소</a></li> -->
						<li><a class="active" href="${cPath }/web/updatePage.do?what=${autentication.principal.realUser.memLoginId}">개인정보 수정</a></li>
						<li><a href="${cPath }/web/updatePw.do?what=${autentication.principal.realUser.memLoginId}">비밀번호 변경</a></li>
						<li><a href="" onclick="del();">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-10 mypage-content">
				<h4 style="border-bottom: 2px solid; padding-bottom: 6px;">개인정보 수정</h4>
				<div>
					<form:form method="post" modelAttribute="member">
						<form:hidden path="memLoginId"/>
						<div class="password-change">
							<div class="d-flex justify-content-center align-items-center mb-2">
								<p class="me-3">성명</p>
								<div>
									<form:input type="text" path="memName" class="form-control"/>
									<form:errors path="memName" cssClass="text-danger" element="span" />
								</div>
							</div>
							<div class="d-flex justify-content-center align-items-center mb-2">
								<p class="me-3">전화번호</p>
								<div>
									<form:input type="text" path="memTel" class="form-control"/>
									<form:errors path="memTel" cssClass="text-danger" element="span" />
								</div>
							</div>
							<div class="d-flex justify-content-center align-items-center mb-5">
								<p class="me-3">이메일</p>
								<div>
									<form:input type="text" path="memEmail" class="form-control"/>
									<form:errors path="memEmail" cssClass="text-danger" element="span" />
								</div>
							</div>
							<div>
								<button id="inquire-btn-de" class="login-btn" type="submit">변경</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

</section>
<script type="text/javascript">
function list(){
	location.href="javascript:history.back()";
}
</script>