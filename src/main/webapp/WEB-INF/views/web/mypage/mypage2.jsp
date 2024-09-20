<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<section id="login">
	<div class="dummy"></div>

	<div class="container">
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="tab" href="#tab-login-1">마이페이지</a></li>
		</ul>

		<div class="tab-content">
			<div id="tab-login-1" class="container tab-pane active">
				<br>
				<div class="row">
					<div class="col-lg-12 login-tab-content">
						<div class="col-lg-5 login-box">
							<form>
								<div class="login-div">
									<button type="button" class="login-btn" onclick="mem()">개인정보 수정</button>
									<button type="button" class="login-btn" onclick="inq()">나의 문의내역</button>
									<button type="button" class="login-btn" onclick="rev()">예약 조회 / 취소</button>
<!-- 									<button class="login-btn">즐겨찾기 조회 / 취소</button> -->
									<button type="button" class="login-btn" onclick="mil()">마일리지 조회</button>
									<button type="button" class="login-btn" onclick="pw()">비밀번호 변경</button>
									<button type="button" class="login-btn" onclick="del()">회원탈퇴</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<script type="text/javascript">
	function mem(){
		location.href="${cPath }/web/updatePage.do?what=${autentication.principal.realUser.memLoginId}"
	}

	function inq(){
		location.href="${cPath }/web/inquirePage.do?what=${autentication.principal.realUser.memId}";
	}

	function rev(){
		location.href="${cPath}/web/revPage.do?what=${autentication.principal.realUser.memId}";
	}

	function mil(){
		location.href="${cPath}/web/milPage.do?what=${autentication.principal.realUser.memId}";
	}

	function pw(){
		location.href="${cPath }/web/updatePw.do?what=${autentication.principal.realUser.memLoginId}";
	}

	function del(){
		if(confirm("탈퇴하시겠습니까?") == true){
			location.href="${cPath }/web/delete.do?what=${autentication.principal.realUser.memLoginId}";
		}else{
			return false;
		}
	}
</script>