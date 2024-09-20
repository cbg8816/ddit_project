<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<section id="login" class="mypage">
	<div class="dummy"></div>

	<div class="container">
		<div class="row">
			<h3 class="page-title">마이페이지</h3>
			<div class="col-lg-2">
				<div class="mypage-menu">
					<ul>
						<li><a href="${cPath}/web/revPage.do?what=${autentication.principal.realUser.memId}">예약 조회</a></li>
						<li><a href="${cPath}/web/milPage.do?what=${autentication.principal.realUser.memId}">마일리지 조회</a></li>
						<li><a href="${cPath }/web/inquirePage.do?what=${autentication.principal.realUser.memId}">나의 문의내역</a></li>
<!-- 						<li><a href="">즐겨찾기 조회 / 취소</a></li> -->
						<li><a href="${cPath }/web/updatePage.do?what=${autentication.principal.realUser.memLoginId}">개인정보 수정</a></li>
						<li><a href="${cPath }/web/updatePw.do?what=${autentication.principal.realUser.memLoginId}">비밀번호 변경</a></li>
						<li><a href="#" onclick="del()">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-10 mypage-content">

			</div>
		</div>
	</div>

</section>
<script type="text/javascript">
		function del(){
			if(confirm("탈퇴하시겠습니까?") == true){
				location.href="${cPath }/web/delete.do?what=${autentication.principal.realUser.memLoginId}";
			}else{
				return false;
			}
		}
</script>