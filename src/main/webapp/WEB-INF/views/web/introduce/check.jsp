<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<section id="login">
	<div class="dummy"></div>

	<div class="container">
		<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="tab" href="#tab-login-1">비회원 예약 확인</a></li>
		</ul>

		<div class="tab-content">
			<div id="tab-login-1" class="container tab-pane active">
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
									<button class="login-btn">예약 확인</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
