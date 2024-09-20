<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section>
	<div class="svisual payment">
		PAYMENT<br> <b>결제</b>
	</div>

	<div class="container pay-content">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-title">결제완료</h3>
				<div class="page-progress">
					<div class="progress-info">
						<div class="progress-circle">
							<i class="fa-regular fa-calendar"></i>
						</div>
						<p>객실선택</p>
					</div>
					<div class="progress-next">
						<div class="circle"></div>
						<div class="circle"></div>
						<div class="circle"></div>
					</div>
					<div class="progress-info">
						<div class="progress-circle">
							<i class="fa-regular fa-credit-card"></i>
						</div>
						<p>결제</p>
					</div>
					<div class="progress-next">
						<div class="circle"></div>
						<div class="circle"></div>
						<div class="circle"></div>
					</div>
					<div class="progress-info">
						<div class="progress-circle active">
							<i class="fa-solid fa-check"></i>
						</div>
						<p>결제완료</p>
					</div>
				</div>
				<div>
					<p class="pay-com-title">결제가 완료 되었습니다.</p>
					<div class="pay-com-content">
					
						<c:if test="${workIn.trevRtype eq '01'}">
						<div class="payc-com-info">
							<div class="payc-room-img">
								<img src="${cPath }/resources/PMS/image/호텔객실1.jpg" alt="객실" />
							</div>
							<div class="payc-room-des">
								<p class="room-des-title">Standard</p>
								<p class="room-des-des">호텔의 기본 객실로, 편안하고 실용적인 공간을 제공합니다. 비즈니스 여행객이나 간단한 휴식을 원하는 고객에게 적합합니다.</p>
								<div class="room-in">
									<p>면적 : 15m²</p>
									<p>인원 : 2명</p>
									<p>베드 타입 : SINGLE/SINGLE</p>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${workIn.trevRtype eq '02'}">
						<div class="payc-com-info">
							<div class="payc-room-img">
								<img src="${cPath }/resources/PMS/image/호텔객실2.jpg" alt="객실" />
							</div>
							<div class="payc-room-des">
								<p class="room-des-title">Superior</p>
								<p class="room-des-des">스탠다드 객실보다 넓고 편안한 공간으로, 여유로운 휴식을 원하는 고객에게 추천합니다.</p>
								<div class="room-in">
									<p>면적 : 20m²</p>
									<p>인원 : 2명</p>
									<p>베드 타입 : SINGLE/SINGLE</p>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${workIn.trevRtype eq '03'}">
						<div class="payc-com-info">
							<div class="payc-room-img">
								<img src="${cPath }/resources/PMS/image/호텔객실3.jpg" alt="객실" />
							</div>
							<div class="payc-room-des">
								<p class="room-des-title">Deluxe</p>
								<p class="room-des-des">고급스러운 인테리어와 편의시설을 갖춘 객실로, 특별한 날을 더욱 빛내줄 것입니다.</p>
								<div class="room-in">
									<p>면적 : 24m²</p>
									<p>인원 : 2명</p>
									<p>베드 타입 : DOUBLE/DOUBLE</p>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${workIn.trevRtype eq '04'}">
						<div class="payc-com-info">
							<div class="payc-room-img">
								<img src="${cPath }/resources/PMS/image/호텔객실4.jpg" alt="객실" />
							</div>
							<div class="payc-room-des">
								<p class="room-des-title">Executive</p>
								<p class="room-des-des">특별한 서비스와 편의시설을 제공하는 고급 객실로, 비즈니스 고객이나 특별한 기념일을 보내는 고객에게 추천합니다. </p>
								<div class="room-in">
									<p>면적 : 27m²</p>
									<p>인원 : 4명</p>
									<p>베드 타입 : KING/KING</p>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${workIn.trevRtype eq '05'}">
						<div class="payc-com-info">
							<div class="payc-room-img">
								<img src="${cPath }/resources/PMS/image/호텔객실5.jpg" alt="객실" />
							</div>
							<div class="payc-room-des">
								<p class="room-des-title">Sweet</p>
								<p class="room-des-des"> 프라이빗하고 럭셔리한 휴식을 원하는 고객에게 최적의 선택입니다.</p>
								<div class="room-in">
									<p>면적 : 33m²</p>
									<p>인원 : 4명</p>
									<p>베드 타입 : KING/KING</p>
								</div>
							</div>
						</div>
						</c:if>
						<div class="payc-res-info">
							<p class="payc-res-info-title">예약자 정보</p>
							<dl>
								<dt>체크인/체크아웃</dt>
								<dd>${workIn.htrevChkin } ~ ${workIn.htrevChkout } (${workIn.htrevStay }박)</dd>
							</dl>
							<dl>
								<dt>예약자 이름</dt>
								<dd>${workIn.memName }</dd>
							</dl>
							<dl>
								<dt>인원</dt>
								<dd>${workIn.trevAdult }</dd>
							</dl>
							<dl>
								<dt>예약자 전화번호</dt>
								<dd>${workIn.memTel }</dd>
							</dl>
							<dl>
								<dt>차량 번호</dt>
								<dd>${workIn.trevCarno }</dd>
							</dl>
							<dl>
								<dt>예약일시</dt>
								<dd>${nowDate }</dd>
							</dl>
						</div>
					</div>
					<div class="payc-link-box">
						<a href="${cPath}/web/revPage.do?what=${autentication.principal.realUser.memId}">마이페이지</a>
						<a href="${cPath }/web/home.do">홈으로</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>