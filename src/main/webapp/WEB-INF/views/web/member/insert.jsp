<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<section id="login">
	<div class="dummy"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<p class="page-title">회원가입</p>
				<div class="login-tab-content">
					<div class="col-lg-5 login-box">

						<form:form method="post" modelAttribute="member" id="req">
							<div class="login-div login-input">
								<form:input type="text" path="memLoginId" placeholder="아이디" autofocus="true"/>
								<button class="double-chk-btn" type="button">중복확인</button>
								<form:errors path="memLoginId" cssClass="text-danger" element="span" />
								<div id="msg"></div>
							</div>
							<div class="login-div login-input">
								<form:input type="password" path="memLoginPw" placeholder="비밀번호"/>
								<form:errors path="memLoginPw" cssClass="text-danger" element="span" />
							</div>
							<div class="login-div login-input">
								<input type="password" id="pwChk" placeholder="비밀번호 확인"/>
								<div id="msg2"></div>
							</div>
							<div class="login-div login-input">
								<form:input type="text" path="memName" placeholder="성명"/>
								<form:errors path="memName" cssClass="text-danger" element="span" />
							</div>
							<div class="login-div login-input">
								<form:input type="text" path="memTel" placeholder="전화번호는 - 를 포함하여 입력해 주세요."/>
								<form:errors path="memTel" cssClass="text-danger" element="span" />
							</div>
							<div class="login-div login-input">
								<form:input type="text" path="memEmail" placeholder="이메일"/>
								<form:errors path="memEmail" cssClass="text-danger" element="span" />
							</div>
							<div class="login-div">
								<button class="login-btn" type="submit" id="insert">회원가입</button>
							</div>
						</form:form>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="${cPath }/resources/js/app/web/member/insert.js"></script>