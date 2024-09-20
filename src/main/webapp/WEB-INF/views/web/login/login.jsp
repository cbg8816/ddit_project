<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<section id="login">
	<div class="dummy"></div>

	<div class="container">
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="tab" href="#tab-login-1">회원 로그인</a></li>
		</ul>

		<div class="tab-content">
			<div id="tab-login-1" class="container tab-pane active">
				<br>
				<div class="row">
					<div class="col-lg-12 login-tab-content">
						<div class="col-lg-5 login-box">
							<form method="post">
								<div class="login-div login-input">
									<input type="text" name="memLoginId" placeholder="아이디"/>
								</div>
								<div class="login-div login-input">
									<input type="password" name="memLoginPw" placeholder="비밀번호" />
								</div>
<!-- 								<div class="login-remember"> -->
<!-- 									<label class="input-container"> <input type="checkbox"> -->
<!-- 										<span class="checkmark"></span> -->
<!--                                             <span class="input-text">아이디 기억하기</span> -->
<!-- 									</label> -->
<!-- 								</div> -->
								<div class="login-div">
									<button class="login-btn">로그인</button>
								</div>
								<div class="other-login">
									<a href="javascript:;" onclick="fModalOpenIdChk()">아이디 찾기</a>
									<a href="javascript:;" onclick="fModalOpenPwChk()">비밀번호 찾기</a>
									<a href="${cPath }/web/member/insert.do">회원가입</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="tab-login-2" class="container tab-pane fade">
				<br>
				<div class="row">
					<div class="col-lg-12 login-tab-content">
						<div class="col-lg-5 login-box">
							<form>
								<div class="login-div login-input">
									<input type="text" placeholder="성명" />
								</div>
								<div class="login-div login-input">
									<input type="text" placeholder="전화번호" />
								</div>
								<div class="login-div">
									<button class="login-btn">비회원 로그인</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>

<div id="myModalIdChk">
	<div id="myContIdChk">
<!-- 		<span onclick="fModalCloseIdChk()" -->
<!-- 			style="cursor: pointer; display: block; text-align: right;"></span> -->
		<div class="text-end p-3">
			<button type="button" onclick="fModalCloseIdChk()"><i class="fa-solid fa-xmark"></i></button>
		</div>
		<div>
			<div class="modal-body web-modal-body">
				<form method="post">
						<h3 class="web-modal-title">아이디 찾기</h3>
						<table class="pay-res-info">
							<colgroup>
								<col width="20%" />
								<col width="50%" />
							</colgroup>
							<tr>
								<th>성명</th>
								<td><input class="res-pay-input" type="text" id="memName"/></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input class="res-pay-input" type="text" id="memTel" placeholder=" - 를 포함하여 입력해 주세요."/></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<td colspan="2"><button id="idChk-btn" class="login-btn" type="button">아이디 찾기</button></td> -->
<!-- 							</tr> -->
						</table>
						<div>
							<button id="idChk-btn" class="login-btn" type="button">아이디 찾기</button>
						</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div id="myModalPwChk">
	<div id="myContPwChk">
<!-- 		<span onclick="fModalClosePwChk()" -->
<!-- 			style="cursor: pointer; display: block; text-align: right;"><i class="fa-solid fa-x"></i></span> -->

		<div class="text-end p-3">
			<button type="button" onclick="fModalClosePwChk()"><i class="fa-solid fa-xmark"></i></button>
		</div>
		<div>
			<div class="modal-body web-modal-body">
				<form method="post">
						<h3 class="web-modal-title">비밀번호 찾기</h3>
						<table class="pay-res-info">
							<colgroup>
								<col width="20%" />
								<col width="50%" />
							</colgroup>
							<tr>
								<th>아이디</th>
								<td><input class="res-pay-input" type="text" id="memLoginId1"/></td>
							</tr>
							<tr>
								<th>성명</th>
								<td><input class="res-pay-input" type="text" id="memName1"/></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input class="res-pay-input" type="text" id="memTel1" placeholder=" - 를 포함하여 입력해 주세요."/></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<td colspan="2"><button id="pwChk-btn" class="login-btn" type="button">비밀번호 찾기</button></td> -->
<!-- 							</tr> -->
						</table>
						<div>
							<button id="pwChk-btn" class="login-btn" type="button">비밀번호 찾기</button>
						</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	// 아이디 찾기 모달
	const myModalIdChk = document.querySelector("#myModalIdChk");
	// 비밀번호 찾기 모달
	const myModalPwChk = document.querySelector("#myModalPwChk");
	// 아이디 찾기 모달 열기
	function fModalOpenIdChk() {
		myModalIdChk.style.display = "block";
	}
	// 아이디 찾기 모달 닫기
	function fModalCloseIdChk() {
		myModalIdChk.style.display = "none";
	}
	// 비밀번호 찾기 모달 열기
	function fModalOpenPwChk() {
		myModalPwChk.style.display = "block";
	}
	// 비밀번호 찾기 모달 닫기
	function fModalClosePwChk() {
		myModalPwChk.style.display = "none";
	}
</script>
<script src="${cPath }/resources/js/app/web/login/Chk.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>